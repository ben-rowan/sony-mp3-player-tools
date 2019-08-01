#!/usr/bin/env bash

readonly dir=$(dirname $(readlink -f "$0"))
cd ${dir};

source ${dir}/../includes/not_running_as_root.bash;

readonly partitionLabel="${1:-WALKMAN}";

mount -L "${partitionLabel}";