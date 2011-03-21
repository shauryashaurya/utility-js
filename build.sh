#!/bin/sh
# -----------------------------------
# Please copy this file as "build.sh"
# Edit to put in the correct paths for your system

VER="0.1.1"
echo "Creating release version $VER"
sed s/!version!/$VER/g head.js > utility-$VER.js
sed s/!version!/$VER/g utility.js >> utility-$VER.js
echo "Done."

# --------------------------------------------------------------------------------------
# MINIMISED VERSION - This will fail on errors so use is advised - required for release!
# Change path to compiler and source - obtain it from here:
# http://code.google.com/closure/compiler/

echo "Creating minimised release (will also show errors)"
sed s/!version!/$VER/g head.js > utility-$VER.min.js
java -jar bin/compiler.jar --compilation_level ADVANCED_OPTIMIZATIONS --output_wrapper "(function(){%output%})();" --js utility-$VER.js >> utility-$VER.min.js
echo "Done."
