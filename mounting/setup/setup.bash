#!/usr/bin/env bash

readonly dir=$(dirname $(readlink -f "$0"))
cd ${dir};

source ${dir}/../../includes/is_running_as_root.bash;

if [[ 1 != $# ]];
then
    echo "Usage: ${0} [partition label]";
    exit 1;
fi

readonly partitionLabel="${1}";
readonly mountPoint="/media/${SUDO_USER}/WALKMAN";

echo "
    Creating mount point
";

mkdir -p "${mountPoint}";
chown -R ${SUDO_USER} "${mountPoint}";
chmod -R 0600 "${mountPoint}";

echo "
    Configuring fstab
";

# Setting the option `flush` here is essential. Without this you can't send large numbers of files
# to the device without it throwing errors.

echo "# SONY Walkman" >> /etc/fstab;
echo "LABEL=${partitionLabel}   ${mountPoint}   auto    flush,user,umask=000,utf8,noauto  0   0" >> /etc/fstab;