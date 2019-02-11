# read file contents into memory
$dry curl -sS https://getcomposer.org/installer | php
$dry mv composer.phar /usr/local/bin/composer
packages=$(<data/composers.txt)

for package in $packages
do
    $dry composer global require $package
done

