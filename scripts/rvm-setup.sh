#!/bin/shell

small_output "Installing rvm"
$dry \curl -sSL https://get.rvm.io | $dry bash -s stable
small_output "install a couple of ruby versions"
$dry rvm install 2.2.0 --rubygems 2.4.6
$dry rvm install ruby-2.0.0-p451
small_output "using ruby 2.0.0 version"
$dry rvm use ruby-2.0.0-p451
