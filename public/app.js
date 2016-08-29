
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
	update_orders_input();
	update_ord_btn();
	// alert ('You\'ve added one pizza with id ' + id);
}

function clear_cart() {
	window.localStorage.clear();
	window.location='http://pizza.dexp.club';
}

function cart_get_no_items() {
	var tot = 0;
	for (var i = 0; i < localStorage.length; i++){
		var ckey = window.localStorage.key(i);
		var cval = window.localStorage.getItem(ckey);
		// if (key.search('pzshp_product') >= 0) {
		// 	tot = tot * 1 + window.localStorage[key] * 1;
		// }
		if (ckey.indexOf('pzshp_product') == 0) {
			tot = tot * 1 + cval * 1;
		}
	}
	// document.getElementById('basket').innerHTML = 'Total ' + tot;
	return tot;
}

function cart_get_orders() {
	var ord = '';
	for (var i = 0; i < localStorage.length; i++){
		var ckey = window.localStorage.key(i);
		var cval = window.localStorage.getItem(ckey);
		// if (key.search('pzshp_product') >= 0) {
		// 	tot = tot * 1 + window.localStorage[key] * 1;
		// }
		if (ckey.indexOf('pzshp_product') == 0) {
			ord = ord + ckey + '=' + cval + ',';
		}
	// document.getElementById('basket').innerHTML = 'Total ' + tot;
	}
	return ord;
	
}


function update_orders_input() {
	var orders = cart_get_orders();
	$('#orderlist').val(orders);
}

function update_ord_btn() {
	var amount = 'Cart (' + cart_get_no_items() + ')';
	$('#ordamnt').val(amount);
}