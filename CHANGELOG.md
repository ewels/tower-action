# nf-core/tower-action: Changelog

## [2.0dev]

A complete rewrite of the action to use the new [Tower cli tool](https://github.com/seqeralabs/tower-cli)
instead of calling the API directly with `curl`.

## Breaking changes

* Renamed input `bearer_token` to `access_token`
* Config profiles should now be a comma-separated string instead of JSON array
* Compute environment should be specified by _name_ and not the _ID_.

## [[1.0](https://github.com/nf-core/tower-action/releases/tag/1.0)] - 2021-07-06

* Initial release of `nf-core/tower-action`
