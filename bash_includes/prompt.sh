source $LIB_DIR/bash/colors.sh

GIT_BRANCH=""

# function to refresh the git variables
function update_current_git_vars() {
    GIT_BRANCH=$(git branch 2>/dev/null | sed -n -e 's/^\* \(.*\)/\1/p')
}

# Various variables you might want for your PS1 prompt instead
User="\u"
Host="\h"
Time="\t"
LastReturn="\$?"
PathShort="\w"

PROMPT_DIRTRIM=3

PROMPT_START="# $(colorize $Time Blue) $(colorize $LastReturn Brown) $(colorize $User@$Host Cyan):$PathShort"
PROMPT_END="$ "

function setPrompt() {
    update_current_git_vars

    GIT_STATUS=""

    if [ -n "$GIT_BRANCH" ]; then
        GIT_STATUS=$GIT_STATUS$GIT_BRANCH
    fi

    if [ -n "$GIT_STATUS" ]; then
        PS1="$PROMPT_START $(colorize $GIT_STATUS Green) $PROMPT_END"
    else
        PS1="$PROMPT_START $PROMPT_END"
    fi
}

PROMPT_COMMAND=setPrompt