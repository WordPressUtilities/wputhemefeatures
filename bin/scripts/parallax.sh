#!/bin/bash

echo "# Script : Parallax";

# Go to folder
cd "${_CURRENT_DIR}${_SCRIPTDIR}";

# Add as a submodule
bashutilities_submodule_or_install "https://github.com/JavaScriptUtilities/vanillaJsuParallax.git" "${_USE_GIT_SUBMODULES}";

# Back to the main folder
cd "${_CURRENT_DIR}";

# Load script
_functions_add=$(cat <<EOF

###################################
## Parallax
###################################

add_action('wp_enqueue_scripts', function () {
    wp_enqueue_script('vanilla-jsuparallax', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaJsuParallax/js/vanilla-jsuparallax.min.js', array('jquery'), '1.0.0', true);
    wp_enqueue_script('vanilla-jsuparallax-init', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanilla-jsuparallax-init.js', array('jquery','vanilla-jsuparallax'), '1.0.0', true);
});

EOF
);

echo "${_functions_add}" >> "${_CURRENT_DIR}functions.php";

# Load script
_js_init_add=$(cat <<EOF

jQuery(document).ready(function($) {
    new vanillaJsuParallax({
        items: document.querySelectorAll('.has-vanilla-jsuparallax')
    });
});
EOF
);

echo "${_js_init_add}" >> "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-jsuparallax-init.js";
