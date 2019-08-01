#!/usr/bin/env bash

readonly dir=$(dirname $(readlink -f "$0"))
cd ${dir};

source ${dir}/../../includes/is_running_as_root.bash;

if [[ 1 != $# ]];
then
    echo "Usage: ${0} /dev/<partition>";
    exit 1;
fi

readonly partition="${1}";

fatlabel "${partition}";