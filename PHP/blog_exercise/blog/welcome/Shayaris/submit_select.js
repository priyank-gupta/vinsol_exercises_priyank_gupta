function trim(string) {
	return string.replace(/^\s+.\s+$/g,'');
}
function postComment(commentButton)
{
	var comment=commentButton.parentNode.childNodes[0].value;
	if(trim(comment)!="")
	{
		var id=commentButton.parentNode.childNodes[2].value;
		if (window.XMLHttpRequest)
		{// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else
		{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function()
		{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				commentButton.parentNode.childNodes[0].value='';
				commentButton.parentNode.previousSibling.innerHTML='';
				commentButton.parentNode.previousSibling.innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("POST","comment.php",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("shayari_id="+id+"&comment="+comment);
	}
}
function clear_comment(clearButton) {
	clearButton.parentNode.childNodes[0].value ='';
}
function delete_shayari(del_button,shayari_id) {
	con = confirm("Are you sure you want to delete this shayari ?");
	if (con) {
		del_div = del_button.parentNode.parentNode.parentNode;
		if (window.XMLHttpRequest)
		{// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else
		{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function()
		{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				del_div.innerHTML = "";
			}
		}
		xmlhttp.open("POST","delete_shayari.php",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("shayari_id="+shayari_id);
	}
}
