#!/bin/sh
set -x
env
set
echo PARAM $PARAM
echo PREFIX $PREFIX
python --version
python3 --version
jq --version
ibmcloud version
ibmcloud plugin list
