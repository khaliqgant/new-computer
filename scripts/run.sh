#!/bin/shell

source helpers.sh

if [[ "$1" == "--dry" ]]; then
    dry="echo"
    output "DRY RUN ACTIVE"
else
    dry=""
fi

# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

# export dry for the other scripts
export dry=$dry

output "Downloading cli and vim items"
sh shell.sh
output "Setting up ruby setup"
sh rvm-setup.sh
output "Downloading homebrew and cask apps"
sh apps.sh
output "Cloning my repos"
sh repos.sh
output "Setting up npm global packages"
sh npms.sh
output "Restoring mackup settings"
# todo check if mackup exists
$dry mackup restore
output "Installing global composer packages"
sh composer.sh
output "Copying iterm fonts"
$dry cp iterm/fonts/source-code-pro-1.017R/* /Library/Fonts/
output "Installing pips"
sh pip.sh
