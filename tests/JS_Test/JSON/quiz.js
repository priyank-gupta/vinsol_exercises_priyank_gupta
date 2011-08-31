
var txt = '{"Questions":["Which HTML tag do we use to attach Javascript to a web page ?", "What is the correct JavaScript syntax to write Hello World ?", "How do you create a function?", "Which HTML tag do we use to attach input elements to a web page ?","Which HTML tag do we use to attach images to a web page ?","Which HTML tag do we use to attach headings to a web page ?"],	"Options":[{"option1":"program","option2":"javascript","option3":"script","option4":"js"},{"option1":"document.write(Hello World)","option2":"Hello World","option3":"response.write(Hello World)","option4":"(Hello World)"},{"option1":"function=myFunction()","option2":"function:myFunction()","option3":"function myFunction()","option4":"func()"}, {"option1":"javascript","option2":"java","option3":"input","option4":"script"},{"option1":"javascript","option2":"img","option3":"input","option4":"script"},{"option1":"javascript","option2":"java","option3":"input","option4":"h1"}	], 	"Answers":["script", "document.write(Hello World)","function myFunction()","input","img","h1"]}';

var doc = eval('(' + txt + ')');
var question = document.getElementById('ques');
var op0 = document.getElementById('0');
var op1 = document.getElementById('1');
var op2 = document.getElementById('2');
var op3 = document.getElementById('3');

var i,d=0;
var arr = new Array();
do {
	i = Math.floor(Math.random()*9);
	if(i < 6) {
		arr[0] = i;
	}
} while(!arr[0]);

question.innerHTML = doc.Questions[i];         
op0.innerHTML = doc.Options[i].option1; 
op1.innerHTML = doc.Options[i].option2; 
op2.innerHTML = doc.Options[i].option3; 
op3.innerHTML = doc.Options[i].option4; 

function clickin() { 
	
	var c=0,st="",u=0;
	var ch = document.getElementsByName("opt");
	for(var j=0; j<4;j++) {
		if(ch[j].checked == true) {
			c++;
			st = document.getElementById(j).innerHTML;
			u=j;
			break;
		}
	}
	if(!st) {
		alert("Please mark an answer");
		return false;
	}
	if(st != doc.Answers[i]) {
		d++;
		alert("correct answer is: " + doc.Answers[i]);
	}
		
	do {
		var l=true,m=true;
		i = Math.floor(Math.random()*9);
		if(i < 6) {
			for(var k = 0; k < arr.length; k++) {
				if(arr[k] == i) {
					m=false;
					break;
				}
			}
			if(m) {
				l=false;
				arr[arr.length] = i;
			}
		}
	}while(l);
	
	if(arr.length >= 4) {
		var bu1 = document.getElementById("button1");
		var bu2 = document.getElementById("button2");		
		bu1.style.display = "none";
		bu2.style.display = "inline";
		d = arr.length - d - 1;
		var f = arr.length - 1;
		bu2.onclick = function() {
			alert("Correct answers are " + d + " out of " + f);
			document.getElementById("main").style.display = "none";
			document.write("<h2>Thank You<h2>");
		}
		return false;
	} 
	ch[u].checked = false;
	question.innerHTML = doc.Questions[i];         
	op0.innerHTML = doc.Options[i].option1; 
	op1.innerHTML = doc.Options[i].option2; 
	op2.innerHTML = doc.Options[i].option3; 
	op3.innerHTML = doc.Options[i].option4; 
}
var bu = document.getElementById('button1');
bu.addEventListener('click', clickin, false);
