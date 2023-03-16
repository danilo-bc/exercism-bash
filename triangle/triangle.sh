#!/usr/bin/env bash

triangle_is_not_valid () {
    if [[ $2 == 0 || $3 == 0 || $4 == 0 ]]; then
        return 1
    elif (( $2 + $3 < $4 )) || (( $3 + $4 < $2 ))  || (( $2 + $4 < $3 )); then
        return 1
    else
        return 0
    fi
}

main () {
    triangle_is_not_valid "$@"
    if [[  $? -eq 1 ]] ; then
        echo "false"
    elif [[ $1 == "equilateral" ]]; then
        if [[ $2 == "$3" && $2 == "$4" ]]; then
            echo "true"
        else
            echo "false"
        fi
    elif [[ $1 == "isosceles" ]]; then
        if [[ $2 == "$3" || $2 == "$4" || $3 == "$4" ]]; then
            echo "true"
        else
            echo "false"
        fi
    fi

}
main "$@"
