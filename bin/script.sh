#!/bin/sh
set -x
env
set
echo PARAM $PARAM
echo PREFIX $PREFIX
python --version
python3 --version
jq --version
terraform version
if [ "x$TF_VAR_SCHEMATICSLOCATION" != x ]; then
  # in schematics container
  # ibmcloud plugin install --all
  ibmcloud plugin update --all
fi
ibmcloud version
ibmcloud plugin list
ibmcloud target -r us-south
ibmcloud is vpcs
