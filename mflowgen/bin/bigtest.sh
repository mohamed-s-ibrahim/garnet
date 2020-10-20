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
   $cmd [ --retry <dir> ] gd[ --status latest ] [ --status all ]

CI build directory:
   kiwi: /tmp/deleteme.buildchip.CI/full_chip/build.<n>
   vde:  /proj/forward/CI/full_chip/build.<n>
   arm7: /build/CI/full_chip/build.<n>

Options:
    '--retry <dir>' attempts to restart an existing failed build <dir>
    (Aliases for --retry include --restart, --continue, --cont ...)

    '--status all'    show status of all builds
    '--status latest' status of latest build only (default)

Examples:
   # Build full_chip in e.g. new dir "/build/CI/full_chip/build.23"
   $cmd

   # Retry failed build in dir "/build/CI/full_chip/build.117"
   $cmd --retry /build/CI/full_chip/build.117

EOF
}

########################################################################
# command-line args

# defaults
STATUS_ACTION=latest
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
        
        --status) ACTION=status; shift;
                  if expr "$1" : '[^-]' > /dev/null; then
                      STATUS_ACTION=$1; shift; # 'latest' or 'all'
                  fi ;;

        *) echo "**ERROR: Unrecognized command-line arg '$1'"; Help; exit 13; ;;
    esac
    shift
done
[ "$VERBOSE" ] && echo ACTION=$ACTION

########################################################################
# --status :: if requested, emit status and exit
if [ "$ACTION" == "status" ]; then
    [ "$VERBOSE" ] && echo STATUS_ACTION=$STATUS_ACTION
    [ "$VERBOSE" ] && echo ci_dir=$ci_dir
    # for f in `\ls -t /build/CI/full_chip/build.*`; do
    for f in `\ls -t $ci_dir/full_chip/build.*/buildchip.log`; do
        hline='------------------------------------'
        echo $hline$hline
        echo STATUS $f
        echo $hline$hline
        egrep 'PASS|FAIL|ERROR' $f
        # DONE if only want status of latest build
        [ "$STATUS_ACTION" == "latest" ] && break
    done
    exit

fi        

# Fail early, fail often I guess
if [ `hostname` == "r7arm-aha" ]; then
    if ! [ "$USER" == "buildkite-agent" ]; then
        echo "**ERROR: you are not buildkite-agent, this will not work"
        exit 13
    fi
fi

# FIXME should maybe check and err if `basename $build_dir` != $ci_dir
# if [ "$ACTION" == "old" ]; then ci_dir=$(dirname $build_dir)

echo "Using CI directory ci_dir='$ci_dir'"
echo ""

########################################################################
# Find global CI log dir responsible for coordinating all the builds,
# e.g. "/build/CI/full_chip.HIST"
design=full_chip

if [ "$ACTION" == "new" ]; then

    ########################################################################
    # Look at existing builds to find next-seq no. for this new build

    # E.g. $ci_dir/$design=/build/CI/full_chip
    if ! test -e $ci_dir/$design; then
        echo "WARNING did not find design dir '$ci_dir/$design'"
        echo "Is this your first time?"
        echo "I will build it for you..."
        echo "    mkdir -p $ci_dir/$design"; mkdir -p $ci_dir/$design
    fi

    # E.g. ls $ci_dir/$design => build.0,build.1...
    pushd $ci_dir/$design >& /dev/null
      n=$(\ls -d build.* |& \egrep "^build.[0-9]*" | # build.{0,1,83,112...}
        sed "s|^$design.||" |                        # {0,1,83,112...}
        sort -n | tail -1)                           # 112
      echo $n
    popd >& /dev/null

    # E.g. build='build.113'
    build=build.0
    [ "$n" ] && build=build.$((n+1))   # E.g. 'build.14'

    build_dir=$ci_dir/$design/$build  # E.g. '/build/CI/full_chip/build.14'
    if test -e $build_dir; then
        echo "WARNING '$build_dir' already exists (it shouldn't)."
    else
        mkdir -p $build_dir
    fi
    
    ########################################################################
    # Build the chip
    log=$build_dir/buildchip.log  

    echo ""
    echo "Calling subcommand:"
    echo "    buildchip.sh --new $build_dir \\"
    echo "        |& tee -a $log"; echo ""

    ########################################################################
    echo '----------------------------------------' >> $log
    printf "`date`\n\n" >> $log
    $script_home/buildchip.sh --new $build_dir |& tee -a $log
    ########################################################################

