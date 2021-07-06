# tower-action

GitHub Action to launch Nextflow Tower.

## Example usage

```yaml
name: Run pipeline using Nextflow Tower

# Manually trigger the action with a button in GitHub
# Alternatively, trigger on release / push etc.
on:
  workflow_dispatch:

jobs:
  run-tower:
    name: Launch on Nextflow Tower
    # Don't run on forked repos
    if: github.repository == 'username/repo'
    runs-on: ubuntu-latest
    steps:
      - name: Launch workflow via tower
        uses: ewels/tower-action
        # Use repository secrets for sensitive fields
        with:
          workspace_id: ${{ secrets.TOWER_WORKSPACE_ID }}
          bearer_token: ${{ secrets.TOWER_BEARER_TOKEN }}
          compute_env: ${{ secrets.TOWER_COMPUTE_ENV }}
          pipeline: ${{ github.repository }}
          revision: ${{ github.sha }}
          workdir: ${{ secrets.AWS_S3_BUCKET }}/work/${{ github.sha }}
          # Set any custom pipeline params here - JSON object as string
          parameters: |
            {
                outdir: ${{ secrets.AWS_S3_BUCKET }}/results/${{ github.sha }}
            }
          # List of config profiles to use - JSON list as string
          profiles: "[ test, aws_tower ]"
```

## Inputs

### `workspace_id`

**[Required]** Nextflow Tower workspace ID.

### `bearer_token`

**[Required]** Nextflow Tower bearer token.

### `compute_env`

**[Required]** Nextflow Tower compute env.

### `pipeline`

**[Required]** Pipeline repository.

### `revision`

**[Required]** Pipeline revision (release / branch).

### `workdir`

**[Required]** Nextflow work directory.

### `parameters`

**[Required]** Pipeline parameters.

Should be a JSON object, quoted as a string in your GitHub Actions workflow.

### `profiles`

**[Required]** Nextflow config profiles.

Should be a JSON list of strings, quoted in your GitHub Actions workflow.
