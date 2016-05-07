#!/bin/bash
set -e
PROGNAME=$(basename $0)

function usage_exit {
    cat <<_EOS_ 1>&2

    Usage: $PROGNAME [OPTIONS...] arg1 arg2
    OPTIONS:
        -h, --help          help command.
        --shell=SHELL       setup shell settings. (zsh(default), bash)
        -v, --vim           setup vim.
        -g, --git           setup git.
        -n, --node          setup node with nodebrew.

        Example: $PROGNAME --shell=zsh -vg
_EOS_
    exit 1
}

declare -i argc=0
declare -a argv=()

while (( $# > 0 )); do
    case "$1" in
        - | -- )
        shift
        argc+=$#
        argv+=("$@")
        break
        ;;

    --* )
        opt_name="${1#--}"
        opt_name="${opt_name%%=*}"

        delim_by_space=true
        opt_value=""
        if [[ "$1" =~ = ]]; then
            delim_by_space=false
            opt_value="${1#*=}"
        fi

        case "$opt_name" in
            'help' )
                usage_exit
                ;;

            'shell' )
                OPT_SHELLS+=("${opt_value:-$2}")
                ($delim_by_space) && shift
                ;;

            'vim' )
                OPT_V=1
                ;;

            'git' )
                OPT_G=1
                ;;

            'node' )
                OPT_N=1
                ;;


        esac
        ;;

    -* )
        for (( i=1; i < ${#1}; i++ )); do
            opt_name="${1:$i:1}"
            case "$opt_name" in
                'h' )
                    usage_exit
                    ;;

                'v' )
                    OPT_V=1
                    ;;

                'g' )
                    OPT_G=1
                    ;;

                'n' )
                    OPT_N=1
                    ;;

                's' )
                    OPT_SHELLS+=("$2")
                    shift
                    ;;

                't' )
                    OPT_TAGS+=("$2")
                    shift
                    ;;
            esac
        done
        ;;

    * )
        (( ++argc ))
        argv+=("$1")
        ;;
    esac
    shift
done

./sh/init.sh

if [ -z "$OPT_SHELLS" ]; then
    OPT_SHELLS+="zsh"
fi
case "$OPT_SHELLS" in
    'zsh' )
        ./sh/zsh.sh
        ;;
    'bash' )
        ;;
esac

if [ "$OPT_G" ]; then
    ./sh/git.sh
fi

if [ "$OPT_V" ]; then
    ./sh/vim.sh
fi

if [ "$OPT_N" ]; then
    ./sh/node.sh
fi

#
#(IFS="/"; cat <<_EOS_
#argc        : $argc
#argv        : ${argv[*]}
#OPT_G       : $OPT_G
#OPT_V       : $OPT_V
#OPT_N       : $OPT_N
#OPT_A       : $OPT_A
#OPT_SHELLS  : ${OPT_SHELLS[*]}
#OPT_TAGS    : ${OPT_TAGS[*]}
#_EOS_
#)
