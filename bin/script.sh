#!/bin/sh
set -x
env
set
echo PARAM $PARAM
echo PREFIX $PREFIX
echo SCHEMATICSLOCATION $SCHEMATICSLOCATION
echo DESKTOP $DESKTOP
python --version
python3 --version
jq --version
terraform version
if [ "x$TF_VAR_SCHEMATICSLOCATION" != x ]; then
  # in schematics container
  # ibmcloud plugin install --all
  ibmcloud plugin update --all --force
fi
ibmcloud version
ibmcloud plugin list
ibmcloud target -r us-south
ibmcloud is vpcs
