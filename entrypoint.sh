#!/bin/sh

set -e

# Escape double quotes in the params
PARAMS_ESCAPED=`echo $PARAMETERS | sed 's/"/\\\"/g'`

# Optional payload
COMPUTE=${TOWER_COMPUTE_ENV:+'"computeEnvId": "'$TOWER_COMPUTE_ENV'",'}
PARAMS=${PARAMETERS:+'"paramsText": "'$PARAMS_ESCAPED'",'}
REV=${REVISION:+'"revision": "'$REVISION'",'}
PROFILES=${CONFIG_PROFILES:+'"configProfiles": '$CONFIG_PROFILES','}

PAYLOAD='
{
    "launch": {
        "pipeline": "'${PIPELINE}'",
        "workDir": "'${WORKDIR}'",
        '${COMPUTE}${PARAMS}${REV}${PROFILES}'
        "resume": false
    }
}'

echo $PAYLOAD

curl \
    --silent \
    --show-error \
    --fail \
    -X POST "https://api.tower.nf/workflow/launch?workspaceId=${TOWER_WORKSPACE_ID}" \
    -H "Accept: application/json" \
    -H "Authorization: Bearer ${TOWER_BEARER_TOKEN}" \
    -H "Content-Type: application/json" \
    -d "$PAYLOAD"
