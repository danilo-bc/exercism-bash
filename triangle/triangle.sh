#!/usr/bin/env bash

triangle_is_not_valid () {
    if [[ $2 == 0 || $3 == 0 || $4 == 0 ]]; then
        return 1
    # From https://stackoverflow.com/a/31087503/4913389
    # Apparently bash can only handle integer arithmetics
    # bc provides 'basic calculator' functionality
    elif (( $(echo "($2 + $3 < $4 )|| ($3 + $4 < $2) || ($2 + $4 < $3)" |bc -l) )); then
        return 1
    else
        return 0
    fi
}

triangle_is_equilateral(){
    if [[ $2 == "$3" && $2 == "$4" ]]; then
            echo "true"
    else
        echo "false"
    fi
}

triangle_is_isosceles(){
    if [[ $2 == "$3" || $2 == "$4" || $3 == "$4" ]]; then
        echo "true"
    else
        echo "false"
    fi
}

triangle_is_scalene(){
    if [[ $2 != "$3" && $2 != "$4" && $3 != "$4" ]]; then
        echo "true"
    else
        echo "false"
    fi
}

main () {
    triangle_is_not_valid "$@"
    if [[  $? -eq 1 ]] ; then
        echo "false"
    elif [[ $1 == "equilateral" ]]; then
        triangle_is_equilateral "$@"
    elif [[ $1 == "isosceles" ]]; then
        triangle_is_isosceles "$@"
    elif [[ $1 == "scalene" ]]; then
        triangle_is_scalene "$@"
    fi

}
main "$@"
