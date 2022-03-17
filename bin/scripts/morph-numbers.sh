#!/bin/bash

echo "# Script : Morph Numbers";

if [[ -f "${_CURRENT_DIR}${_SCRIPTDIR}/vanillaMorphHTMLNumber/js/morphhtmlnumber.min.js" ]];then
    echo '- Already installed !'
    return 0;
fi;

# Go to folder
cd "${_CURRENT_DIR}${_SCRIPTDIR}";

# Add as a submodule
bashutilities_submodule_or_install "https://github.com/JavaScriptUtilities/vanillaMorphHTMLNumber.git" "${_USE_GIT_SUBMODULES}";

# Back to the main folder
cd "${_CURRENT_DIR}";

_SCRIPT_VERSION=$(wputhemefeatures_get_version "${_CURRENT_DIR}${_SCRIPTDIR}/vanillaMorphHTMLNumber");

# Load script
_functions_add=$(cat <<EOF

###################################
## Morph Numbers
###################################

add_action('wp_enqueue_scripts', function () {
    \$script_version='${_SCRIPT_VERSION}';
    wp_enqueue_script('vanilla-morphhtmlnumber', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaMorphHTMLNumber/js/morphhtmlnumber.min.js', array(), \$script_version true);
});

EOF
);

echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";

