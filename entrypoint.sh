#!/bin/sh

# Use `tee` to print just stdout to the console but save stdout + stderr to a file
LOG_FN="tower_action_"$(date +'%Y_%m_%d-%H_%M')".log"

# Manual curl of service-info
curl https://api.tower.nf/service-info >> $LOG_FN
echo -e "\n\n------\n\n" >> $LOG_FN

# Health check - print basic settings
tw -v info \
    2>> $LOG_FN | tee -a $LOG_FN

# Print the params input to a file
echo -e "$PARAMETERS" > params.json

# Print the pre-run script to a file
echo -e "$PRE_RUN_SCRIPT" > pre_run.sh

# Print the nextflow config  to a file
echo -e "$NEXTFLOW_CONFIG" > nextflow.config

# Launch the pipeline
tw -v \
    launch \
    $PIPELINE \
    --params-file=params.json \
    ${WORKDIR:+"--work-dir=$WORKDIR"} \
    ${TOWER_COMPUTE_ENV:+"--compute-env=$TOWER_COMPUTE_ENV"} \
    ${REVISION:+"--revision=$REVISION"} \
    ${CONFIG_PROFILES:+"--profile=$CONFIG_PROFILES"} \
    ${PRE_RUN_SCRIPT:+"--pre-run=pre_run.sh"} \
    ${NEXTFLOW_CONFIG:+"--config=nextflow.config"} \
    2>> $LOG_FN | tee -a $LOG_FN

# Strip secrets from the log file
sed -i "s/$TOWER_ACCESS_TOKEN/xxxxxx/" $LOG_FN
