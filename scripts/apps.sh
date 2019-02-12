#!/bin/shell

# largely copied from https://gist.github.com/t-io/8255711
small_output "Install Homebrew"

$dry ruby -e "$($dry curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$dry brew install caskroom/cask/brew-cask
$dry export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# install all the apps
if [ -f ./data/apps.txt]; then
    apps=$(<data/apps.txt)
    small_output "Installing apps on apps on apps"
    for app in $apps
    do
        $dry brew cask install $app
    done
else
    small_output "data/apps.txt file not found so skipping installing any apps via brew-cask"
fi

include_sshpass=$(parse_env "INCLUDE_SSHPASS")

if [[ "$include_sshpass" == "true" ]]; then
    small_output "Installing sshpass"
    $dry brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
else
    small_output "ENV set to not install SSH Pass"
fi

if [ -f ./Brewfile ]; then
    small_output "installing brew deps"
    $dry brew bundle
else
    small_output "Brewfile not found, so skipping installing any homebrew packages"
fi
