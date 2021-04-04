#!/bin/bash

echo "# Script : Animate Words";

# Go to folder
cd "${_CURRENT_DIR}${_SCRIPTDIR}";

# Add as a submodule
bashutilities_submodule_or_install "https://github.com/JavaScriptUtilities/vanillaAnimateWords.git" "${_USE_GIT_SUBMODULES}";

# Back to the main folder
cd "${_CURRENT_DIR}";

# Load script
_functions_add=$(cat <<EOF

###################################
## Animate words
###################################

add_action('wp_enqueue_scripts', function () {
    wp_enqueue_script('vanilla-animate-words', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaAnimateWords/js/vanilla-animate-words.min.js', array(), '1.0.0', true);
    wp_enqueue_script('vanilla-animate-words-init', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanilla-animate-words-init.js', array('jquery','vanilla-animate-words'), '1.0.0', true);
    wp_enqueue_style('vanilla-animate-words-css', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaAnimateWords/js/vanilla-animate-words.min.js', array(), '1.0.0', false);
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
