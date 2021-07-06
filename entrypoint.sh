#!/bin/sh

set -e

PAYLOAD='
{
    "launch": {
        "computeEnvId": "'${TOWER_COMPUTE_ENV}'",
        "pipeline": "'${PIPELINE}'",
        "workDir": "'${WORKDIR}'",
        "paramsText": "'${PARAMETERS}'",
        "revision": "'${REVISION}'",
        "configProfiles": '${PROFILES}',
        "resume": false
    }
}'

echo "$PAYLOAD"

echo "---"

echo $PARAMETERS

echo "---"

echo $PARAMS_STRING

echo "---"

PARAMS_STRING_ESCAPED=`echo $PARAMS_STRING | sed 's/"/\\\"/g'`
echo $PARAMS_STRING_ESCAPED


curl \
    --silent \
    --show-error \
    --fail \
    -X POST "https://api.tower.nf/workflow/launch?workspaceId=${TOWER_WORKSPACE_ID}" \
    -H "Accept: application/json" \
    -H "Authorization: Bearer ${TOWER_BEARER_TOKEN}" \
    -H "Content-Type: application/json" \
    -d "$PAYLOAD"
