#!/usr/bin/env bash

readonly dir=$(dirname $(readlink -f "$0"))
cd ${dir};

source ${dir}/../includes/not_running_as_root.bash;

umount "/media/${USER}/WALKMAN";