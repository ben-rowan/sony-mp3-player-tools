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

rsync -rP --delete --bwlimit=1.5m "${from}" "/media/${USER}/WALKMAN/${to}";