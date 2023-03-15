#!/usr/bin/env bash

main () {
    calculation=0

    for (( i = 0; i < ${#1}; ++i )); do
        calculation=$(( calculation+ ${1:i:1}**(${#1}) ))
    done
    if [[ $1 == "$calculation" ]]; then
        echo "true"
    else
        echo "false"
    fi
}

main "$@"
