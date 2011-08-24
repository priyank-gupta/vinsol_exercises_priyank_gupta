function validat()
{
	var regExpUrl = /^(?:(?:https?)?\:\/\/)?[-\w+&@#%?=~|!:,.;]*[-\w+&@#%=~|\/?]$/i;
	var regExpMail = /^(?:\w+\.?)*\w+@(?:\w+\.)*\w{2,4}$/;
	var ver = new Array();
	var i;
	var b = ["Login Id", "Email", "Name", "Timezone","Home Page","About me"];
	ver[0]= document.getElementById("loginid");
	ver[1]= document.getElementById("email");
	ver[2]= document.getElementById("uname");
	ver[3]= document.getElementById("timezone");
	ver[4]= document.getElementById("homepage");
	ver[5]= document.getElementById("aboutme");
	ver[6]= document.getElementById("check");
	for(i=0;i<=5;i++)
	{
		if(ver[i].value == '')
		{
			alert(b[i]+" field can't be empty");
		}
		else if(i == 1 && !regExpMail.test(ver[i].value)) {
			alert("invalid email ID");
		}
		else if(i == 4 && !regExpUrl.test(ver[i].value)) {
			alert("invalid homepage ID");
		}
		else if(i == 5 && ver[i].value.length < 50)
		{
			alert("Please write minimum of 50 charcters in textarea");
		}
	}
	for(i=0;i<=5;i++)
	{
		if(ver[i].value == '')
		{
			ver[i].focus();
			return false;
		}
		else if(i == 1 && !regExpMail.test(ver[i].value)) {
			ver[1].focus();
			return false;
		}
		else if(i == 4 && !regExpUrl.test(ver[i].value)) {
			ver[4].focus();
			return false;
		}
		if(i == 5 && ver[i].value.length < 50)
		{
			ver[5].focus();
			return false;
		}
	}
	
	var n = confirm("do you want to receive notifications ?")
	if(n == true)
	ver[6].checked=true;
	if(n == false)
	ver[6].checked=false;
	var m = confirm("do you want to submit this form");
	if(m == true)
	document.forms[0].submit();
	else
	return false;
}

