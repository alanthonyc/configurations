Black="0;30"
DarkGray="1;30"
Blue="0;34"
LightBlue="1;34"
Green="0;32"
LightGreen="1;32"
Cyan="0;36"
LightCyan="1;36"
Red="0;31"
LightRed="1;31"
Purple="0;35"
LightPurple="1;35"
Brown="0;33"
Yellow="1;33"
LightGray="0;37"
White="1;37"

# usage:
# echo colorize "Foobar" "Cyan"
function colorize {
    local Color=$2
    local Template="\[\\e[${!Color}m\]%s\[\\e[m\]"
    printf $Template $1
}

