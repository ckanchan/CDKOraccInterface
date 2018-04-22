# CDKOraccInterface
A simple interface to Oracc open data on the internet.

## WARNINGS
This package is in alpha and is deficient in important ways:
- Depends upon Oracc.org's JSON API, but this API is non-functional.
- Uses the Github public API without an API key; you will need to supply your own key.

## Introduction
This package provides a thin layer over the Oracc JSON API and Oracc JSON Github repo, converting the cuneiform data into [CDKSwiftOracc](https://github.com/ckanchan/CDKSwiftOracc).

## Documentation
Documentation is available [here](./Documentation/Reference/README.md)

## Dependencies
This package depends on 
 - [CDKSwiftOracc](https://github.com/ckanchan/CDKSwiftOracc)
 - [ZIPFoundation](https://github.com/weichsel/ZIPFoundation)
