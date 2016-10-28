setup-local:
	ubuntu/setup-dependencies.sh
	ubuntu/setup-certified.sh
	ubuntu/setup-certified-ca.sh
	ubuntu/setup-certified-certs.sh
	ubuntu/setup-gunicorn.sh
	ubuntu/setup-nginx.sh

mapzen: styleguide tangram refill yesnofix logo mapzenjs crosshairs

logo:
	curl -s -o www/static/images/mapzen-logo-square-bw-lit.png https://mapzen.com/resources/logos/mapzen-logo-square-bw-lit.png

yesnofix:
	curl -s -o www/static/javascript/mapzen.whosonfirst.yesnofix.js https://raw.githubusercontent.com/whosonfirst/js-mapzen-whosonfirst-yesnofix/master/src/mapzen.whosonfirst.yesnofix.js

styleguide:
	curl -s -o www/static/css/mapzen.styleguide.css https://mapzen.com/common/styleguide/styles/styleguide.css

tangram:
	curl -s -o www/static/javascript/tangram.js https://mapzen.com/tangram/tangram.debug.js
	curl -s -o www/static/javascript/tangram.min.js https://mapzen.com/tangram/tangram.min.js

mapzenjs:
	curl -s -o www/static/css/mapzen.js.css https://mapzen.com/js/mapzen.css
	curl -s -o www/static/javascript/mapzen.js https://mapzen.com/js/mapzen.min.js

refill:
	curl -s -o www/static/tangram/refill.yaml https://raw.githubusercontent.com/tangrams/refill-style/gh-pages/refill-style.yaml
	curl -s -o www/static/tangram/images/poi_icons_18@2x.png https://raw.githubusercontent.com/tangrams/refill-style/gh-pages/images/poi_icons_18%402x.png
	curl -s -o www/static/tangram/images/building-grid.gif https://raw.githubusercontent.com/tangrams/refill-style/gh-pages/images/building-grid.gif

crosshairs:
	curl -s -o www/static/javascript/slippymaps.crosshairs.js https://raw.githubusercontent.com/whosonfirst/js-slippymap-crosshairs/master/src/slippymap.crosshairs.js

localforage:
	curl -s -o www/static/javascript/localforage.js https://raw.githubusercontent.com/mozilla/localForage/master/dist/localforage.js
	curl -s -o www/static/javascript/localforage.min.js https://raw.githubusercontent.com/mozilla/localForage/master/dist/localforage.min.js
