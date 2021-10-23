#!/bin/bash

echo "# Script : Hybrid Screens";

if [[ -f "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-hybridscreens.js" ]];then
    echo '- Already installed !'
    return 0;
fi;

# Copy script
cp "${_SOURCEDIR}sources/JavaScriptUtilities/assets/js/vanilla-js/plugins/vanilla-hybridscreens.js" "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-hybridscreens.js";

# Load script
_functions_add=$(cat <<EOF

###################################
## Hybrid Screens
###################################

add_action('wp_enqueue_scripts', function () {
    wp_enqueue_script('vanilla-hybridscreens', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanilla-hybridscreens.js', array(), '1.0.0', true);
    wp_enqueue_script('vanilla-hybridscreens-init', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanilla-hybridscreens-init.js', array('vanilla-hybridscreens'), '1.0.0', true);
});

EOF
);

echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";

# Load script
_js_init_add=$(cat <<EOF

window.addEventListener("DOMContentLoaded", function() {
    new vanillaDetectHybridScreens();
});
EOF
);

echo "${_js_init_add}" >> "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-hybridscreens-init.js";
