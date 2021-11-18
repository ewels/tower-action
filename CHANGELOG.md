# nf-core/tower-action: Changelog

## [[v2.0](https://github.com/nf-core/tower-action/releases/tag/v2.0)] - 2021-11-18

A complete rewrite of the action to use the new [Nextflow Tower CLI](https://github.com/seqeralabs/tower-cli)
instead of calling the API directly with `curl`.

### Breaking changes

* Renamed input `bearer_token` to `access_token`
* Config profiles should now be a comma-separated string instead of JSON array
* Compute environment should be specified by _name_ and not the _ID_.

## [[v0.1](https://github.com/nf-core/tower-action/releases/tag/v0.1)] - 2021-07-06

* Initial release of `nf-core/tower-action`
