#!/bin/bash

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$SCRIPTDIR/variables.sh"

# Destroy

echo "Destroying instance..."
cd $SCRIPTDIR && make destroy