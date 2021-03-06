setup-local:
	ubuntu/setup-dependencies.sh
	ubuntu/setup-certified.sh
	ubuntu/setup-certified-ca.sh
	ubuntu/setup-certified-certs.sh
	ubuntu/setup-gunicorn.sh
	ubuntu/setup-nginx.sh

mapzen: styleguide yesnofix logo mapzenjs crosshairs fragments whosonfirstjs whosonfirstdata

fragments: 
	curl -s -o www/templates/inc_mapzen_navbar.html https://mapzen.com/site-fragments/navbar.html
	curl -s -o www/templates/inc_mapzen_footer.html https://mapzen.com/site-fragments/footer.html

logo:
	curl -s -o www/static/images/mapzen-logo-square-bw-lit.png https://mapzen.com/resources/logos/mapzen-logo-square-bw-lit.png

yesnofix:
	curl -s -o www/static/javascript/mapzen.whosonfirst.yesnofix.js https://raw.githubusercontent.com/whosonfirst/js-mapzen-whosonfirst-yesnofix/master/src/mapzen.whosonfirst.yesnofix.js

styleguide:
	curl -s -o www/static/css/mapzen.styleguide.css https://mapzen.com/common/styleguide/styles/styleguide.css
	curl -s -o www/static/javascript/mapzen-styleguide.min.js https://mapzen.com/common/styleguide/scripts/mapzen-styleguide.min.js

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

whosonfirstjs: localforage
	curl -s -o www/static/javascript/mapzen.whosonfirst.namify.js https://raw.githubusercontent.com/whosonfirst/js-mapzen-whosonfirst/master/src/mapzen.whosonfirst.namify.js
	curl -s -o www/static/javascript/mapzen.whosonfirst.footnotes.js https://raw.githubusercontent.com/whosonfirst/js-mapzen-whosonfirst/master/src/mapzen.whosonfirst.footnotes.js
	curl -s -o www/static/javascript/mapzen.whosonfirst.uri.js https://raw.githubusercontent.com/whosonfirst/js-mapzen-whosonfirst/master/src/mapzen.whosonfirst.uri.js
	curl -s -o www/static/javascript/mapzen.whosonfirst.log.js https://raw.githubusercontent.com/whosonfirst/js-mapzen-whosonfirst/master/src/mapzen.whosonfirst.log.js
	curl -s -o www/static/javascript/mapzen.whosonfirst.net.js https://raw.githubusercontent.com/whosonfirst/js-mapzen-whosonfirst/master/src/mapzen.whosonfirst.net.js
	curl -s -o www/static/javascript/mapzen.whosonfirst.php.js https://raw.githubusercontent.com/whosonfirst/js-mapzen-whosonfirst/master/src/mapzen.whosonfirst.php.js

localforage:
	curl -s -o www/static/javascript/localforage.js https://raw.githubusercontent.com/mozilla/localForage/master/dist/localforage.js
	curl -s -o www/static/javascript/localforage.min.js https://raw.githubusercontent.com/mozilla/localForage/master/dist/localforage.min.js

whosonfirstdata:
	curl -s -o www/static/whosonfirst/102527513.geojson https://whosonfirst.mapzen.com/data/102/527/513/102527513.geojson
	curl -s -o www/static/whosonfirst/102061079.geojson https://whosonfirst.mapzen.com/data/102/061/079/102061079.geojson
	curl -s -o www/static/whosonfirst/102031307.geojson https://whosonfirst.mapzen.com/data/102/031/307/102031307.geojson
	curl -s -o www/static/whosonfirst/85921881.geojson https://whosonfirst.mapzen.com/data/859/218/81/85921881.geojson
