#!/bin/zsh

# Text Color Variables
GREEN='\033[32m' # Green
CLEAR='\033[0m'  # Clear color and formatting

update-brew() {
    if ! which brew &>/dev/null; then return; fi

    echo -e "${GREEN}Updating Brew Formula's${CLEAR}"
    brew update
    brew upgrade
    brew cleanup -s

    echo -e "\n${GREEN}Updating Brew Casks${CLEAR}"
    brew cask outdated
    brew cask upgrade
    brew cleanup -s

    echo -e "\n${GREEN}Brew Diagnostics${CLEAR}"
    brew doctor
    brew missing
}

update-npm() {
    if ! which npm &>/dev/null; then return; fi

    echo -e "\n${GREEN}Updating npm Packages${CLEAR}"
    npm update -g
}

update-gem() {
    if ! which gem &>/dev/null; then return; fi

    echo -e "\n${GREEN}Updating gems${CLEAR}"
    gem update
    gem cleanup
}


update-pip2() {
    if ! which pip2 &>/dev/null; then return; fi

    echo -e "\n${GREEN}Updating Python 2.7.X pips${CLEAR}"
    pip2 freeze - local | grep -v ‘^\-e’ | cut -d = -f 1 | xargs pip2 install -U
}

update-pip3() {
    if ! which pip3 &>/dev/null; then return; fi

    echo -e "\n${GREEN}Updating Python 3.X pips${CLEAR}"
    pip3 freeze - local | grep -v ‘^\-e’ | cut -d = -f 1 | xargs pip3 install -U
}

update-app_store() {
    if ! which mas &>/dev/null; then return; fi

    echo -e "\n${GREEN}Updating App Store Applications${CLEAR}"
    mas outdated
    mas upgrade
}

update-macos() {
    echo -e "\n${GREEN}Updating Mac OS${CLEAR}"
    softwareupdate -i -a
}

update-all() {
    update-brew
    update-npm
    update-gem
    update-pip2
    update-pip3
    update-app_store
    update-macos
}

# Run
update-all
