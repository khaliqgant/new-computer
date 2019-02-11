New Computer
==================
> You fancy, huh?

# Background
* This is a clone of my [Configuration-Files](https://github.com/khaliqgant/Configuration-Files)
[install directory](https://github.com/khaliqgant/Configuration-Files/tree/master/install)
but abstracted out so it's a bit easier to integrate and grok.

# Getting Started
* This repo is meant to be forked. All of the data files are apps that I personally
use. I assume you have different apps than me, unless you've been stalking me
for a while.
* Presumably you have a new computer and are looking to set it up. You can just edit some
text files, set some preferences in the .env file and the scripts do the rest.

# Dependencies
* This project leverages [mackup](https://github.com/lra/mackup) and 
[homebrew-bundler](https://github.com/Homebrew/homebrew-bundle). Both are 
relatively straight forward to setup but if you prefer not to use one of them,
this set of scripts will simply skip over it.

# Opinionated
* This is an opinionated way to configure your computer. By convention it 
prefers you to store your configuration in Dropbox.

# Development
## To Dos
* Check if the data file has any things to install in it
* Check if mackup is installed and if there is a brewfile there
* ^^ Abstract out both scripts so it uses one method to check
