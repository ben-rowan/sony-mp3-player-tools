#!/usr/bin/env bash

readonly dir=$(dirname $(readlink -f "$0"))
cd ${dir};

source ${dir}/../includes/not_running_as_root.bash;

if [[ 2 != $# ]];
then
    echo "Usage: ${0} [from] [to]";
    exit 1;
fi

readonly from="${1}";
readonly to="${2}";

# The speed has been limited because otherwise the device seems to get 'overloaded' and
# stops working.

# --times has been set to ensure that mtimes are maintained when copying files. --modify-window=1 has been set
# to account for the FAT32 filesystem not maintaining mtimes with the same accuracy as ext4

rsync -rP --modify-window=1 --times --delete --bwlimit=1.5m "${from}" "/media/${USER}/WALKMAN/${to}";
