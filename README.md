# tower-action

GitHub Action to launch Nextflow Tower.

## Example usage

```yaml
name: Launch on Tower

# Manually trigger the action with a button in GitHub
# Alternatively, trigger on release / push etc.
on:
  workflow_dispatch:

jobs:
  run-tower:
    name: Launch on Nextflow Tower
    # Don't try to run on forked repos
    if: github.repository == 'YOUR_USERNAME/REPO'
    runs-on: ubuntu-latest
    steps:
      - uses: ewels/tower-action@master
        # Use repository secrets for sensitive fields
        with:
          workspace_id: ${{ secrets.TOWER_WORKSPACE_ID }}
          bearer_token: ${{ secrets.TOWER_BEARER_TOKEN }}
          compute_env: ${{ secrets.TOWER_COMPUTE_ENV }}
          pipeline: ${{ github.repository }}
          revision: ${{ github.sha }}
          workdir: ${{ secrets.AWS_S3_BUCKET }}/work/${{ github.sha }}
          # Set any custom pipeline params here - JSON object as a string
          parameters: |
            {
                "outdir": "${{ secrets.AWS_S3_BUCKET }}/results/${{ github.sha }}"
            }
          # List of config profiles to use - JSON array as a string
          profiles: '[ "test", "aws_tower" ]'
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
Must all be on a single line.

### `profiles`

**[Required]** Nextflow config profiles.

Should be a JSON list of strings, quoted in your GitHub Actions workflow.
Must all be on a single line.
