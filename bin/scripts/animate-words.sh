#!/bin/bash

echo "# Script : Animate Words";

if [[ -f "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-animate-words-init.js" ]];then
    echo '- Already installed !'
    return 0;
fi;

# Go to folder
cd "${_CURRENT_DIR}${_SCRIPTDIR}";

# Add as a submodule
bashutilities_submodule_or_install "https://github.com/JavaScriptUtilities/vanillaAnimateWords.git" "${_USE_GIT_SUBMODULES}";

# Back to the main folder
cd "${_CURRENT_DIR}";

_SCRIPT_VERSION=$(wputhemefeatures_get_version "${_CURRENT_DIR}${_SCRIPTDIR}/vanillaAnimateWords");

# Load script
_functions_add=$(cat <<EOF

###################################
## Animate words
###################################

add_action('wp_enqueue_scripts', function () {
    \$script_version='${_SCRIPT_VERSION}';
    wp_enqueue_script('vanilla-animate-words', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaAnimateWords/js/vanilla-animate-words.min.js', array(), \$script_version, true);
    wp_enqueue_script('vanilla-animate-words-init', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanilla-animate-words-init.js', array('jquery','vanilla-animate-words'), \$script_version, true);
    wp_enqueue_style('vanilla-animate-words-css', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaAnimateWords/css/vanilla-animate-words.css', array(), \$script_version);
});

EOF
);

echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";


# Load script
_js_init_add=$(cat <<EOF

jQuery(document).ready(function($) {
    document.querySelectorAll("[data-vawjs-anim]").forEach(function(el) {
        new vanillaAnimateWords(el);
    });
});
EOF
);

echo "${_js_init_add}" >> "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-animate-words-init.js";
