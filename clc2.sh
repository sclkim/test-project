#!/bin/bash
#function clc2 {
    # The original script wrapped in a nested function:
    function copy_last_commit() {
        LAST_COMMIT_SHA=$(git rev-parse HEAD)
        echo "$LAST_COMMIT_SHA" | tr -d '\n' #| pbcopy
        #echo "Copied ${LAST_COMMIT_SHA}."
    }

    # Added to check out branch, if parameter is set.
    if [ ! -z "$1" ]; then
        echo "$1"
        if git checkout $1 >/dev/null; then
            copy_last_commit
            git checkout - >/dev/null
        else
            echo "Checkout wasn't successful. Didn't copy anything."
        fi
    else
        copy_last_commit
    fi
#}
