<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
#abwrForm {
	display: inline-block;
	margin-top: 20px;
	margin-left: 100px;
	width: 80vw;
	
}

#aboard-head {
	border: 1px solid green;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 10px;
	height: 8vh;
}

#aboard-mid {
	display: flex;
	flex-direction: column;
	border: 1px solid green;
	height: 500px;
}

#aboard-title {
	display: flex;
	border: solid yellow 1px;
	height: 40px;
	margin-top: 20px;
}

#aboard-writer {
	display: flex;
	border: solid yellow 1px;
	height: 40px;
}



#aboard-bottom {
	display: flex;
	/* margin: 1vw; */
	align-items: center;
	justify-content: center;
	height: 80px;
	
}

.bottom-btn {
	border-radius: 15px;
	margin-left: 100px;
	margin-right: 100px;
	width: 80px;
	height: 50px;
}

#aboard-title {
	display: flex;
	flex-direction: row;
}

#aboard-contentarea {
	display: flex;
	flex-direction: column;
	overflow:auto;
}
#aboard-content {
	display: flex;
	border: solid green 1px;
	/* height: 360px; */
	width: 98%;
	margin-left: 10px;
	margin-right: 10px;
	overflow:auto;
}
.mid-span-l {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 60px;
	margin-left: 10px;
	border: 1px solid blue;
}

#title-span-r {
	width: 950px;
	margin-left: 10px;
	margin-right: 10px;
	border: 1px solid red;
}

.mid-span-r {
	width: 400px;
	margin-left: 10px;
	margin-right: 10px;
	border: 1px solid purple;
}

#cont-image {
	display: flex;
	flex-direction: row;
}

.downImage {
	display: flex;
	width: 300px;
	height: 300px;
	margin: 10px;
}
#div-tarea{
display:flex;
margin-left:110px;
width:1000px;
height:200px;
border:1px solid black;
}
#tarea{
width:700px;
}
#div-answer-left{

}
#span-answer-left{

}
#answerSpace{
display:flex;
flex-direction:column;
margin-left:110px;
width:1000px;
height:auto;
border:1px solid black;
}
</style>

<body>
<%@ include file="./include/top.jsp" %>
	<form id="abwrForm" action="abwr" method="POST">
		<div id="aboard-head">숙소 게시판</div>
		<div id="aboard-mid">
			<div id="aboard-title">
				<span class="mid-span-l">제목</span> <span id="title-span-r"name="accTitle">${fvo.accTitle }</span>
			</div>
			<div id="aboard-writer">
				<span class="mid-span-l">작성자</span> <span class="mid-span-r"
					name="accWriter">${fvo.accWriter }</span> <span class="mid-span-l">날짜</span>
				<span class="mid-span-r" name="accDate">${fvo.accDate }</span>
			</div>
			<div id="aboard-contentarea">
				<%-- <img class="downImage" src="download?filename=${accvo.files[0]}" --%>
				<div id="cont-image">
					<c:forEach items="${fvo.files }" var="image">
						<a href="download?filename=${image}"> <img class="downImage" src="download?filename=${image }"
							alt='1.png'></a>
					</c:forEach>
				</div>
				<span id="aboard-content" name="accContents">
				${fvo.accContents }
				</span>
			</div>
		</div>

		
	</form>
	<div id=answerSpace>
	<c:forEach items="${answerlist}" var="aone">
		<span class="lAnswer-span">
			${aone.answerWriter}
		</span>
		<span class="rAnswer-span">
			${aone.answerContents}
		</span> 
	</c:forEach>
	</div>
 <!-- 비동기처리할떄는 폼태그 필요없나 -->
	<div id=answer>
	<div id="div-tarea">
	<div id="div-answer-left">
		<span id="span-answer-left">${user_id }</span>
	</div>
	<textarea id="tarea"></textarea>
	<button id="write-answer">
	작성
	</button>
	</div>
	
	</div>
	
	

	<div id="aboard-bottom">
			<a href="accMod?mno=${fvo.accNum }">
				<button class="bottom-btn">수정</button>
			</a> 
			<a href="accDel?dno=${fvo.accNum }">
				<button class="bottom-btn">삭제</button>
			</a>
		</div>
</body>

<script>
/* function a(){
	let addspan1 = document.createElement('span')
	let addspan2 = document.createElement('span')
	addspan1.className='lAnswer-span';
	addspan1.innerText = document.getElementById('span-answer-left').textContent; 
	addspan2.className='rAnswer-span';
	addspan2.innerText = addspan1.value = document.getElementById('tarea').value;
	let addlbtn = document.createElement('button')
	let addrbtn = document.createElement('button') 
	let as = document.querySelector('#answerSpace'); 
	as.appendChild(addspan1);
	as.appendChild(addspan2);
} */
$(document).ready(function(){
	$('#write-answer').click(function(){ 
		var uid = document.getElementById('span-answer-left').textContent;//$(".span-answer-left").text(); 
		var ucontents = document.getElementById('tarea').value; // $("#tarea").val();
		var unum = "${fvo.accNum }"
		$.ajax({
			async : true,
			type : 'POST',
			data :{
				"accNum" : unum,
				"answerWriter" : uid,
				"answerContents" : ucontents
			}, 
				/* JSON.stringify({
				RanswerNum : unum,
				RanswerWriter : uid,
				RanswerContents : ucontents
			}), */
			url : 'addAnswer',
			dataType : 'text',//'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",//"application/json; charset=UTF8", 
			success : function(data){
				// 여기다가 디브 댓글 디브 추가해주는 코드 작성할거임.
				let addspan1 = document.createElement('span')
				let addspan2 = document.createElement('span')
				addspan1.className='lAnswer-span';
				addspan1.innerText = document.getElementById('span-answer-left').textContent; 
				addspan2.className='rAnswer-span';
				addspan2.innerText = document.getElementById('tarea').value;
				/* let addlbtn = document.createElement('button')
				let addrbtn = document.createElement('button') */
				let as = document.querySelector('#answerSpace'); 
				as.appendChild(addspan1);
				as.appendChild(addspan2);
				
			},
			error : function(error){
				alert("error11")
			}
		})
	})
})



</script>
</html>
</html>