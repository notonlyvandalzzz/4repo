
function something() {
	var x = window.localStorage.getItem('aaa');
	x = x * 1 + 1;
	window.localStorage.setItem('aaa', x);
	alert (x);
	}

function addtocart(id) {
	var x = window.localStorage.getItem('pzshp_product_' + id);
	x = x * 1 + 1;
	window.localStorage.setItem('pzshp_product_' + id, x);
	alert ('You\'ve added one pizza with id ' + id);
}