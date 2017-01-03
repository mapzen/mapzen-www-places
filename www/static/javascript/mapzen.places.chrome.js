var mapzen = mapzen || {};
mapzen.places = mapzen.places || {};

mapzen.places.chrome = (function(){

	var self = {

		'init': function() {

			var host = location.host;

			if (host == "mapzen.com") {
				return;
			}

			var host_id = host.replace(".", "-");
			
			var host_el = document.createElement("div");
			host_el.setAttribute("id", "places-host-" + host_id);
			host_el.setAttribute("class", "places-host");

			host_el.appendChild(document.createTextNode(host));

			document.body.insertBefore(host_el, document.body.childNodes[0]);
		}
	};

	return self;
})();
