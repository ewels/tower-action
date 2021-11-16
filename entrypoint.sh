#!/bin/sh

set -e

PAYLOAD=$(
    jq -n \
        --arg pipeline "$PIPELINE" \
        --arg workDir "$WORKDIR" \
        ${TOWER_COMPUTE_ENV:+--arg computeEnvId "$TOWER_COMPUTE_ENV"} \
        ${REVISION:+--arg revision "$REVISION"} \
        --arg paramsText "$PARAMETERS" \
        --arg configProfiles "$CONFIG_PROFILES" \
        --argjson resume false \
        '{ launch: $ARGS.named }'
)

curl \
    --silent \
    --show-error \
    --dump-header - \
    --fail-with-body \
    -X POST 'https://api.tower.nf/workflow/launch?'${TOWER_WORKSPACE_ID:+workspaceId="$TOWER_WORKSPACE_ID"} \
    -H "Accept: application/json" \
    -H "Authorization: Bearer ${TOWER_BEARER_TOKEN}" \
    -H "Content-Type: application/json" \
    -d "$PAYLOAD"
