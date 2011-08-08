
function saving() {
	var col = this.parentNode;
	var ro = col.parentNode;
	var cell1 = ro.childNodes[0];
	var cell2 = ro.childNodes[1];
	var cell3 = ro.childNodes[2];
	cell1.innerHTML = cell1.childNodes[0].value;
	cell2.innerHTML = cell2.childNodes[0].value;
	cell3.removeChild(cell3.childNodes[0]);
	var anc1 = document.createElement("a");
	anc1.setAttribute("href", "#");
	anc1.innerHTML = "Edit";
	anc1.addEventListener('click', editin, false);
	var anc2 = document.createElement("a");
	anc2.setAttribute("href", "#");
	anc2.innerHTML = "Delete";	
	anc2.addEventListener('click', deletin, false);
	var txt = document.createTextNode(" / ");
	var div = document.createElement("div");
	div.appendChild(anc1);
	div.appendChild(txt);
	div.appendChild(anc2);
	cell3.appendChild(div);	
}

function appen(cell1,cell2,cell3) {
	var inp1 = document.createElement("input");
	inp1.setAttribute("type", "text");
	if(cell1.innerHTML) {
		inp1.value = cell1.innerHTML;
		cell1.innerHTML = "";
	}
	var inp2 = document.createElement("input");
	inp2.setAttribute("type", "text");
	if(cell2.innerHTML) {
		inp2.value = cell2.innerHTML;
		cell2.innerHTML = "";
	}
	var save = document.createElement("input");
	save.setAttribute("type" ,"button");
	save.addEventListener('click', saving, false);
	save.value = "Save";
	if(cell3.firstChild) {
		cell3.removeChild(cell3.childNodes[0]);
	}
	cell1.appendChild(inp1);
	cell2.appendChild(inp2);
	cell3.appendChild(save);
}
function addRow() {
	var table = document.getElementById("myTable");
	var row = table.insertRow(-1);
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	appen(cell1,cell2,cell3);
}
function editin() {
	var di = this.parentNode;
	var col = di.parentNode;
	var ro = col.parentNode;
	var cell1 = ro.childNodes[0];
	var cell2 = ro.childNodes[1];
	var cell3 = ro.childNodes[2];
	appen(cell1,cell2,cell3);
}
function deletin() {
	var di = this.parentNode;
	var col = di.parentNode;
	var ro = col.parentNode;
	var tab = ro.parentNode;
	tab.removeChild(ro);
}