elif  [ "$ACTION" == "old" ]; then

    # build_dir should have been specified on command line
    # FIXME/TODO add to usage / help:
    # build_dir can be specified as one of three ways
    #    bt --retry /tmp/deleteme.buildchip.CI/full_chip/build.7
    #    bt --retry build.7
    #    bt --retry 7

    build_num=` expr $build_dir : '^[^0-9]*\([0-9]*\)'` ; # E.g. "7"
    build=build.$build_num            ; # E.g. 'build.7'
    build_dir=$ci_dir/$design/$build  ; # E.g. '/build/CI/full_chip/build.7'

    # basename $build_dir -- to find "full_chip.7"
    # log=$logdir/full_chip.7 or something

    cd $build_dir
    if ! test -e $build_dir; then 
        echo "**ERROR: Cannot find specified build dir '$build_dir'"; Help; exit 13
    fi
    
    ########################################################################
    # (Re)build the chip
    log=$build_dir/buildchip.log  
    echo ""
    echo "Calling subcommand:"
    echo "    buildchip.sh --retry $build_dir \\"
    echo "        |& tee -a $log"; echo ""

    ########################################################################
    echo '----------------------------------------' >> $log
    printf "`date`\n\n" >> $log
    $script_home/buildchip.sh --retry $build_dir |& tee -a $log
    ########################################################################
fi

exit

##############################################################################
##############################################################################
##############################################################################

# UNIT TESTS on kiwi

alias bt='/nobackup/steveri/github/garnet/mflowgen/bin/bigtest.sh'
cd /tmp/deleteme.buildchip.CI
i=0

c; log=bt.log.$((i++)); echo "less $log"; bt |& tee $log

bt --retry /tmp/deleteme.buildchip.CI/full_chip.7
bt --retry full_chip.7
bt --retry 7

# UNIT TESTS on arm7

# Update garnet branch(es)
# (as steveri)
garnet=/sim/steveri/soc/components/cgra/garnet
(cd $garnet; git checkout master; git pull)
(cd $garnet; git pull)
(cd $garnet; git branch)
(cd $garnet; git checkout civde2)

# Must be agent
xterm -e sudo su buildkite-agent &
source ~steveri/env/bashrc
xtitle agent


# setup
garnet=/sim/steveri/soc/components/cgra/garnet
alias bt='$garnet/mflowgen/bin/bigtest.sh'
cd /build/CI
i=0

# Help
bt --help

# Run bigtest, output to bt.log.$i
echo $i
c; log=bt.log.$((i++)); echo "less $log"; bt |& tee $log | less

# View latest build: bt --view latest?
ls -l `ls -td /build/CI/full_chip/build.* | tail -1`
c; bt --status
c; bt --status all



########################################################################
# bt --status latest
latest=`\ls -td /build/CI/full_chip/build.* | tail -1`
echo latest=$latest ; # E.g. latest=/build/CI/full_chip/build.0/

egrep 'PASS|FAIL|ERROR' $build/buildchip.log
  # ***ERROR: Looks like dir '/build/CI/full_chip/build.0' has only 92G
  # ***ERROR: Dir '/build/CI/full_chip/build.0' needs at least 100G to continue
  # **ERROR: Failed in LVS


########################################################################
# bt --status all
for f in `\ls -t /build/CI/full_chip/build.*`; do
    echo '------------------------------------------------------------'
    echo STATUS $f
    egrep 'PASS|FAIL|ERROR' $f
done





# DONE sourcing '/sim/steveri/soc/components/cgra/garnet/mflowgen/bin/setup-buildkite.sh' ...
# Checking out last known good version #adad99d
# fatal: Unable to create '/sim/steveri/soc/.git/modules/components/cgra/garnet/index.lock': Permission denied
# fatal: Not a git repository (or any parent up to mount point /build)










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
# no longer needed maybe?
#     set -o pipefail; exec $0 --make_only |& tee -a $log
#     echo foo we should not be here...
# 
#     # Unit test:
#     if [ ]; then 
#         echo $0 --new /tmp/deleteme
#     fi


