#!/bin/sh
if [ 0 == $# ]; then
    echo "ERROR: Expected at least 1 command. Try 'l help'"
    exit 1
fi
base_cmd() {
    shift
    lsd -FlX --date +"%-d.%-m.%Y %-H:%M:%S" --total-size $@
}
case $1 in
    "a"|"all")
        base_cmd $@ -A --header
        ;;
    "t"|"tree")
        base_cmd $@ --tree
        ;;
    "at")
        base_cmd $@ -A --tree # TODO: Ignore all files from the .git/ directory. '-I.git/*' doesn't work.
        ;;
    "help")
        echo "USAGE:"
        echo "    l [command] [lsd parameters]"
        echo
        echo "COMMANDS:"
        echo "    help       Print help and exit."
        echo "    a, all     List everything except implied '.' and '..'."
        echo "    t, tree    Recurse into directories and present the result as a tree."
        echo "    at         Combination of 'a' and 't'."
        ;;
    *)
        echo "ERROR: Unexpected command '$1'. Try 'l help'."
        exit 1
        ;;
esac
