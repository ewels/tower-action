#!/bin/sh

set -e

# Escape double quotes in the params
PARAMS_ESCAPED=`echo $PARAMETERS | sed 's/"/\\\"/g'`

# Optional payload
WORKSPACE=${TOWER_WORKSPACE_ID:+'workspaceId='TOWER_WORKSPACE_ID}
COMPUTE=${TOWER_COMPUTE_ENV:+'"computeEnvId": "'$TOWER_COMPUTE_ENV'",'}
REV=${REVISION:+'"revision": "'$REVISION'",'}

PAYLOAD='
{
    "launch": {
        "pipeline": "'${PIPELINE}'",
        "workDir": "'${WORKDIR}'",
        '${COMPUTE}${REV}'
        "paramsText": "'$PARAMS_ESCAPED'",
        "configProfiles": '$CONFIG_PROFILES',
        "resume": false
    }
}'

echo $PAYLOAD

curl \
    --silent \
    --show-error \
    --fail \
    -X POST "https://api.tower.nf/workflow/launch?${WORKSPACE}" \
    -H "Accept: application/json" \
    -H "Authorization: Bearer ${TOWER_BEARER_TOKEN}" \
    -H "Content-Type: application/json" \
    -d "$PAYLOAD"
