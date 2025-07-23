# general tools

epochconverter() {
    # This function replicates the functionality of
    # https://www.epochconverter.com/
    if [ $# -eq 1 ]; then
        re='^[0-9]+$'
        if [[ $1 =~ $re ]]; then
            date "+%m/%d/%Y %H:%M:%S.%3N%z" -d @$(echo "$1/1000" | bc -l)
        else
            date +%s%N -d "$1" | cut -b1-13
        fi
    else
        echo "One argument is required."
    fi
}

# Meta specific tools

mkdir -p ~/files
touch ~/files/targets

function list_targets {
  # Usage:
  #   list_targets [--change <commit>]
  #   List all relevant targets of the current pending changes.
  #   If a commit is given, it needs to be prefixed with --change flag.
  sl status -mn "$@" | xargs -I {} buck2 query "owner({})" 2> /dev/null | sort | uniq | tee ~/files/targets
}

GREEN='\033[1;92m' # bold green
RESET='\033[0m' # reset

function buildem {
  while IFS= read -r target; do
        build_type=$(buck uquery --output-attribute buck.type $target 2> /dev/null | jq -r ".[\"${target}\"].\"buck.type\"")
        if [[ $build_type =~ .*test$ ]]; then
            target=$(echo "test $target")
        else
            target=$(echo "build $target")
        fi
        echo -e "${GREEN}buck $target${RESET}"
        buck $target
    echo
    done < ~/files/targets
}
