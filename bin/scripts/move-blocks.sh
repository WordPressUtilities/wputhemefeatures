#!/bin/bash

echo "# Script : Move Blocks";

if [[ -f "${_CURRENT_DIR}${_SCRIPTDIR}/vanillaMoveBlocks/js/vanilla-moveblocks.min.js" ]];then
    echo '- Already installed !'
    return 0;
fi;

# Go to folder
cd "${_CURRENT_DIR}${_SCRIPTDIR}";

# Add as a submodule
bashutilities_submodule_or_install "https://github.com/JavaScriptUtilities/vanillaMoveBlocks.git" "${_USE_GIT_SUBMODULES}";

# Back to the main folder
cd "${_CURRENT_DIR}";

_SCRIPT_VERSION=$(wputhemefeatures_get_version "${_CURRENT_DIR}${_SCRIPTDIR}/vanillaMoveBlocks");

# Load script
_functions_add=$(cat <<EOF

###################################
## Move Blocks
###################################

add_action('wp_enqueue_scripts', function () {
    \$script_version='${_SCRIPT_VERSION}';
    wp_enqueue_script('vanilla-moveblocks', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaMoveBlocks/js/vanilla-moveblocks.min.js', array(), \$script_version, true);
});

EOF
);

echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";

