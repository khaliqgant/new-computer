#!/bin/shell

# largely copied from https://gist.github.com/t-io/8255711
output "Install Homebrew"

$dry ruby -e "$($dry curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$dry brew install caskroom/cask/brew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# install all the apps
apps=$(<data/apps.txt)
output "Installing apps on apps on apps"
for app in $apps
do
    $dry brew cask install $app
done

echo "Installing sshpass"
brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
echo "installing brew deps"
brew bundle
