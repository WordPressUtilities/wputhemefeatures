#!/bin/bash

echo "# Script : Lazy Loading";

# Go to folder
cd "${_CURRENT_DIR}${_SCRIPTDIR}";

# Add as a submodule
git submodule add https://github.com/JavaScriptUtilities/vanillaLazyLoad.git;

# Back to the main folder
cd "${_CURRENT_DIR}";

# Load script
_functions_add=$(cat <<EOF

###################################
## Lazy Loading
###################################

add_action('wp_enqueue_scripts', function () {
    wp_enqueue_script('vanilla-lazyloading', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaLazyLoad/js/vanilla-lazyloading.min.js', array(), '1.0.0', true);
});

EOF
);

echo "${_functions_add}" >> "${_CURRENT_DIR}functions.php";

