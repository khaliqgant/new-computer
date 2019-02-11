#!/bin/shell

# largely copied from https://gist.github.com/t-io/8255711
small_output "Install Homebrew"

$dry ruby -e "$($dry curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$dry brew install caskroom/cask/brew-cask
$dry export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# install all the apps
apps=$(<data/apps.txt)
small_output "Installing apps on apps on apps"
for app in $apps
do
    $dry brew cask install $app
done

include_sshpass=$(parse_env "INCLUDE_SSHPASS")

if [[ "$include_sshpass" == "true" ]]; then
    small_output "Installing sshpass"
    $dry brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
fi

# TODO check env
small_output "installing brew deps"
$dry brew bundle
