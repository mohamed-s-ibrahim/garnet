# add Genesis to the path
export GENESIS_HOME=/Genesis2/Genesis2Tools
export PATH=$GENESIS_HOME/bin:$GENESIS_HOME/gui/bin:$PATH
export PERL5LIB=$GENESIS_HOME/PerlLibs/ExtrasForOldPerlDistributions:$PERL5LIB
export LAKE_STREAM=$(pip show lake | grep 'Location' | cut -d' ' -f2)
cd / && git clone https://github.com/dillonhuff/clockwork && cd clockwork && git checkout lower_ubuffer
export LAKE_CONTROLLERS="/clockwork/lake_controllers/"

# force color
export PYTEST_ADDOPTS="--color=yes"

cd /garnet/

pytest --pycodestyle           \
       --cov global_controller \
       --cov io_core           \
       --cov memory_core       \
       --ignore=filecmp.py     \
       --ignore=Genesis2/      \
       -v --cov-report term-missing tests
