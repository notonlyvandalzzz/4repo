
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
	// alert ('You\'ve added one pizza with id ' + id);
}