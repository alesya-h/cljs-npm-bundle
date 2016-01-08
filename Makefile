.DELETE_ON_ERROR:

all: bundle.min.js

node_modules: package.json Makefile
	npm install

input.js: node_modules gen_input.js
	node gen_input.js

bundle.js: input.js
	node_modules/browserify/bin/cmd.js input.js -o bundle.js -g browserify-shim -g [ babelify --presets [ react ] ]

bundle.min.js: bundle.js
	node_modules/uglify-js/bin/uglifyjs bundle.js -o bundle.min.js

clean: cleanup
	rm -f bundle.js
	rm -f bundle.min.js

cleanup:
	rm -rf node_modules
	rm -f input.js
