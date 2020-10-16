#!/bin/bash

########################################################################
# Where this script lives

scriptdir=${0%/*} ; # Similar to csh $0:h
[ "$scriptdir" == "$0" ] && scriptdir="."
script_home=`cd $scriptdir; pwd`


########################################################################
# Default ci_dir for each host

ci_dir=/proj/forward/CI ;  # For VDE
[ `hostname` == "r7arm-aha" ] && ci_dir=/build/CI ; # for ARM

# kiwi is for debugging the script
if [ `hostname` == "kiwi" ]; then
    ci_dir=/tmp/deleteme.buildchip.CI
    test -e $ci_dir || mkdir -p $ci_dir
fi


########################################################################
# HELP
cmd=$(basename $0)
function Help {
    cat <<EOF

Description: Manual CI for garnet full_chip build

Usage:
   $cmd [ --retry <dir> ]

CI build directory:
   kiwi: /tmp/deleteme.buildchip.CI/full_chip.<n>
   vde:  /proj/forward/CI/full_chip.<n>
   arm7: /build/CI/full_chip.<n>

CI build history:
   kiwi: /tmp/deleteme.buildchip.CI/full_chip.HIST
   vde:  /proj/forward/CI/full_chip.HIST
   arm7: /build/CI/full_chip.HIST

Options:
    '--retry <dir>' attempts to restart an existing failed build <dir>
    (Aliases for --retry include --restart, --continue, --cont ...)

Examples:
   # Build full_chip in e.g. new dir "/build/CI/full_chip.23"
   $cmd

   # Retry failed build in dir "/build/CI/full_chip.117"
   $cmd --retry /build/CI/full_chip.117

EOF
}

########################################################################
# command-line args
ACTION=new
VERBOSE=

while [ $# -gt 0 ] ; do
    case "$1" in
        -v|--verbose) VERBOSE=true ;;
        -q|--quiet)   VERBOSE= ;;
        -h|--help)    Help; exit ;;
        
        # retry, restart, cont, continue...
        --re*)   ACTION=old; shift; build_dir=$1 ;;
        --cont*) ACTION=old; shift; build_dir=$1 ;;
        
        *) echo "**ERROR: Unrecognized command-line arg '$1'"; Help; exit 13; ;;
    esac
    shift
done

[ "$VERBOSE" ] && echo ACTION=$ACTION

# FIXME should maybe check and err if `basename $build_dir` != $ci_dir
# if [ "$ACTION" == "old" ]; then ci_dir=$(dirname $build_dir)

echo "Using CI directory ci_dir='$ci_dir'"
echo ""

########################################################################
# Find global CI log dir responsible for coordinating all the builds,
# e.g. "/build/CI/full_chip.HIST"
build=full_chip
logdir=$ci_dir/$build.HIST ; # E.g. "/build/CI/full_chip.HIST"
if ! (test -d $logdir && test -w $logdir); then
    echo "**ERROR: logdir $logdir not found or not writeable"
    echo "Maybe you should do: mkdir -p $logdir"
    exit 13
fi

if [ "$ACTION" == "new" ]; then

    ########################################################################
    # Use history in global logdir to find next-seq no. for this new build

    # E.g. logdir=/tmp/deleteme.buildchip.CI/full_chip.HIST
    pushd $logdir
      n=$(\ls -d $build.* |& \egrep "^$build.[0-9]*" | # full_chip.{0,1,83,112...}
        sed "s|^$build.||" |                           # {0,1,83,112...}
        sort -n | tail -1)                             # 112
      echo $n
    popd

    # E.g. build='full_chip.113'
    build=$build.0
    [ "$n" ] && build=$build.$((n+1))   # E.g. 'full_chip.14'

    log=$logdir/$build        # E.g. '/build/CI/full_chip.HIST/full_chip.14'
    build_dir=$ci_dir/$build  # E.g. '/build/full_chip.HIST/full_chip.14'

    ########################################################################
    # Build the chip

    echo ""
    echo "Calling subcommand:"
    echo "    buildchip.sh --new $build_dir \\"
    echo "        |& tee $log"; echo ""

    ########################################################################
    # $garnet/mflowgen/bin/buildchip.sh --new $build_dir |& tee $log
    $script_home/buildchip.sh --new $build_dir |& tee $log
    ########################################################################

elif  [ "$ACTION" == "old" ]; then

    # FIXME should maybe check and err if `basename $build_dir` != $ci_dir
    # either here or above
    # if [ "$ACTION" == "old" ]; then ci_dir=$(dirname $build_dir)

    # build_dir should have been specified on command line
    # FIXME/TODO could be specified as one of
    #    bt --retry /tmp/deleteme.buildchip.CI/full_chip.7
    #    bt --retry full_chip.7
    #    bt --retry 7

    build_num=` expr $build_dir : '^[^0-9]*\([0-9]*\)'` ; # E.g. "7"
    build=$build.$build_num   ; # E.g. 'full_chip.7'
    log=$logdir/$build        ; # E.g. '/build/CI/full_chip.HIST/full_chip.7'
    build_dir=$ci_dir/$build  ; # E.g. '/build/full_chip.HIST/full_chip.7'

    # basename $build_dir -- to find "full_chip.7"
    # log=$logdir/full_chip.7 or something

    cd $build_dir
    if ! test -e $build_dir; then 
        echo "**ERROR: Cannot find specified build dir '$build_dir'"; Help; exit 13
    fi
    
    ########################################################################
    $script_home/buildchip.sh --retry $build_dir |& tee $log
    ########################################################################
fi

exit

# echo FOO; exit


# # If no existing dir specified, build a new dir 'full_chip.<n>'
# if [ "$1" == "--restart" ]; then
#     if [ "$2" == "" ]; then echo ERROR; exit 13; fi
#     build_dir=$2
#     echo "Building in existing dir '$build_dir'"
# else
#     # Build a new directory $CI/full_chip.<n>
#     CI=/proj/forward/CI
#     build_dir=`get_next_name $CI/build`
#     mkdir -p $build_dir
#     echo "Building in new dir '$build_dir'"
# fi
# 
# cd $build_dir

$garnet/mflowgen/bin/buildchip.sh


exit
##############################################################################
##############################################################################
##############################################################################

# UNIT TESTS on kiwi

alias bt='/nobackup/steveri/github/garnet/mflowgen/bin/bigtest.sh'
cd /tmp/deleteme.buildchip.CI
i=0

c; log=bc.log.$((i++)); echo "less $log"; bt |& tee $log

bt --retry /tmp/deleteme.buildchip.CI/full_chip.7
bt --retry full_chip.7
bt --retry 7




# fc='full_chip.3'
fc=`/bin/ls -td full* | head -1`; echo "fc='$fc'"

for f in $fc/logs.00/*; do echo $f:; sed 's/^/  /' $f ; echo ""; done
# full_chip.3/logs.00/make11-hold.log:
#   PASS make cadence-innovus-postroute_hold
# 
# full_chip.3/logs.00/make12-lvs.log:
#   FAIL make mentor-calibre-lvs
#   **ERROR: Failed in LVS

flog=`/bin/ls -td *HIST/* | head -1`; echo "flog='$flog'"
less $flog


##############################################################################

# ???
# Sequence:
#    ssh buildkite-agent@r7arm-aha
#    cd /build/CI; $garnet/bin/mflowgen/buildchip.sh |& tee buildchip.log






#unit tests - r7arm
if [ ] ; then
# alias bc=~/buildchip.sh
alias bc=$garnet/mflowgen/bin/bigtest.sh
# mkdir /tmp/deleteme; cd /tmp/deleteme

test -e /tmp/deleteme.buildchip.CI || mkdir -p /tmp/deleteme.buildchip.CI
cd /tmp/deleteme.buildchip.CI

# bc --new /tmp/deleteme
# c; bc --new foo |& tee bc.log | less
c; bc |& tee bc.log



ls /tmp/deleteme.buildchip.CI/full_chip.HIST
#     full_chip.0    full_chip.109  full_chip.15  full_chip.26
#     full_chip.1    full_chip.11   full_chip.16  full_chip.27
#     ...




bc |& tee bc.log
#     make rtl                            >& logs.08/make-rtl.log
#     make tile_array                     >& logs.08/make-tile_array.log
#     make glb_top                        >& logs.08/make-glb_top.log
#     ...
#     make mentor-calibre-lvs             >& logs.08/make-lvs.log
#     **ERROR: Failed in LVS
logdir=logs.09
(for l in `ls -rt $logdir`; do cat $logdir/$l; done)

bc --new /tmp/deleteme


fi




########################################################################
# OLD




# '--retry' does this:
# 
# If <dir> exists, cd to that dir and build the chip.
# Because of how make dependences work, it should resume from wherever
# the previous build left off.




# Given CI directory CI e.g. CI=/proj/forward/CI;
# finds and builds next dir

# Does one of two things:
# - build new chip starting from scratch
# - continues an existing build starting from where prev build left off (crashed)

# Given a directory containing various file/dir names <rootname>.<n>, e.g.
# "foo.0 foo.1 ... foo.101", returns next sequential filename e.g. "foo.102"
# Examples:
#    $0 build                     => build.0
#    $0 /tmp/deleteme.10329/build => /tmp/deleteme.10329/build.103

##############################################################################
# UNUSED MFLOWGEN_HOME stuff
# if [ "$MFLOWGEN_HOME" ]; then
#     echo "Found existing MFLOWGEN_HOME='$MFLOWGEN_HOME'; hope that's correct...!"
# fi
# 
#     kiwi)      mdefault=/nobackup/steveri/github/mflowgen ;;
#     r7arm-aha) mdefault=/sim/buildkite-agent/mflowgen ;;
#                
# [ "$MFLOWGEN_HOME" ] || export MFLOWGEN_HOME=$mdefault
# echo "Using MFLOWGEN_HOME='$MFLOWGEN_HOME'"

########################################################################
# DELETEME

    # Maybe build numbers are coordinated by a world-writable build-manager directory
    # full of build logs e.g. /build/buildchip_logs/{full_chip.0,full_chip.1,full_chip.2...}

#     logdir=/proj/forward/CI/full_chip.HIST ;  # For VDE
#     [ `hostname` == "r7arm-aha" ] && logdir=/build/CI/full_chip.HIST ; # for ARM
# 
#     # kiwi is for debugging the script
#     if [ `hostname` == "kiwi" ]; then
#         logdir=/tmp/deleteme.buildchip.CI/full_chip.HIST
#         test -e $logdir || mkdir $logdir
#     fi
    

########################################################################
# Now done by 'buildchip'
# 
#     # echo `date` $build | tee $log
#     # Remember, if we get this far we're already logging to $log (see 'exec' above)
#     echo `date` $build
#     echo "Initiating new build in dir '$build_dir'"
#     echo mkdir -p $build_dir; mkdir -p $build_dir
#     echo cd       $build_dir; cd       $build_dir
#     echo "Log file = '$log'"
# 
#     # kiwi is for debugging the script
#     if [ `hostname` == "kiwi" ]; then
#         echo "okay we're debugged already"; exit
#     fi
# 
# 
#     ########################################################################
#     # Build the chip, with output to the log.
#     # Set pipefail so we get the correct exit status.
# 
#     if [ `hostname` == "r7arm-aha" ]; then
# 
#         if ! [ "$USER" == "buildkite-agent" ]; then
#             echo "**ERROR: you are not buildkite-agent, this will not work"
#             exit 13
#         fi
# 
#         # Do I want to do this?
#         # FIXME if we're gonna do it, we should do it up at the top
#         if [ "$GARNET_HOME" ]; then
#             echo "Found existing GARNET_HOME='$GARNET_HOME'; hope that's correct...!"
#         else
#             function where_this_script_lives {
#                 s=${BASH_SOURCE[0]}
#                 scriptpath=$s      # E.g. "build_tarfile.sh" or "foo/bar/build_tarfile.sh"
#                 scriptdir=${s%/*}  # E.g. "build_tarfile.sh" or "foo/bar"
#                 if test "$scriptdir" == "$scriptpath"; then scriptdir="."; fi
#                 # scriptdir=`cd $scriptdir; pwd`
#                 (cd $scriptdir; pwd)
#             }
#             script_home=`where_this_script_lives`
#             export GARNET_HOME=`cd $script_home/../..; pwd`
#             echo "Setting GARNET_HOME='$GARNET_HOME'; hope that's correct...!"
#         fi
#         echo sourcing things
#         need_space=100G
# 
#         # Setup script "source setup-buildkite.sh --dir <d>" does the following:
#         #   - if unset yet, sets GARNET_HOME to wherever the setup script lives
#         #   - checks <d> for sufficient disk space;
#         #   - sets TMPDIR to /sim/tmp
#         #   - sets python env BUT ONLY if you're running as buildkite-agent
#         #   - source garnet-setup.sh for CAD paths
#         #   - *finds or creates requested build directory <d>*
#         #   - makes local link to mflowgen repo "/sim/buildkite-agent/mflowgen"
#         #   - makes local copy of adk
# 
#         # We still need/want this, right? Not sure how it's gonnna work on VDE
#         garnet=$GARNET_HOME
#         echo "Sourcing 'setup-buildkite.sh'..."
#         source $GARNET_HOME/mflowgen/bin/setup-buildkite.sh \
#                --dir $build_dir \
#                --need_space $need_space \
#             || exit 13
# 
#         # If there's already a valid garnet in top level, use that
#         top=`cd ..; pwd`
#         echo "Look for existing garnet repo $top/garnet"
#         if test -d $top/garnet; then
#             echo "Found existing garnet repo $top/garnet"
#             # (cd $top/garnet; git pull; git checkout adad99d)
#             export GARNET_HOME=$top/garnet
#         else
#             gtmp=/sim/tmp/deleteme.garnet
#             echo "Could not find existing garnet repo '$top/garnet'"
#             echo "Cloning a new repo in '$gtmp'"
#             test -e $gtmp && /bin/rm -rf $gtmp
#             mkdir -p $gtmp
#             git clone https://github.com/StanfordAHA/garnet $gtmp
#             export GARNET_HOME=$gtmp
#         fi
#         echo "Checking out last known good version #adad99d"
#         (cd $GARNET_HOME; git checkout adad99d)
#         git log | head
#     fi
#     
#     which mflowgen
#     mflowgen run --design $GARNET_HOME/mflowgen/full_chip || exit 13

########################################################################
# no longer needed maybe?
#     set -o pipefail; exec $0 --make_only |& tee -a $log
#     echo foo we should not be here...
# 
#     # Unit test:
#     if [ ]; then 
#         echo $0 --new /tmp/deleteme
#     fi


