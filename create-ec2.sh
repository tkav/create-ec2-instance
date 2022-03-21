#!/bin/bash

# Set default Environmental Variables
SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$SCRIPTDIR/variables.sh"

# If input arg, use default values
if [ -z "$1" ]; then

    # Prompt user to change default values

    # TF_VAR_project_name

    echo "Project name ($TF_VAR_project_name): "
    read project_name
    if [[ $project_name != "" ]]; then 
        TF_VAR_project_name=$project_name
    fi

    # TF_VAR_key_name

    echo "Key name ($TF_VAR_key_name): "
    read key_name
    if [[ $key_name != "" ]]; then 
        TF_VAR_key_name=$key_name
    fi

    # TF_VAR_ami

    echo "AMI ($TF_VAR_ami): "
    read ami
    if [[ $ami != "" ]]; then 
        TF_VAR_ami=$ami
    fi

    # TF_VAR_instance_size

    echo "Instance size ($TF_VAR_instance_size): "
    read instance_size
    if [[ $instance_size != "" ]]; then 
        TF_VAR_instance_size=$instance_size
    fi

    echo "Deploying instance..."

fi

# Deploy

cd $SCRIPTDIR && make deploy