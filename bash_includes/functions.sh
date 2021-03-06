# usage: lines 11 derp.txt     #get line 11
# or:    lines 5 14 derp.txt   #get lines 5-14
function lines {
    if [[ ! -z "$3" ]]; then
        sed -n "$1,$2p" "$3"
    else
        sed -n "$1p" "$2"
    fi
}

# usage: notify "derp is derping"         # just a message
# or:    notify "derp" "derp is derping"  # title and message
function notify {
    if [[ ! -z "$2" ]]; then
        title="$1"
        message="$2"
    else
        title="Notification"
        message="$1"
    fi

    if [[ $(which notify-send) ]]; then
        # ubuntu (gnome) version
        notify-send "$title" "$message"
    elif [[ $(which osascript) ]]; then
        # mac osx version
        as_command="display notification \"$message\" with title \"$title\""
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
    if [ ! -z "$2" ]; then
        sleep $1 && notify "Reminder" "$2" > /dev/null 2>&1 &
    else
        echo "Usage: remind 15m 'you gotta leave!'"
    fi
}

# usage: clone lnwdr/configurations     #clones the github repo via SSH
function clone {
    if [ ! -z "$1" ]; then
        git clone "git@github.com:$1.git"
    else
        echo "Usage: clone lnwdr/configurations"
    fi
}

# prints a JSON document listing all collaborator of a github project to STDOUT
# additional text is printed to STDERR to keep output suitable for piping
# usage: `collaborators foo bar` for project github.com/foo/bar
function collaborators {
    echo "Github collaborators for $1/$2:" 1>&2
    curl -X GET https://api.github.com/repos/$1/$2/collaborators
}

# removes all "dotfiles" from the specified directories recursively
function rmdotfiles {
    find $1 -type f -name ".*" -print0 | xargs -0 rm
}

# sets the terminals title to the current working diretory
function set_terminal_title {
    echo -ne "\033]0;$PWD\007"
}
