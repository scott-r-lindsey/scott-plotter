
#!/bin/bash

set -o pipefail
set -e

__here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__root="$__here/../"

export APP_PATH=$__root

. $__here/dep/colors.sh

###############################################################################

green "-------------------------------------------------------------------------------"
purple "Preparing project"
green "-------------------------------------------------------------------------------"

cd $__root;
purple "-> init submodules... "
git submodule init
purple "-> copy config... "
rm marlin/Marlin/Configuration*
cd marlin/Marlin/
ln -s ../../config/Configuration.h ./
ln -s ../../config/Configuration_adv.h ./

green "-------------------------------------------------------------------------------"
purple "Done!"
green "-------------------------------------------------------------------------------"
