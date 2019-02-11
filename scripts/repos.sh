# read file contents into memory
repos=$(<data/repos.txt)
# TODO
cw=~/Sites

if [ ! -d "$cw" ]; then
    # TODO env
    $dry mkdir $cw
fi

for repo in $repos
do
    ($dry cd $cw && $dry git clone $repo)
done
