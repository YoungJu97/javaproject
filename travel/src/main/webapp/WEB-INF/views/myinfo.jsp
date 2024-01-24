<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내정보</title>
  <style>
  article{
  	width:90%;
	margin-left: 2.5%;
	margin-top:2%;
  }
  section{
  	width:100%;
  	
  	text-align: center;
	
  }
  .tabletr{
  	margin-top :5%;
  }
  table td{
  padding-top:1.3%;
 	padding-bottom:5%;
 	
  }
  table th{
  padding-top:1.8%;
 	padding-left: 7%;
 	padding-bottom:5%;
 	
  }
  th p {
  font-size: 20px;
  }
    #jointable{
    	width:90%;
    	margin-top :2%;
    }
    .join{
     width:100%;
     height:50px;
     border-radius: 13px;
    
    }
    .joinbtn{
     height: 50px;
     background-color: black;
     color:white;
     border-radius: 10px;
     
    }
    .joinbtn:hover{
    background-color: white;
     color:black;
    }
  </style>
</head>
<body>
<%@ include file="./include/top.jsp" %>
 <article>
 	<section>
 	<div>
 		<h2>내 정보</h2>
 	</div>
 	<form action="memberinfo" method="post">
 		<div id="joindiv">
 		<table id="jointable">
 			<tr>
 			<th><p>이름</p></th>
 			<td><input type="text" class="join" name="user_name" value="${myinfo.user_name }" disabled>
 			</td>
 			</tr >
 			<tr>
 			<th><p>아이디</p></th>
 			<td><input type="text" id="newid"class="join"  value="${myinfo.user_id }" disabled >
 			<input type="hidden" name="user_id" value="${myinfo.user_id }">
 			</tr>
 			<tr>
 			<th><p>비밀번호</p></th>
 			<td><input type="password" class="join" id="pass_word" name="user_pass"  value="${myinfo.user_pass }" disabled></td>
 			</tr>
 			<tr>
 			<th><p>휴대폰번호</p></th>
 			<td><input type="tel" class="join" id="phone" name="user_phone_num" value="${myinfo.user_phone_num }" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" disabled ></td>
 			</tr>
 			<tr class=tabletr>
 			<th><p>이메일</p></th>
 			<td><input type="email" class="join" id="email" name="user_email" value="${myinfo.user_email }" disabled></td>
 			</tr>
 		</table>
 		<div id="infodiv">
 			<input type="button" value="정보 변경" class="joinbtn" style="width:20%;">
 			</div>
 		</div>
 		</form>
 	</section>
 </article>
</body>
<script>
$(document).ready(function(){
	$('.joinbtn').click(function(){
	$.ajax({
		async : true,    
		type:'GET',
		data :{ 	}	,
	
		url : 'passchange',
		
		success : function(data){
			if(data==0){
				$('#infodiv').empty();
				$('#pass_word').attr("disabled",false)
				$('#phone').attr("disabled",false)
				$('#email').attr("disabled",false)
				$('#infodiv').append(
					'<input type="submit" value="저장" class="joinbtn" style="width:20%;">'
				)
			}
		},
	});
});
})
</script>
</html>
