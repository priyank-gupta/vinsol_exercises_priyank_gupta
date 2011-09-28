
var grid_input = document.getElementById('for_grid');
var odiv = document.getElementById('grid');
odiv.style.marginTop="20px";
var stylesheet1 = document.createElement('style');
stylesheet1.type="text/css";
document.getElementsByTagName('head')[0].appendChild(stylesheet1);
var stylesheet2 = document.createElement('style');
stylesheet2.type="text/css";
document.getElementsByTagName('head')[0].appendChild(stylesheet2);
var gin=0;

function text_parse() {
	var col_style, col_class, row_style, row_class;
	odiv.innerHTML = "";
	var each_text_value = grid_input.value.split(',');
	var regExpGrid = /^\s*([0-9]+)\s*\*\s*([0-9]+)\s*$/;
	var regExpCstyle = /^\s*cstyle=\s*["']\s*(.*)\s*['"]\s*$/;
	var regExpCclass = /^\s*cclass=\s*["']\s*(.*)\s*['"]\s*$/;
	var regExpRstyle = /^\s*rstyle=\s*["']\s*(.*)\s*['"]\s*$/;
	var regExpRclass = /^\s*rclass=\s*["']\s*(.*)\s*['"]\s*$/;
	stylesheet1.innerHTML = "";
	stylesheet2.innerHTML = "";
	for (var j = 0; j < each_text_value.length ; j++) {
		if(regExpGrid.test(each_text_value[j])) {
			gin = 1;
		}
	}
	if (!gin) {
		alert("grid is compulsory (m*n)");
	}
		
	for (var i = 0; i < each_text_value.length ; i++) {
		if(regExpGrid.test(each_text_value[i])) {
			alert(RegExp.$1+"and"+RegExp.$2);
			var grid_1 = RegExp.$1;
			var grid_2 = RegExp.$2;
			var oTable = document.createElement("table");
			oTable.setAttribute("border", "1");
			oTable.style.width = "100%";
			var oTBody = document.createElement("tbody");
			oTable.appendChild(oTBody);
			for ( var x=0; x<grid_1; x++ ) {
				var ro = oTBody.insertRow(x);
				for ( var y=0; y<grid_2; y++ ) {
					var cll = oTBody.rows[x].insertCell(y);
					cll.style.padding = "6px";
					var text = document.createElement("input");
					text.type = "text";
					var buttn = document.createElement('input');
					buttn.type='button';
					buttn.addEventListener('click', inserting, false);
					buttn.value="insert HTML";
					oTBody.rows[x].cells[y].appendChild(text);
					oTBody.rows[x].cells[y].appendChild(buttn);	
				}
			}		
			odiv.appendChild(oTable);			
			continue;
		}
		if(regExpCstyle.test(each_text_value[i])) {
			alert(RegExp.$1);
			col_style = RegExp.$1;
			if(col_class) {
				stylesheet1.innerHTML = "td." + col_class + "{" + col_style + "}";
			}else {
				stylesheet1.innerHTML = 'td' + '{' + col_style + '}';
			}
			continue;
		}
		if(regExpCclass.test(each_text_value[i])) {
			alert(RegExp.$1);
			col_class = RegExp.$1;
			if(col_style) {
				stylesheet1.innerHTML = 'td.' + col_class + '{' + col_style + '}';
			}
			var all_td = document.getElementsByTagName('td');
			for(var z=0;z<all_td.length ;z++) {
				all_td[z].className = col_class;
			}
			continue;
		}
		if(regExpRstyle.test(each_text_value[i])) {
			alert(RegExp.$1);
			row_style = RegExp.$1;
			if(row_class) {
				stylesheet2.innerHTML = 'tr.' + row_class + '{' + row_style + '}';
			}else {
				stylesheet2.innerHTML = 'tr' + '{' + row_style + '}';
			}
			continue;
		}
		if(regExpRclass.test(each_text_value[i])) {
			alert(RegExp.$1);
			row_class = RegExp.$1;
			if(row_style) {
				stylesheet2.innerHTML = 'tr.' + row_class + '{' + row_style + '}';
			}
			var all_tr = document.getElementsByTagName('tr');
			for(var z=0;z<all_tr.length ;z++) {
				all_tr[z].className = row_class;
			}
			continue;
		}	
	}
}
function inserting() {
	var textinput = this.parentNode.firstChild;
	var cell = this.parentNode;
	var pdiv = document.createElement("div");
	var edit_button = document.createElement("input");
	edit_button.type="button";
	edit_button.value="edit HTML";
	edit_button.addEventListener('click', editing, false);
	pdiv.innerHTML = textinput.value;
	cell.innerHTML = "";
	cell.appendChild(pdiv);
	cell.appendChild(edit_button);	
}
function editing() {
	var divtext = this.parentNode.firstChild.innerHTML;
	var cell = this.parentNode;
	var text = document.createElement("input");
	text.type = "text";
	text.width = "100%";
	text.value = divtext;
	var buttn = document.createElement('input');
	buttn.type='button';
	buttn.addEventListener('click', inserting, false);
	buttn.value="insert HTML";
	cell.innerHTML = "";
	cell.appendChild(text);
	cell.appendChild(buttn);
}
