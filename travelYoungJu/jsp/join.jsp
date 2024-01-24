<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
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
 	<form action="memberjoin" method="post">
 	<div>
 		<h2>회 원 가 입</h2>
 	</div>
 		<div id="joindiv">
 		<table id="jointable">
 			<tr>
 			<th><p>이름</p></th>
 			<td><input type="text" class="join" name="user_name" required>
 			</td>
 			</tr >
 			<tr>
 			<th><p>아이디</p></th>
 			<td><input type="text" id="newid"class="join" style="width: 88%;" name="user_id" required >
 			<button type="button" class="joinbtn" id="jbtn">중복확인</button></td>
 			</tr>
 			<tr>
 			<th><p>비밀번호</p></th>
 			<td><input type="password" class="join" name="user_pass" required></td>
 			</tr>
 			<tr>
 			<th><p>휴대폰번호</p></th>
 			<td><input type="tel" class="join" name="user_phone_num" placeholder="예: 010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required ></td>
 			</tr>
 			<tr class=tabletr>
 			<th><p>이메일</p></th>
 			<td><input type="email" class="join" name="user_email" placeholder="example@gmail.com" required></td>
 			</tr>
 		</table>	
 		</div>
 			<input type="submit" value="회원가입" class="joinbtn" style="width:20%;">
 		</form>
 	</section>
 </article>
</body>
<script>
$(document).ready(function(){
	$('#jbtn').click(function(){
	var newid=$('#newid').val();
	console.log(newid)
	$.ajax({
		async : true,    
		type:'POST',
		data :    
			{ 
			 user_id : newid
			},				
		url : 'logchk',
		success : function(data){
			console.log(data)
			if(data==0){
				alert("중복된 아이디가 존재합니다.")
			}else{
				alert("사용 가능한 아이디 입니다.")
			}
		},
		error : function(error){
			alert("error11")
		}
	});
});

});
</script>
</html>
