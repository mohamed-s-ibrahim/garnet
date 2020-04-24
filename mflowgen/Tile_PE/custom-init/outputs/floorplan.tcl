#=========================================================================
# floorplan.tcl
#=========================================================================
# This script is called from the Innovus init flow step.
#
# Author : Christopher Torng
# Date   : March 26, 2018

#-------------------------------------------------------------------------
# Floorplan variables
#-------------------------------------------------------------------------

# Density target: width will be adjusted to meet this cell density
set core_density_target 0.60; # Placement density of 70% is reasonable
# Core height : number of vertical pitches in height of core area
# We fix this value because the height of the memory and PE tiles
# must be the same to allow for abutment at the top level
set core_height 139

# Make room in the floorplan for the core power ring

set pwr_net_list {VDD VSS}; # List of power nets in the core power ring

set M1_min_width   [dbGet [dbGetLayerByZ 1].minWidth]
set M1_min_spacing [dbGet [dbGetLayerByZ 1].minSpacing]

set savedvars(p_ring_width)   [expr 48 * $M1_min_width];   # Arbitrary!
set savedvars(p_ring_spacing) [expr 24 * $M1_min_spacing]; # Arbitrary!

set vert_pitch [dbGet top.fPlan.coreSite.size_y]
set height [expr $core_height * $vert_pitch]

# Now begin width calculation
# Get the combined area of all cells in the design
set cell_areas [get_property [get_cells *] area]
set total_cell_area 0
foreach area $cell_areas {
  set total_cell_area [expr $total_cell_area + $area]
}

# Calculate FP width that will meet density target given fixed height 
set width [expr $total_cell_area / $core_density_target / $height]

# Core bounding box margins

set core_margin_t [expr ([llength $pwr_net_list] * ($savedvars(p_ring_width) + $savedvars(p_ring_spacing))) + $savedvars(p_ring_spacing)]
set core_margin_b [expr ([llength $pwr_net_list] * ($savedvars(p_ring_width) + $savedvars(p_ring_spacing))) + $savedvars(p_ring_spacing)]
set core_margin_r [expr ([llength $pwr_net_list] * ($savedvars(p_ring_width) + $savedvars(p_ring_spacing))) + $savedvars(p_ring_spacing)]
set core_margin_l [expr ([llength $pwr_net_list] * ($savedvars(p_ring_width) + $savedvars(p_ring_spacing))) + $savedvars(p_ring_spacing)]

#-------------------------------------------------------------------------
# Floorplan
#-------------------------------------------------------------------------

floorPlan -s $width $height \
             $core_margin_l $core_margin_b $core_margin_r $core_margin_t

setFlipping s

# create always on domain region
if $::env(PWR_AWARE) {
   #TODO: Move this to globalconnect file
   set init_pwr_net VDD
   set init_gnd_net VSS
   read_power_intent -1801 /home/ankitan/upf_Tile_PE.tcl
   commit_power_intent
   write_power_intent -1801 upf.out
   globalNetConnect VDD_SW -type tiehi -powerdomain TOP
   globalNetConnect VDD    -type tiehi -powerdomain AON
   globalNetConnect VSS -type tielo
   globalNetConnect VDD -type pgpin -pin VPP -inst *
   globalNetConnect VSS -type pgpin -pin VBB -inst *
   ##AON Region Bounding Box
   puts "##AON Region Bounding Box"
   set offset 4.7
   #4.1
   set aon_width 14
   set aon_height 14
   # Get all tech vars
   #source inputs/adk/params.tcl
   source /home/ankitan/params.tcl
   set aon_height_snap [expr ceil($aon_height/$polypitch_y)*$polypitch_y]
   set aon_lx [expr $width/2 - $aon_width/2 + $offset -10 - 0.18]
   set aon_lx_snap [expr ceil($aon_lx/$polypitch_x)*$polypitch_x]
   set aon_ux [expr $width/2 + $aon_width/2 + $offset - 3]
   set aon_ux_snap [expr ceil($aon_ux/$polypitch_x)*$polypitch_x]
   modifyPowerDomainAttr AON -box $aon_lx_snap  [expr $height - $aon_height_snap - 10*$polypitch_y] $aon_ux_snap [expr $height - 10*$polypitch_y]  -minGaps $polypitch_y $polypitch_y [expr $polypitch_x*6] [expr $polypitch_x*6]
}

