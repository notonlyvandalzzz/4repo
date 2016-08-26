
function something() {
	var x = window.localStorage.getItem('aaa');
	x = x * 1 + 1;
	window.localStorage.setItem('aaa', x);
	alert (x);
	}

function addtocart(id) {
	var key = 'pzshp_product_' + id;
	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;
	window.localStorage.setItem(key, x);
	for (var i = 0; i < localStorage.length; i++){
		if (key.search('pzshp_product') >= 0) {
			tot = tot * 1 + window.localStorage[key] * 1;
		}
	}
	alert ('Total items: ' + tot);
	// alert ('You\'ve added one pizza with id ' + id);
}