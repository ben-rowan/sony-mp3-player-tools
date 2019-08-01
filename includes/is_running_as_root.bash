#!/usr/bin/env bash

if [[ 'root' != "$(whoami)" ]];
then
    echo 'Please run this script as root';
    exit 1;
fi