function loadroundcorners() 
{
	Nifty("div.roundbox", "transparent");
	Nifty("div.myButton", "transparent");
};

function mytime() 
{
	var currentTime = new Date();
	var month = currentTime.getMonth() + 1
	var day = currentTime.getDate()
	var year = currentTime.getFullYear()
	var hour = currentTime.getHours();
	var minute = currentTime.getMinutes();
	var second = currentTime.getSeconds();

	if (second <= 9) 
		second = "0" + second;

	if (minute <= 9) 
		minute = "0" + minute;

	if (hour <= 9) 
		hour = "0" + hour;

	dispTime = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
	document.getElementById("localclock").innerHTML = "Local Time: " + dispTime;
	setTimeout("mytime()", 1000); 
};

window.onload = function()
{
	loadroundcorners();
	mytime();
}

function checkDelete(captcha_str, id) {
	var captcha = prompt('What is ' + captcha_str + ' ?', '');
	if (captcha != '' && captcha != null) {
		window.location.href = '/conflist/delete/' + id + '?answer=' + captcha
	}
}

function toggleAdd(id, myself) {
	var t = document.getElementById(id);
	var myself = myself;

	if (t.style.display == 'none') {
		// t.style.display = '';
		animatedcollapse.show(id);
		myself.innerHTML = 'Hide';
	} else {
		//t.style.display = 'none';
		animatedcollapse.hide(id);
		myself.innerHTML = 'Add';
	}

	// FIXME: why should I re-execute the round corner scripts?
	loadroundcorners();
}

function checkURL(url) {
    var v = new RegExp(); 
    v.compile("^[A-Za-z]+://[A-Za-z0-9-_%&\?\/.=~]+$"); 
    if (!v.test(url)) { 
	return false; 
    } else {
    	return true;
    } 
}

function checkForm(form) {
	if ((form.acronym.value == "")      ||
	    (form.name.value == "")         ||
	    (form.url.value == "")          ||
	    (form.deadline.value == "")     ||
	    (form.notification.value == "") ||
	    (form.answer.value == "")) {
		alert("Please fill all mandatory fields!");
		return false;
	}

	if (checkURL(form.url.value) == false) {
		alert("Malformed URL!");
		return false;
	}	
	
	return true; 
}

$(function(){
	$("th").aToolTip();
	$("td").aToolTip();
});
