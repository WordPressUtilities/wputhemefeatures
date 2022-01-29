#!/bin/bash

function wputhemefeatures_get_version(){
    cd "$1" && git describe --tags $(git rev-list --tags --max-count=1);
}
