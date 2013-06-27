/**
 * Default function. Usually would be overriden by the component
 */
function submitbutton(pressbutton) {
	submitform(pressbutton);
	// alert(pressbutton);
}

/**
 * Submit the admin form
 */
function submitform(pressbutton) {
	if (pressbutton) {
		document.adminForm.submit_option.value = pressbutton;
	}
	if (typeof document.adminForm.onsubmit == "function") {
		document.adminForm.onsubmit();
	}
	document.adminForm.submit();
}

/**
 * Javascript Trim Remove whitespace at the ends of string
 */
function trim(stringToTrim) {
	return stringToTrim.replace(/^\s+|\s+$/g, "");
}

/**
 * Toggles the check state of a group of boxes.
 * 
 * Checkboxes must have an id attribute in the form cb0, cb1...
 * 
 * @param The
 *            number of box to 'check'
 * @param An
 *            alternative field name
 */
function checkAll(n) {

	fldName = 'cb';

	var f = document.adminForm;
	var c = f.toggle.checked;
	var n2 = 0;
	for (i = 1; i <= n; i++) {
		cb = eval('f.' + fldName + '' + i);

		if (cb) {
			cb.checked = c;
			n2++;
		}

	}
	if (c) {
		document.adminForm.boxchecked.value = n2;
	} else {
		document.adminForm.boxchecked.value = 0;
	}
}

/**
 * Đếm số checkbox record đã được check. Mỗi lần một checkbox được check thì giá
 * trị field boxchecked sẽ tăng lên 1
 */
function isChecked(isitchecked) {
	if (isitchecked == true) {
		document.adminForm.boxchecked.value++;
	} else {
		document.adminForm.boxchecked.value--;
	}

}
function checkThis(cb) {
	var f = document.adminForm;
	cb = eval('f.' + cb);
	if (cb.checked == true) {
		cb.checked = false;
		document.adminForm.boxchecked.value--;
	} else {
		cb.checked = true;
		document.adminForm.boxchecked.value++;
	}
}

function checkOrUncheck(module, controller, id, fieldLabel, renderPlace) {

	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	xmlhttp.onreadystatechange = function() {
		loadingImg = '<img src="' + baseUrl('images/loading.gif')
				+ '" height="16" border="0" />';
		document.getElementById(renderPlace).innerHTML = loadingImg;
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(renderPlace).innerHTML = xmlhttp.responseText;
		}
	}
	urlString = module + '/' + controller + '/check-or-uncheck/id/' + id
			+ '/field_label/' + fieldLabel;
	xmlhttp.open("GET", baseUrl(urlString), true);
	xmlhttp.send();
}

// needed for Table Column ordering
function tableOrdering(order, dir) {
	var form = document.adminForm;

	form.order_field.value = order;
	form.order_dir.value = dir;
	document.adminForm.submit();
}

function imgAjaxDel(module, controller, id, img_name, renderPlace) {
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	xmlhttp.onreadystatechange = function() {
		loadingImg = '<img src="' + baseUrl('images/loading.gif')
				+ '" height="16" border="0" />';
		document.getElementById(renderPlace).innerHTML = loadingImg;
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(renderPlace).innerHTML = xmlhttp.responseText;
			document.getElementById(renderPlace).style.width = "0px";
		}
	}
	urlString = module + '/' + controller + '/img-ajax-del/id/' + id
			+ '/img_name/' + img_name;
	xmlhttp.open("GET", baseUrl(urlString), true);
	xmlhttp.send();
}

function orderingChange(module, controller, id, value, showPlace) {
	
	
	
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	xmlhttp.onreadystatechange = function() {
		document.getElementById(showPlace).value = '-';
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(showPlace).value = xmlhttp.responseText;
		}
	}
	urlString = module + '/' + controller + '/ordering-change/id/' + id
	+ '/value/' + value;
	xmlhttp.open("GET", baseUrl(urlString), true);
	xmlhttp.send();
}

function selectCopy(fieldid){
	
	var field = document.getElementById(fieldid) || eval('document.'+fieldid);
	field.select();
	if (field.createTextRange){ //if browser supports built in copy and paste (IE only at the moment)
		field.createTextRange().execCommand("Copy");
		alert("Value copied to clipboard!");
	}
}