#=========================================================================
# pin-assignments.tcl
#=========================================================================
# Author : 
# Date   : 

#-------------------------------------------------------------------------
# Pin Assignments
#-------------------------------------------------------------------------

# Take all ports and split into halves

set all_ports       [dbGet top.terms.name -v *clk*]

set num_ports       [llength $all_ports]
set half_ports_idx  [expr $num_ports / 2]

set pins_left_half  [lrange $all_ports 0               [expr $half_ports_idx - 1]]
set pins_right_half [lrange $all_ports $half_ports_idx [expr $num_ports - 1]     ]

# Take all clock ports and place them center-left

set clock_ports     [dbGet top.terms.name *clk*]
set half_left_idx   [expr [llength $pins_left_half] / 2]

if { $clock_ports != 0 } {
  for {set i 0} {$i < [llength $clock_ports]} {incr i} {
    set pins_left_half \
      [linsert $pins_left_half $half_left_idx [lindex $clock_ports $i]]
  }
}

# set ports_layer M4
# editPin -layer $ports_layer -pin $pins_left_half  -side LEFT  -spreadType SIDE
# editPin -layer $ports_layer -pin $pins_right_half -side RIGHT -spreadType SIDE

set width [dbGet top.fPlan.box_urx]
set height [dbGet top.fPlan.box_ury]

editPin -pin [get_property [get_ports] hierarchical_name] -start [list 5 $height] -end [list [expr {$width - 5}] $height] -side TOP -spreadType RANGE -spreadDirection clockwise -layer M5

#source $vars(plug_dir)/tile_io_place.tcl
#set ns_io_offset [expr ($core_width - $ns_io_width) / 2] 
#set ew_io_offset [expr ($core_height - $ew_io_width) / 2]
#place_ios $width $height $ns_io_offset $ew_io_offset


