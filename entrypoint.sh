#!/bin/sh

# Health check - print basic settings
tw info

# Launch the pipeline
tw launch $PIPELINE \
    --work-dir=$WORKDIR
    --params=$PARAMETERS \
    ${TOWER_WORKSPACE_ID:+"--workspace=$TOWER_WORKSPACE_ID"} \
    ${TOWER_COMPUTE_ENV:+"--compute-env=$TOWER_COMPUTE_ENV"} \
    ${REVISION:+"--revision=$REVISION"} \
    ${CONFIG_PROFILES:+"--profile=$CONFIG_PROFILES"}
