#!/bin/bash

## Check if dir is correct
if [[ ! -f "style.css" ||  ! -f "functions.php" ]];then
    echo "# This is not a WordPress theme folder !"
    return 0;
fi;
