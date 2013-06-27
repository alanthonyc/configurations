# usage:
# serve <port (defaults to 9999)>

function serve {
    local usage_text="Usage: serve [port]
Serves the current directory via HTTP on the specified port"

    local help_pattern="-h|--help"
    if [[ $1 =~ $help_pattern ]]; then
        echo "$usage_text"
        return 0
    fi

    local port_pattern="^[0-9]+$"
    if ! [[ $1 =~ $port_pattern ]]; then
        echo "Invalid port argument: \"$1\""
        return 1
    fi

    local Port=$1
    if [ -z "$Port" ]; then
        Port=9999;
    fi

    python -m SimpleHTTPServer $Port
}

