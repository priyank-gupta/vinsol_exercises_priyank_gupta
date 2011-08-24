
function chk() {

	var url = document.getElementById("domain").value;	
	if(url.match(/^\s*$/)){
		alert("please enter a url");
		return false;
	} 
	url = url.replace(/(?:^http\:\/\/|^https\:\/\/|^ftp\:\/\/)?(?:www\.)?/i,"");
	url = url.replace(/\/(.*)/,"");
	if (url.match(/(\w+\.\w{2,3}\.\w{2})$/i)) {
		alert("Domain:: "+RegExp.$1);
    url = url.replace(/\w+\.\w{2,3}\.\w{2}$/i,"");
	}
	else if (url.match(/(\w+\.\w{3,})$/i)) {
		alert("Domain:: "+RegExp.$1);
    url = url.replace(/\w+\.\w{3,}$/i,"");
	} 
	else {
		alert("enter a valid url");
		return false;
	}
	var subDomain = (url.match(/(.*)\.$/g)) ? true : false;
	if(subDomain) {
		alert("SubDomain:: " +RegExp.$1);
	} 
	else {
		alert("SubDomain does not exists.");
	}
}

