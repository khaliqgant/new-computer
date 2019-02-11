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

output "Setting up Ruby"
sh rvm-setup.sh

output "Downloading homebrew and cask apps"
sh apps.sh

output "Setting up npm global packages"
sh npms.sh

output "Installing PHP global composer packages"
sh composer.sh

output "Installing Python global pips"
sh pip.sh

output "Cloning repos"
sh repos.sh

output "Restoring mackup settings"
# todo check if mackup exists
$dry mackup restore

