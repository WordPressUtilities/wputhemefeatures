#!/bin/bash

###################################
## Autocomplete commands
###################################

# Thanks : https://stackoverflow.com/a/5303225
_wputhemefeatures_complete() {
    local cur prev

    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}
    local _SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/../";

    if [ $COMP_CWORD -eq 1 ]; then
        _reply=$(ls -1 "${_SOURCEDIR}bin/"*.sh | awk -F'/' '{print $NF}');
        _reply=${_reply//\.sh/};
        COMPREPLY=( $(compgen -W "${_reply}" -- $cur) );
    elif [ $COMP_CWORD -eq 2 ]; then
        case "$prev" in
            "script")
                _reply=$(ls -1 "${_SOURCEDIR}bin/scripts/"*.sh | awk -F'/' '{print $NF}');
                _reply=${_reply//\.sh/};
                COMPREPLY=( $(compgen -W "${_reply}" -- $cur) );
            ;;
            *)
            ;;
        esac
    fi

    return 0
}

complete -F _wputhemefeatures_complete wputhemefeatures

