function lines {
    if [[ ! -z $3 ]]; then
        sed -n "$1,$2p" $3
    else
        sed -n "$1p" $2
    fi
}
