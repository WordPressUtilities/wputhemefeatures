#!/bin/bash

echo "# Script : Back to top";

# Back to the main folder
cd "${_CURRENT_DIR}";

# Inject SCSS
if [[ -f "${_SCSSPLUGIN}" ]];then
    cat "${_SOURCEDIR}sources/scripts/backtotop/source.scss" >> "${_SCSSPLUGIN}";
fi;


# Load script
_footer_add=$(cat <<EOF

add_action('wp_footer',function (){
    echo '<div class="backtotop-anchor" id="backtotop-anchor"></div>';
    echo '<div class="backtotop"><a href="#backtotop-anchor" title="' . esc_attr(__('Back to top', 'projectid')) . '">' . __('↑', 'projectid') . '</a></div>';
});

EOF
);

echo "${_footer_add}" >> "${_CURRENT_DIR}functions.php";

