# read file contents into memory
repos=$(<data/repos.txt)
projects=$(parse_env "PROJECTS")
cw=~/$projects


if [ ! -d "$cw" ]; then
    $dry mkdir $cw
fi

for repo in $repos
do
    ($dry cd $cw && $dry git clone $repo)
done
