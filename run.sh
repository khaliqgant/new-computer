source helpers.sh

if [[ "$1" == "--dry" ]]; then
    dry="echo"
    output "DRY RUN ACTIVE"
else
    dry=""
fi

# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euo pipefail

# export dry for the other scripts
export dry=$dry

if [[ -f "./data/gems.txt" ]]; then
    output "Setting up Ruby"
    sh ./scripts/rvm-setup.sh
else
    small_output "gems.txt not found in the data directory, so skipping installing the ruby installation"
fi

output "Downloading homebrew and cask apps"
sh ./scripts/apps.sh

if [[ -f "./data/npms.txt" ]]; then
    output "Setting up npm global packages"
    sh ./scripts/npms.sh
else
    small_output "npms.txt not found in the data directory, so skipping installing the npm installation"
fi

if [[ -f "./data/composers.txt" ]]; then
    output "Installing PHP global composer packages"
    sh ./scripts/composer.sh
else
    small_output "composers.txt not found in the data directory, so skipping installing the composer installation"
fi

if [[ -f "./data/pips.txt" ]]; then
    output "Installing Python global pips"
    sh ./scripts/pip.sh
else
    small_output "pips.txt not found in the data directory, so skipping installing the Python installation"
fi

if [[ -f "./data/repos.txt" ]]; then
    output "Cloning repos"
    sh ./scripts/repos.sh
else
    small_output "repos.txt not found in the data directory, so skipping installing any git repos"
fi

output "Restoring mackup settings"
if type "mackup" > /dev/null; then
    $dry mackup restore
fi
