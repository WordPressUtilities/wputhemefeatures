#!/bin/bash

echo "# Script : Range";

if [[ -f "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-jsu-range-init.js" ]];then
    echo '- Already installed !'
    return 0;
fi;

# Go to folder
cd "${_CURRENT_DIR}${_SCRIPTDIR}";

# Add as a submodule
bashutilities_submodule_or_install "https://github.com/JavaScriptUtilities/vanillaJsuRange.git" "${_USE_GIT_SUBMODULES}";

# Back to the main folder
cd "${_CURRENT_DIR}";

_SCRIPT_VERSION=$(wputhemefeatures_get_version "${_CURRENT_DIR}${_SCRIPTDIR}/vanillaJsuRange");

# Load script
_functions_add=$(cat <<EOF

###################################
## Range
###################################

add_action('wp_enqueue_scripts', function () {
    \$script_version = '${_SCRIPT_VERSION}';
    wp_enqueue_script('vanilla-jsu-range', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaJsuRange/assets/js/range.min.js', array(), \$script_version, true);
    wp_enqueue_script('vanilla-jsu-range-init', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanilla-jsu-range-init.js', array('jquery','vanilla-jsu-range'), \$script_version, true);
    wp_enqueue_style('vanilla-jsu-range-css', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaJsuRange/assets/css/range.css', array(), \$script_version);
});

EOF
);

echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";


# Load script
_js_init_add=$(cat <<EOF

jQuery(document).ready(function($) {
    document.querySelectorAll(".has-vanilla-jsu-range").forEach(function(el) {
        new vanillaJsuRange(el);
    });
});
EOF
);

echo "${_js_init_add}" >> "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-jsu-range-init.js";
