# What is it

This generates bundle, containing dependencies from
npm and makes them available via `window.npm["dependency-name"]`.
We use it to get npm libraries available in our ClojureScript code.

# Requirements

You need to have NPM version 3 installed.

# Usage

Copy content of this repo to "resources/npm".

Edit `package.json` to have npm libraries you wish to use.

Run `make`. This will generate `bundle.js` and `bundle.min.js`.

Edit or create `deps.cljs` in root of your ClojureScript
project to be something like

```
{:foreign-libs [{:file "resources/npm/bundle.js"
                 :file-min "resources/npm/bundle.min.js"
                 :provides ["npm-packages"]}]}
```

If you don't like to use deps.cljs, pass :foreign-libs
as clojurescript compiler option via boot or leiningen.

To use npm libraries in ClojureScript file add
`(:require [npm-packages])` and use something like
`(aget js/npm "npm-library-name")` to access what you
would access using `require("npm-library-name")`
in plain javascript.
