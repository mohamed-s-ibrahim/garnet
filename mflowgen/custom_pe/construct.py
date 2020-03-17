#! /usr/bin/env python
#=========================================================================
# construct.py
#=========================================================================
# Author : 
# Date   : 
#

import os
import sys

from mflowgen.components import Graph, Step

def construct():

  g = Graph()

  #-----------------------------------------------------------------------
  # Parameters
  #-----------------------------------------------------------------------

#     adk_name = 'tsmc16'
#     adk_view = 'stdview'
  adk_name = 'freepdk-45nm'
  adk_view = 'view-standard'

  parameters = {
    'construct_path'    : __file__,
    'design_name'       : 'Tile_PE',
    'clock_period'      : 10.0,
    'adk'               : adk_name,
    'adk_view'          : adk_view,
    # Synthesis
    'flatten_effort'    : 3,
    'topographical'     : False,
    # RTL Generation
    'interconnect_only' : True,
    'pe_design'         : 'lassen/examples/test_json.json',

    'testbench_name'    : 'TilePETb',
    'strip_path'        : 'TIlePETb/Tile_PE_inst'
  }

  #-----------------------------------------------------------------------
  # Create nodes
  #-----------------------------------------------------------------------

  this_dir = os.path.dirname( os.path.abspath( __file__ ) )

  # ADK step

  g.set_adk( adk_name )
  adk = g.get_adk_step()

  # Custom steps

  rtl                  = Step( this_dir + '/rtl'                         )
  constraints          = Step( this_dir + '/constraints'                           )
  custom_init          = Step( this_dir + '/custom-init'                           )
  custom_power         = Step( this_dir + '/../common/custom-power-leaf'           )
  genlibdb_constraints = Step( this_dir + '/../common/custom-genlibdb-constraints' )
  testbench            = Step( this_dir + '/testbench'     )

  vcs_sim              = Step( this_dir + '/synopsys-vcs-sim')
  rtl_sim              = vcs_sim.clone()
  rtl_sim.set_name( 'rtl-sim' )
  pt_power_rtl  = Step( this_dir + '/synopsys-ptpx-rtl')
  #gl_sim               = vcs_sim.clone()
  #gl_sim.set_name( 'gl-sim' )

  # Default steps

  info         = Step( 'info',                          default=True )
  #constraints  = Step( 'constraints',                   default=True )
  dc           = Step( 'synopsys-dc-synthesis',         default=True )
  iflow        = Step( 'cadence-innovus-flowsetup',     default=True )
  init         = Step( 'cadence-innovus-init',          default=True )
  power        = Step( 'cadence-innovus-power',         default=True )
  place        = Step( 'cadence-innovus-place',         default=True )
  cts          = Step( 'cadence-innovus-cts',           default=True )
  postcts_hold = Step( 'cadence-innovus-postcts_hold',  default=True )
  route        = Step( 'cadence-innovus-route',         default=True )
  postroute    = Step( 'cadence-innovus-postroute',     default=True )
  signoff      = Step( 'cadence-innovus-signoff',       default=True )
  pt_signoff   = Step( 'synopsys-pt-timing-signoff',    default=True )
  genlibdb     = Step( 'synopsys-ptpx-genlibdb',        default=True )
  gdsmerge     = Step( 'mentor-calibre-gdsmerge',       default=True )
  drc          = Step( 'mentor-calibre-drc',            default=True )
  lvs          = Step( 'mentor-calibre-lvs',            default=True )
  debugcalibre = Step( 'cadence-innovus-debug-calibre', default=True )
  gen_saif     = Step( 'synopsys-vcd2saif-convert',     default=True )
  gen_saif_rtl = gen_saif.clone()
  gen_saif_rtl.set_name( 'gen-saif-rtl' )
  #gen_saif_gl  = gen_saif.clone()
  #gen_saif_gl.set_name( 'gen-saif-gl' )
  #pt_power_gl  = Step( 'synopsys-ptpx-gl',              default=True )
 

  # Add extra input edges to innovus steps that need custom tweaks

  init.extend_inputs( custom_init.all_outputs() )
  power.extend_inputs( custom_power.all_outputs() )
  genlibdb.extend_inputs( genlibdb_constraints.all_outputs() )

  #-----------------------------------------------------------------------
  # Graph -- Add nodes
  #-----------------------------------------------------------------------

  g.add_step( info                     )
  g.add_step( rtl                      )
  g.add_step( testbench                )
  g.add_step( rtl_sim                  )
  g.add_step( constraints              )
  g.add_step( dc                       )
  g.add_step( iflow                    )
  g.add_step( init                     )
  g.add_step( custom_init              )
  g.add_step( power                    )
  g.add_step( custom_power             )
  g.add_step( place                    )
  g.add_step( cts                      )
  g.add_step( postcts_hold             )
  g.add_step( route                    )
  g.add_step( postroute                )
  g.add_step( signoff                  )
  g.add_step( pt_signoff               )
  g.add_step( genlibdb_constraints     )
  g.add_step( genlibdb                 )
  g.add_step( gdsmerge                 )
  g.add_step( drc                      )
  g.add_step( lvs                      )
  g.add_step( debugcalibre             )
  g.add_step( gen_saif_rtl             )
  g.add_step( pt_power_rtl             )
  #g.add_step( gl_sim                   )
  #g.add_step( gen_saif_gl              )
  #g.add_step( pt_power_gl              )


  #-----------------------------------------------------------------------
  # Graph -- Add edges
  #-----------------------------------------------------------------------

  # Connect by name

  g.connect_by_name( adk,      dc           )
  g.connect_by_name( adk,      iflow        )
  g.connect_by_name( adk,      init         )
  g.connect_by_name( adk,      power        )
  g.connect_by_name( adk,      place        )
  g.connect_by_name( adk,      cts          )
  g.connect_by_name( adk,      postcts_hold )
  g.connect_by_name( adk,      route        )
  g.connect_by_name( adk,      postroute    )
  g.connect_by_name( adk,      signoff      )
  g.connect_by_name( adk,      gdsmerge     )
  g.connect_by_name( adk,      drc          )
  g.connect_by_name( adk,      lvs          )
  g.connect_by_name( adk,       pt_power_rtl )
  #g.connect_by_name( adk,      pt_power_gl  )

  g.connect_by_name( rtl,         dc        )
  g.connect_by_name( constraints, dc        )
  g.connect_by_name( gen_saif_rtl, dc       ) # run.saif
 
  g.connect_by_name( rtl,          rtl_sim      ) # design.v
  g.connect_by_name( testbench,    rtl_sim      ) # testbench.sv
  g.connect_by_name( rtl_sim,      gen_saif_rtl ) # run.vcd

  g.connect_by_name( dc,       iflow        )
  g.connect_by_name( dc,       init         )
  g.connect_by_name( dc,       power        )
  g.connect_by_name( dc,       place        )
  g.connect_by_name( dc,       cts          )
  g.connect_by_name( dc,       pt_power_rtl ) # design.namemap

  g.connect_by_name( iflow,    init         )
  g.connect_by_name( iflow,    power        )
  g.connect_by_name( iflow,    place        )
  g.connect_by_name( iflow,    cts          )
  g.connect_by_name( iflow,    postcts_hold )
  g.connect_by_name( iflow,    route        )
  g.connect_by_name( iflow,    postroute    )
  g.connect_by_name( iflow,    signoff      )

  g.connect_by_name( custom_init,  init     )
  g.connect_by_name( custom_power, power    )

  g.connect_by_name( init,         power        )
  g.connect_by_name( power,        place        )
  g.connect_by_name( place,        cts          )
  g.connect_by_name( cts,          postcts_hold )
  g.connect_by_name( postcts_hold, route        )
  g.connect_by_name( route,        postroute    )
  g.connect_by_name( postroute,    signoff      )
  g.connect_by_name( signoff,      gdsmerge     )
  g.connect_by_name( signoff,      drc          )
  g.connect_by_name( signoff,      lvs          )
  g.connect_by_name( gdsmerge,     drc          )
  g.connect_by_name( gdsmerge,     lvs          )

  g.connect_by_name( signoff,              genlibdb )
  g.connect_by_name( adk,                  genlibdb )
  g.connect_by_name( genlibdb_constraints, genlibdb )

  g.connect_by_name( adk,          pt_signoff   )
  g.connect_by_name( signoff,      pt_signoff   )

  g.connect_by_name( signoff,      pt_power_rtl )
  g.connect_by_name( gen_saif_rtl, pt_power_rtl ) # run.saif
  #g.connect_by_name( signoff,      pt_power_gl  )
  #g.connect_by_name( gen_saif_gl,  pt_power_gl  ) # run.saif

  #g.connect_by_name( adk,          gl_sim       )
  #g.connect_by_name( signoff,      gl_sim       ) # design.vcs.v
  #g.connect_by_name( pt_signoff,   gl_sim       ) # design.sdf
  #g.connect_by_name( testbench,    gl_sim       ) # testbench.sv
  #g.connect_by_name( gl_sim,       gen_saif_gl  ) # run.vcd

  g.connect_by_name( adk,      debugcalibre )
  g.connect_by_name( dc,       debugcalibre )
  g.connect_by_name( iflow,    debugcalibre )
  g.connect_by_name( signoff,  debugcalibre )
  g.connect_by_name( drc,      debugcalibre )
  g.connect_by_name( lvs,      debugcalibre )

  #-----------------------------------------------------------------------
  # Parameterize
  #-----------------------------------------------------------------------

  g.update_params( parameters )

  # Since we are adding an additional input script to the generic Innovus
  # steps, we modify the order parameter for that node which determines
  # which scripts get run and when they get run.

  # init -- Add 'add-endcaps-welltaps.tcl' after 'floorplan.tcl'

  order = init.get_param('order') # get the default script run order
  floorplan_idx = order.index( 'floorplan.tcl' ) # find floorplan.tcl
  order.insert( floorplan_idx + 1, 'add-endcaps-welltaps.tcl' ) # add here
  init.update_params( { 'order': order } )

  # Adding new input for genlibdb node to run

  genlibdb.update_params(
    {'order': "\"read_design.tcl genlibdb-constraints.tcl extract_model.tcl\""}
  )

  return g


if __name__ == '__main__':
  g = construct()
#  g.plot()


