#!/bin/bash

echo "# Script : Scroll Anims";

if [[ -f "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-scrollanims-init.js" ]];then
    echo '- Already installed !'
    return 0;
fi;

# Go to folder
cd "${_CURRENT_DIR}${_SCRIPTDIR}";

# Add as a submodule
bashutilities_submodule_or_install "https://github.com/JavaScriptUtilities/vanillaScrollAnims.git" "${_USE_GIT_SUBMODULES}";

# Back to the main folder
cd "${_CURRENT_DIR}";

_SCRIPT_VERSION=$(wputhemefeatures_get_version "${_CURRENT_DIR}${_SCRIPTDIR}/vanillaScrollAnims");

# Load script
_functions_add=$(cat <<EOF

###################################
## Scroll Anims
###################################

add_action('wp_enqueue_scripts', function () {
    wp_enqueue_script('vanilla-scrollanims', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaScrollAnims/js/vanilla-scrollanims.js', array('jquery'), '${_SCRIPT_VERSION}', true);
    wp_enqueue_script('vanilla-scrollanims-init', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanilla-scrollanims-init.js', array('jquery','vanilla-scrollanims'), '${_SCRIPT_VERSION}', true);
});

EOF
);

echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";

# Load script
_js_init_add=$(cat <<EOF

jQuery(document).ready(function($) {
    var scrollItems = document.querySelectorAll('.will-scrollanim');
    var scrollAnim = new dkJSUScrollAnims(scrollItems, {});
});
EOF
);

echo "${_js_init_add}" >> "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-scrollanims-init.js";
