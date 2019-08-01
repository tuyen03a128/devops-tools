#!/usr/bin/env bash

# Invoke this script:  arglist.sh one two three
E_BADARGS=85

if [ ! -n "$1" ]; then
    echo "Usage: `basename $0` argument1 argument2 etc. "
    exit $E_BADARGS
else
    echo "`basename $0` and argument lists: $*"
    echo  "Listing arguments with \"\$*\":"
    index=1
    for arg in "$*"
    do
        echo "Arg #$index = $arg"
        let "index+=1"
    done # see all arguments as single word
    echo "Entire arg list seen as single word."

    echo  "Listing arguments with \"\$@\":"
    index=1
    for arg in "$@"
    do
        echo "Arg #$index = $arg"
        let "index+=1"
    done # see arguments as separate words
    echo "Arg list seen as separate words."

    echo  "Listing arguments with unquoted \$*:"
    index=1
    for arg in $*
    do
        echo "Arg #$index = $arg"
        let "index+=1"
    done # Unquoted $* sees arguments as separate words
    echo "Arg list seen as separate words."

    echo "Listing parameters: \${@:-}"
    echo "${@:-}"

    echo "Listing parameters: \${@:2}"
    echo "${@:2}"
fi
