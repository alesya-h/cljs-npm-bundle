all: bundle.min.js

node_modules: package.json
	npm install

input.js: node_modules
	node gen_input.js

bundle.js: input.js
	node_modules/browserify/bin/cmd.js input.js -o bundle.js -g [ browserify-shim --react global:React ] -g reactify || rm bundle.js && false

bundle.min.js: bundle.js
	node_modules/browserify/bin/uglifyjs bundle.js -o bundle.min.js

clean:
	rm -rf node_modules
	rm -f input.js
	rm -f bundle.js
	rm -f bundle.min.js
