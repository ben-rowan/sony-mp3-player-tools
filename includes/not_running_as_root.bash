#!/usr/bin/env bash

if [[ 'root' == "$(whoami)" ]];
then
    echo "Please run this script as your regular user";
    exit 1;
fi