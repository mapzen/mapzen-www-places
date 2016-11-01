var mapzen = mapzen || {};
mapzen.whosonfirst = mapzen.whosonfirst || {};

mapzen.whosonfirst.footnotes = (function() {

    var self = {

	'init': function(){

	},

	'add_footnotes': function(src, target, args){

	    if (! args){
		args = {};
	    }

	    var defaults = {
		'class': '',
	    };

	    for (var property in defaults) {

		if (! args.hasOwnProperty(property)) {
		    args[property] = defaults[property];
		}
	    }

	    var seen = {};
	    var lookup = {};
	    var idx = 0;
	    
	    var source = document.getElementById(src);
	    var target = document.getElementById(target);

	    var links = source.getElementsByTagName("a");
	    var count = links.length;
	    
	    for (var i=0; i < count; i++){
		
		var el = links[i];
		var href = el.getAttribute("href");

		if (args['class']){

		    var classes = el.getAttribute("class");
		    
		    if (! classes){
			continue;
		    }
		    
		    classes = classes.split(" ");
		    var count_classes = classes.length;
		    
		    if (count_classes == 0){
			continue;
		    }
		    
		    var ok = false;
		    
		    for (var c = 0; c < count_classes; c++){
			
			if (classes[c] == args['class']){
			    ok = true;
			    break;
			}
		    }
		    
		    if (! ok){
			continue;
		    }
		}

		if (! seen[href]){
		    idx += 1;
		    seen[href] = idx;
		}		 

		if (! lookup[href]){
		    lookup[href] = [];
		}		  
		
		lookup[href].push(el);
	    }
	    
	    var footnotes = document.createElement("ol");
	    footnotes.setAttribute("class", "list");
	    footnotes.setAttribute("id", "footnotes");
	    
	    for (var href in seen){
		
		var idx = seen[href];
		
		for (var j in lookup[href]){
		    
		    var el = lookup[href][j];
		    el.setAttribute("data-footnote-id", idx);
		    
		    var sup = document.createElement("sup");
		    sup.appendChild(document.createTextNode(idx));
		    
		    el.parentNode.insertBefore(sup, el.nextSibling);
		}		  

		var li = document.createElement("li");
		li.appendChild(document.createTextNode(href));
		
		footnotes.appendChild(li);
	    }
	    
	    target.appendChild(footnotes);
	}

    };

    return self;

})();
