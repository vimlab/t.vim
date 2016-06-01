
all: help

help:
	bake -h

babel:
	babel lib/ -d src/

test: eslint babel mocha

mocha:
	mocha -R spec

eslint:
	eslint .

fix:
	eslint . --fix

watch:
	watchd lib/**.js test/**.js package.json -c 'bake babel'

release: version push publish

version:
	standard-version -m '%s'

push:
	git push origin master --tags

publish: test
	npm publish
