build : ; make tests && npm run build

tests : ; npm run test

watch : ; npm run watch

server : ; php -S localhost:19111

publish : ; npm run build && npm publish --access public
