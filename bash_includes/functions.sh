# usage: lines 11 derp.txt     #get line 11
# or:    lines 5 14 derp.txt   #get lines 5-14
function lines {
    if [[ ! -z $3 ]]; then
        sed -n "$1,$2p" $3
    else
        sed -n "$1p" $2
    fi
}

# usage: notify "derp is derping"         # just a message
# or:    notify "derp" "derp is derping"  # title and message
function notify {
    if [[ ! -z $2 ]]; then
        title=$1
        message=$2
    else
        title="Notification"
        message=$1
    fi

    if [[ $(which notify-send) ]]; then
        # ubuntu (gnome) version
        notify-send "$title" "$message"
    elif [[ $(which osascript) ]]; then
        # mac osx version
        as_command="display notification \"$message\" with title \"$title\""
        echo $as_command
        osascript -e "$as_command"
    else
        # terminal fallback version
        echo "$title"
        echo
        echo "$message"
    fi
}

# usage: remind 5m "Tea is ready"
function remind {
    if [ ! -z $2 ]; then
        sleep $1 && notify "Reminder" "$2" > /dev/null 2>&1 &
    else
        echo "Usage: remind 15m 'you gotta leave!'"
    fi
}
