#!/bin/sh

# Health check - print basic settings
tw info

# Print the params input to a file
echo -e $PARAMETERS > params.json

# Print the pre-run script to a file
echo -e $PRE_RUN_SCRIPT > pre_run.sh

# Print the nextflow config  to a file
echo -e $NEXTFLOW_CONFIG > nextflow.config

# Launch the pipeline
tw \
    launch \
    $PIPELINE \
    --params=params.json \
    ${WORKDIR:+"--work-dir=$WORKDIR"} \
    ${TOWER_COMPUTE_ENV:+"--compute-env=$TOWER_COMPUTE_ENV"} \
    ${REVISION:+"--revision=$REVISION"} \
    ${CONFIG_PROFILES:+"--profile=$CONFIG_PROFILES"} \
    ${PRE_RUN_SCRIPT:+"--pre-run=pre_run.sh"} \
    ${NEXTFLOW_CONFIG:+"--config=nextflow.config"}
