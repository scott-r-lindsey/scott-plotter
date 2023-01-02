
#!/bin/bash

set -o pipefail
set -e

__here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__root="$__here/../"

export APP_PATH=$__root

. $__here/dep/colors.sh

###############################################################################

green "-------------------------------------------------------------------------------"
purple "Creating GCODE from SVG"
green "-------------------------------------------------------------------------------"

cd $__root;
name=`basename $1`
output="output/$name.gcode"

python3 ./gcodeplot/gcodeplot.py \
    --down-command="M400|M280 P0 S100|M400" \
    --lift-command="M400|M280 P0 S50|M400" \
    --pen-up-speed=100 \
    --pen-down-speed=100 \
    --area=0,0,2000,1500 \
    $1 \
    >$__root/$output

echo "G28 X; home" >>$__root/$output
echo "G28 Y; home" >>$__root/$output
perl -p -i -e 's|G28 Z; home||' $__root/$output


green "-------------------------------------------------------------------------------"
purple "Done!"
red "---> $output"
green "-------------------------------------------------------------------------------"
