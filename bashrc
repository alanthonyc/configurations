########################################################
# Find the actual directory path that we are stored in #
########################################################
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# include evertything in the include directory
LIB_DIR="$DIR/lib"
INCLUDE_DIR="$DIR/bash_includes"
for f in $INCLUDE_DIR/*.sh; do source $f; done

if [ -f "~/.bashrc.local" ]; then
   source "~/.bashrc.local"
fi
