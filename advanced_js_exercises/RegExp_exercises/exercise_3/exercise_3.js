
function chk() {

	var regExpCh = /^(?:(?:https?)?\:\/\/)?[-\w+&@#%?=~|!:,.;]*[-\w+&@#%=~|\/?]$/i;
	var regExpURL = /^(?:https?\:\/\/)?(?:www\.)?([\w\.]*)\.(\w+\.\w+)/i;
	var regExpTwo = /^(?:https?\:\/\/)?(\w+\.\w+)$/i;
	var regExpW = /^www$/i;
	var url = document.getElementById("domain").value;
	if(url == "") {
		alert("enter URL");
		return false;
	}
	if(regExpTwo.test(url)) {
		alert("Domain:: "+ RegExp.$1);
		alert("No SubDomain exists");
		return true;
	}
	var result = regExpURL.test(url);
	alert("Domain:: "+RegExp.$2);
	if(!regExpW.test(RegExp.$1)) {
		alert("SubDomain:: " + RegExp.$1);
	}
	else {
		alert("No SubDomain exists");
	}
}

