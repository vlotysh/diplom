/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var keyinterval;
var available = 0;
var subdomain="kohana"; //пустая строка (""),если папка с ресурсами (media) лежит в корне основного домена

function getBaseURL(subdom) {
var url = location.href;  // entire url including querystring - also: window.location.href;
var baseURL = url.substring(0, url.indexOf('/', 14));
var sbd="";

if ((subdom!='')&(subdom!=null))
sbd=subdom+"/";
else
sbd='';  
//console.log(sbd);

if (baseURL.indexOf('http://localhost') != -1) {
    // Base Url for localhost
    var url = location.href;  // window.location.href;
    var pathname = location.pathname;  // window.location.pathname;
    var index1 = url.indexOf(pathname);
    var index2 = url.indexOf("/", index1 + 1);
    var baseLocalUrl = url.substr(0, index2);

    return baseLocalUrl + "/"+sbd;
}
else {
    // Root Url for domain name
    return baseURL + "/"+sbd;
}}

function checkavailability() {
	clearInterval(keyinterval);
        
        //console.log(getBaseURL());
	$("#status").html('<img align="absmiddle" src="'+getBaseURL(subdomain)+'media/images/account/loader.gif" /> Checking availability...');
      //  $("#status").html('Checking availability...');
	$.ajax({
		type: "POST",
		url: "checkusername",
		data: "username=" + $("#username").val(),
		cache: false,
		async: true,
		dataType: "json",
		success: function(resultArray, textStatus, XMLHttpRequest)
		{
			if(resultArray['available']) {
				available = 1;
				$("#status").show();
				$("#status").html('<img align="absmiddle" src="'+getBaseURL(subdomain)+'media/images/account/accepted.png" />Available!');
			} else {
				available = 0;
				$("#status").show();
				$("#status").html('<img align="absmiddle" src="'+getBaseURL(subdomain)+'media/images/account/notaccepted.png" /> Not available...');
                               // $("#status").html('Not available...');
			}
		},
		error: function(request, textStatus, errorThrown)
		{
			alert('error');
		}
	});
}

$(document).ready(function () {

	// focus email
	$("#focus").focus();

	// validation
	$('#username').alphanumeric();
	
	// disable submit on submit
	$('form').submit(function(){
	    $('input[type=submit]', this).attr('disabled', 'disabled');
	});
	
	// check user availability
	$('#username').keyup(function() {
		var usr = $("#username").val();
		var pwd = $("#password").val();

		if(usr.length >= 1 && usr == pwd) {
			clearInterval(keyinterval);
			$("#status").show();
			$("#status").html('Username cannot be the same as password');
		} else {
			if(usr.length >= 3) {
					clearInterval(keyinterval);
					keyinterval = setInterval( "checkavailability()", 1000);
			} else {
				$("#status").hide();
			}
		}
	});

	$("#username").change(function() {
		var usr = $("#username").val();
		if(usr.length < 3) {
			$("#status").show();
			$("#status").html('The username should have at least 3 characters.');
		} else if(available) {
			$("#status").hide();
		}
	});


	$('#password').keyup(function() {
		var usr = $("#username").val();
		var pwd = $("#password").val();

		if(usr == pwd) {
			$("#status").show();
			$(".password_strength").html('<b>Password cannot be the same as username</b>');
		}
	});
	
	$('#password').password_strength({'texts' : {
		1 : 'Too weak',
		2 : 'Weak password',
		3 : 'Normal strength',
		4 : 'Strong password',
		5 : 'Very strong password'
		}
	});
	
});







///////////////////////////////

