#!/bin/bash

echo "# Script : Scroll Level";

# Go to folder
cd "${_CURRENT_DIR}${_SCRIPTDIR}";

# Add as a submodule
bashutilities_submodule_or_install "https://github.com/JavaScriptUtilities/vanillaScrollLevel.git" "${_USE_GIT_SUBMODULES}";

# Back to the main folder
cd "${_CURRENT_DIR}";

# Load script
_functions_add=$(cat <<EOF

###################################
## Scroll Level
###################################

add_action('wp_enqueue_scripts', function () {
    wp_enqueue_script('vanilla-scrolllevel', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaScrollLevel/js/vanilla-scrolllevel.min.js', array('jquery'), '0.2.0', true);
    wp_enqueue_script('vanilla-scrolllevel-init', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanilla-scrolllevel-init.js', array('jquery','vanilla-scrolllevel'), '0.2.0', true);
});

EOF
);

echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";

# Load script
_js_init_add=$(cat <<EOF

jQuery(document).ready(function($) {
    /* Init script */
    new vanillaScrollLevel({
        animDisabledLevel: 800
    });
    /* Refresh on ajax-ready event if needed */
    jQuery('body').on('ajax-ready', function() {
        window.dispatchEvent(new Event("vanilla-scrolllevel-compute"));
    });
});
EOF
);

echo "${_js_init_add}" >> "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-scrolllevel-init.js";
