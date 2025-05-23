 
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


