#!/bin/sh

# Health check - print basic settings
tw info

# Print the params input to a file
echo $PARAMETERS > params.json

# Launch the pipeline
tw launch $PIPELINE \
    --params=params.json \
    ${WORKDIR:+"--work-dir=$WORKDIR"} \
    ${TOWER_COMPUTE_ENV:+"--compute-env=$TOWER_COMPUTE_ENV"} \
    ${REVISION:+"--revision=$REVISION"} \
    ${CONFIG_PROFILES:+"--profile=$CONFIG_PROFILES"} \
    ${PRE_RUN_SCRIPT:+"--pre-run=$PRE_RUN_SCRIPT"}
