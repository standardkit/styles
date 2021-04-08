.PHONY: build test

build : ; make test && npm run build

test : ; npm run test

dev : ; npm run build-dev

watch : ; npm run watch

server : ; php -S localhost:19111

publish : ; make build && npm publish --access public
