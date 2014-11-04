OLD_PWD=$(pwd)

echo "Updating submodules ..."
git submodule update --init --recursive

cd ~

LINKS='bashrc
bash_profile
inputrc
vimrc
gitconfig
gitignore_global
vim'

for L in $LINKS; do
    # check if the file/dir/link exists and backup the existing version
    if [[ -e ".$L" ]]; then
        echo "Backing up .$L"
        mv ".$L" ".$L.backup"
    fi
    echo "Linking .$L"
    ln -s "$DIR/$L" ".$L"
    echo
done

cd $OLD_PWD
