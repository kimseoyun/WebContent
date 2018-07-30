<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자리 배치</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{
font-family: 'Jeju Gothic', sans-serif;
background-color:#f5f1e8;
}
.page {
  width: 100px;
  height: 100px;
  justify-content: center;
}


/* add default color for animation start  */


/* toggle this class */

.color-bg-start {
  background-color: salmon;
}


/* toggle class bg-animate-color */

.bg-animate-color {
  animation: random-bg .5s linear infinite;
}


/* add animation to bg color  */

@keyframes random-bg {
  from {
    filter: hue-rotate(0);
  }
  to {
    filter: hue-rotate(360deg);
  }
}

.fun-btn {
  /* change bg color to get different hues    */
  background-color: #ecaa92;
  color: white;
  padding: 20px;
  border: none;
  transition: all .3s ease;
  border-radius: 15px;
  letter-spacing: 2px;
  text-transform: uppercase;
  outline: none;
  align-self: center;
  cursor: pointer;
  font-weight: bold;
}

.fun-btn:hover {
  animation: random-bg .5s linear infinite, grow 1300ms ease infinite;
}

.start-fun {
  background-color: #fff !important;
  /* change color of button text when fun is started   */
  color: salmon !important;
}

/* pulsating effect on button */
@keyframes grow {
  0% {
    transform: scale(1);
  }
  14% {
    transform: scale(1.3);
  }
  28% {
    transform: scale(1);
  }
  42% {
    transform: scale(1.3);
  }
  70% {
    transform: scale(1);
  }
}
</style>
<script>
$('.fun-btn').on('click', function(event) {
	  $(this).toggleClass('start-fun');
	  var $page = $('.page');
	  $page.toggleClass('color-bg-start')
	    .toggleClass('bg-animate-color');

	  //change text when when button is clicked

	  $(this).hasClass('start-fun') ?
	    $(this).text('stop the fun') :
	    $(this).text('start the fun');

	});
</script>
</head>
<body>

<center>
<br><br><br><br>
<a href="placement.jsp">
<img src="logo.png"></a>

<br>
<form name="seatFrm" method="post" action="pickGet.jsp">
<br>


<label>인원 수 입력 </label> : 
<input type="number" name="student" max="40" min="20">
<br><br><br>

<label>분단 수 선택</label><br><br>
<input type="radio" name="section" value="2">2
<input type="radio" name="section" value="3">3
<input type="radio" name="section" value="4">4
<br><br><br>

<label>결원 학생의 번호 입력 : </label>
<input type="text" name="addText" style="width:150px; height:20px;"><br><br><br>
<div class="page">
 <input type="submit" value="자리배치" class="fun-btn">
 </div>
 </center>
</form>

</center>
</body>
</html>