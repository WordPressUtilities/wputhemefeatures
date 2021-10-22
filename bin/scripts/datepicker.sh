#!/bin/bash

echo "# Script : Date picker";

# Back to the main folder
cd "${_CURRENT_DIR}";

# Load script
_functions_add=$(cat <<EOF

###################################
## Datepicker
###################################

add_action('wp_enqueue_scripts', function () {
    wp_enqueue_script('jquery-ui-datepicker');
    wp_enqueue_script('${_THEME_NAME}-datepicker-init', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/datepicker-init.js', array('jquery','jquery-ui-datepicker'), '1.0.0', true);
});

EOF
);

echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";

# Load init script
_js_init_add=$(cat <<EOF

jQuery(document).ready(function() {
    /* Date picker */
    jQuery('.has-datepicker').each(function() {
        var \$item = jQuery(this),
            \$wrapper = jQuery('<div class="date-wrapper"></div>');

        /* Wrap item */
        \$item.after(\$wrapper);
        \$item.appendTo(\$wrapper);

        /* Set datepicker */
        \$item.attr('autocomplete', 'off');
        \$item.datepicker({
            minDate: 1,
            dateFormat: 'dd/mm/yy'
        });
    });
});

EOF
);

echo "${_js_init_add}" >> "${_CURRENT_DIR}${_SCRIPTDIR}/datepicker-init.js";

# Inject SCSS
if [[ -f "${_SCSSPLUGIN}" ]];then
    cat "${_SOURCEDIR}sources/datepicker.scss" >> "${_SCSSPLUGIN}";
fi;

