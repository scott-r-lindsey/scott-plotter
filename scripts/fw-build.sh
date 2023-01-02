
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

cd $__root/marlin;

purple "-> Building... "
platformio run -e mega2560

green "-------------------------------------------------------------------------------"
purple "Done!"
green "-------------------------------------------------------------------------------"
