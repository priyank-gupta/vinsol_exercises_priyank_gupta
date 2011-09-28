
function Template(tempStr) {
	this.tempStr = tempStr;
}

Template.prototype.templatize = function() {
	var str = this.tempStr;
	var odiv = document.getElementById('display');
	str = this.hcounter(str);
	str = this.pcounter(str);
	odiv.innerHTML = str;
}	
	
Template.prototype.hcounter = function(str) {
	var count = 0;
	for(var i=0;i< str.length;i++) {
		if(str.charAt(i) == '|' && count%2 == 0) {
			str = str.replace(str.charAt(i),"<h1>");
			count++;
		} else if(str.charAt(i) == '|' && count%2 != 0) {
			str = str.replace(str.charAt(i),"</h1>");
			count++;
		}
	}
	alert("hcounter : " + count);
	return str;
}

Template.prototype.pcounter = function(str) {
	var count = 0;
	var str1 = "";
	var regExpblank = /^\s+$/;
	var regExpHead = /<h1>.*<\/h1>/;
	var str_arr = str.split("\n");
	for( var i = 0; i<str_arr.length;i++) {
		if(str_arr[i]  && !regExpblank.test(str_arr[i])) {
			if(regExpHead.test(str_arr[i])) {
				str1= str1 + str_arr[i];
				continue;
			}else {
				str_arr[i] = "<p>" + str_arr[i] + "</p>";
				str1 =str1 + str_arr[i];
				count++;
				continue;
			}
		}
	}
	alert("pcounter : " + count);
	return str1;
}

function initiate() {
	var otext = document.getElementById('inp');
	var str = otext.value;
	var parsing = new Template(str);
	parsing.templatize();
}
