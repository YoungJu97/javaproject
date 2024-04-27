<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY INFO</title>
<style>
.background {
	background-color: black;
	width: 100%;
	height: 22rem;
	margin-bottom: 1rem;
	display: flex;
	justify-content: center;
	align-items: center;
}

.context {
	color: white;
}
artice{
width: 100%;
align-content: center;
display: flex;
justify-content: center;
align-items: center;
}
.table th{
text-align: center;
width:40%;
height:4rem;
vertical-align: middle;
border-left:solid 1px rgb(221, 220, 220);

}
.table td{
vertical-align: middle;
border-right:solid 1px rgb(221, 220, 220);
}

.section{
width: 40rem;

margin: 0 auto;
}
#first{
display: block;
}
#second{
display: none;
}
</style>
</head>
<body>
	<%@ include file="./include/top.jsp"%>
	<main>
		<div class="background">
			<div>
				<h1 class="display-1 fw-bolder context">MY INFO</h1>
			</div>
		</div>
		<article>
		<h1 class="display-5 fw-bolder d-flex">MY INFO(내정보)</h1>
			<section id="first" class="section">
				<table class="table">
					<tr>
						<th style="border-top:solid 1px rgb(221, 220, 220);  background-color: black; color: white;">이름</th>
						<td style="border-top:solid 1px rgb(221, 220, 220); ">${myinfo.username }</td>		
					</tr>
					<tr>
						<th style="background-color: black; color: white;">주민번호</th>
						<td>${myinfo.s_number }</td>		
					</tr>
					<tr>
						<th style="background-color: black;color: white;">아이디</th>
						<td>${myinfo.user_id }</td>		
					</tr>
					<tr>
						<th style="background-color: black; color: white;">비밀번호</th>
						<td id="pass" >${myinfo.user_pass}</td>
						
					</tr>
				</table>
						<button id="passchangebtn"class="btn btn-outline-dark" ">비밀번호 변경</button>
			</section>
			<section id="second" class="section">
			<form action="passchang" method="post">
				<table class="table">
					<tr>
						<th style="border-top:solid 1px rgb(221, 220, 220);  background-color: black; color: white;">이름</th>
						<td style="border-top:solid 1px rgb(221, 220, 220); ">${myinfo.username }</td>		
					</tr>
					<tr>
						<th style="background-color: black; color: white;">주민번호</th>
						<td>${myinfo.s_number }</td>		
					</tr>
					<tr>
						<th style="background-color: black;color: white;">아이디</th>
						<td>${myinfo.user_id }</td>
						<input type="hidden" value="${myinfo.user_id }" name="user_id" >
					</tr>
					<tr>
						<th style="background-color: black; color: white;">비밀번호</th>
						<td id="pass" >
							<input type="password" value="${myinfo.user_pass }" name="user_pass" >
						<button class="btn btn-outline-dark" style="margin-left: 1rem; ">변경</button>
					</td>
						
					</tr>
				</table>
			</form>
			</section>
			
		</article>
	</main>
	<%@ include file="./include/footer.jsp"%>
	<script>
	const firstform=document.getElementById("first");
	const secondform=document.getElementById("second");
	const changebtn=document.getElementById("passchangebtn");
	changebtn.addEventListener("click",function(){
		firstform.style.display="none";
		secondform.style.display="block";
	})
	</script>
</body>
</html>