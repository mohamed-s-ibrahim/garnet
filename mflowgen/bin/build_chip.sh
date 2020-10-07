# 10/2020 Never used yet, I think, FIXME should probably delete
# and/or remove from repo...
# Replaced by similarly-named 'buildchip.sh' maybe...


# This script, auto-generated by '/home/steveri/tmpdir/pipegen.sh', builds our entire chip
# Recommend that you have at least 100G of space available before launch...
# Usage: $0

# Logs go to to next avail directory logs00/, logs01/, logs02/ ...
i=0; ii=00; while test -e logs.$ii; do ((i+=1)); ii=`printf "%02d" $i`; done
LD=logs.$ii; mkdir $LD

set -x
make rtl                            >& $LD/make-rtl.log          || exit 13
make tile_array                     >& $LD/make-tile_array.log   || exit 13
make glb_top                        >& $LD/make-glb_top.log      || exit 13
make global_controller              >& $LD/make-GLC.log          || exit 13
make dragonphy                      >& $LD/make-dragonphy.log    || exit 13
make soc-rtl                        >& $LD/make-soc-rtl.log      || exit 13
make synopsys-dc-synthesis          >& $LD/make-syn.log          || exit 13
make cadence-innovus-cts            >& $LD/make-cts.log          || exit 13
make cadence-innovus-place          >& $LD/make-place.log        || exit 13
make cadence-innovus-route          >& $LD/make-route.log        || exit 13
make cadence-innovus-postroute      >& $LD/make-postroute.log    || exit 13
make cadence-innovus-postroute_hold >& $LD/make-hold.log         || exit 13
make mentor-calibre-lvs             >& $LD/make-lvs.log          || exit 13
make mentor-calibre-drc             >& $LD/make-drc.log          || exit 13
