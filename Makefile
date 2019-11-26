.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	lifetioncore-wallet-client.min.js

clean:
	rm lifetioncore-wallet-client.js
	rm lifetioncore-wallet-client.min.js

lifetioncore-wallet-client.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

lifetioncore-wallet-client.min.js: lifetioncore-wallet-client.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
