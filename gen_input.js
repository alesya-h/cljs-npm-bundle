var fs = require('fs');
var deps = require('./package.json')["dependencies"];

var result =
  "require('babel-polyfill');\n" +
  "window.npm = {};\n";

for(var dep in deps) {
    result += ("window.npm[\"" + dep + "\"] = require('" + dep + "');\n");
}

fs.writeFileSync('input.js', result);
