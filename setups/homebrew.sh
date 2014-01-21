read -p "Install homebrew and basic packages now? [y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    if [[ ! $(which brew) ]]; then
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    fi

    brew update > /dev/null 2>&1

    cat homebrew_packages | xargs brew install
fi
