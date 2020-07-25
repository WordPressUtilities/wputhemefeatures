#!/bin/bash

echo "# Script : Move Blocks";

# Go to folder
cd "${_CURRENT_DIR}${_SCRIPTDIR}";

# Add as a submodule
bashutilities_submodule_or_install "https://github.com/JavaScriptUtilities/vanillaMoveBlocks.git" "${_USE_GIT_SUBMODULES}";

# Back to the main folder
cd "${_CURRENT_DIR}";

# Load script
_functions_add=$(cat <<EOF

###################################
## Move Blocks
###################################

add_action('wp_enqueue_scripts', function () {
    wp_enqueue_script('vanilla-moveblocks', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaMoveBlocks/js/vanilla-moveblocks.min.js', array(), '1.0.0', true);
});

EOF
);

echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";

