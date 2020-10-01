#!/bin/bash
mflowgen run --design $GARNET_HOME/mflowgen/global_controller/
make cadence-genus-genlib
make mentor-calibre-gdsmerge
make mentor-calibre-lvs
mkdir -p outputs
cp -L *cadence-genus-genlib/outputs/design.lib outputs/global_controller_tt.lib
cp -L *cadence-innovus-signoff/outputs/design.lef outputs/global_controller.lef
cp -L *cadence-innovus-signoff/outputs/design.vcs.v outputs/global_controller.vcs.v
cp -L *cadence-innovus-signoff/outputs/design.sdf outputs/global_controller.sdf
cp -L *mentor-calibre-gdsmerge/outputs/design_merged.gds outputs/global_controller.gds
cp -L *mentor-calibre-lvs/outputs/design_merged.lvs.v outputs/global_controller.lvs.v

