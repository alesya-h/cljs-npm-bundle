# What is it

This generates bundle, containing dependencies from
npm and makes them available via `window.npm["dependency-name"]`.
We use it to get npm libraries available in our ClojureScript code.

# Requirements

You need to have NPM version 3 installed.

# Usage

To add new dependency, just add it to `package.json`.

To generate bundle, run `make`.

To delete generated files, run `make clean`.

