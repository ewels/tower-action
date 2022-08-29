# nf-core/tower-action: Changelog

## v3.2.0

* Bumped tower-cli version `0.6.2` -> `0.6.4`
* Save the verbose log to a file, available as a GitHub Actions artefact download

## [[v3.1.0](https://github.com/nf-core/tower-action/releases/tag/v3.1.0)] - 2022-06-26

* Bumped tower-cli version `0.5` -> `0.6.2`

## [[v3.0.1](https://github.com/nf-core/tower-action/releases/tag/v3.0.1)] - 2022-03-23

* Bugfix: should be `--params-file` and not `--params`

## [[v3.0](https://github.com/nf-core/tower-action/releases/tag/v3.0)] - 2022-03-23

### :warning: BREAKING CHANGE :warning:

The new version 0.5 of the Tower CLI only supports full URLs and no longer works with short-form
GitHub repository names (`user/repo`). The full GitHub repository URL now needs to be used
(`https://github.com/user/repo`).

If you are setting `pipeline` in your workflow, please update it accordingly.
Note that the default value is the current repo, so in most cases this value
does not need to be specified.

* Bump Tower CLI to version 0.5
* Prefix the default value for `pipeline` with `https://github.com/` to match changed behaviour in the Tower CLI

## [[v2.2](https://github.com/nf-core/tower-action/releases/tag/v2.2)] - 2022-01-12

Add option to pass nextflow config to Tower CLI.

## [[v2.1](https://github.com/nf-core/tower-action/releases/tag/v2.1)] - 2021-11-30

Add option to pass pre-run script to Tower CLI.

## [[v2.0](https://github.com/nf-core/tower-action/releases/tag/v2.0)] - 2021-11-19

A complete rewrite of the action to use the new [Nextflow Tower CLI](https://github.com/seqeralabs/tower-cli)
instead of calling the API directly with `curl`.

### Breaking changes

* Renamed input `bearer_token` to `access_token`
* Config profiles should now be a comma-separated string instead of JSON array
* Compute environment should be specified by _name_ and not the _ID_.

## [[v0.1](https://github.com/nf-core/tower-action/releases/tag/v0.1)] - 2021-07-06

* Initial release of `nf-core/tower-action`
