<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Rubik+Doodle+Shadow&display=swap"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Rubik+Doodle+Shadow&display=swap"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0a650293b70c7d740e19d09739341388"></script>

<style>

body {
    width: 100%;
    height: 100%;
  }

  h1 {
    
    font-family: "Rubik Doodle Shadow", serif;
    color: rgb(0, 0, 0);
    font-size: 60px;
   text-decoration: none;
   border-bottom: none;
  }
  #menu{
    margin-left: 4.5%;
    width: 90%;

    
  }
  nav{
    margin-top: 1%;
    width: 89.5%;
   margin-left: 5%;
    font-weight:bolder ;
    font-size: large;
    border-bottom:solid 2px rgb(165, 163, 163);
    
   
  }

 

  #title{
    margin-top: 1%;
    margin-left: 11%;
    display: inline-block;
    background-image: url("https://www.urbanbrush.net/web/wp-content/uploads/edd/2019/09/urbanbrush-20190903035333274348.png");

  	}
	#title h1 a {
    color: inherit; /* Use the default text color */
    text-decoration: none; /* Remove underline */
	}

	#title h1 a:hover {
    border-bottom: none; /* Remove the underline on hover */
	}
  .navbar-brand{
    margin-left: 8.5%;
  }
  .navbar-brand:hover{
    border-bottom: solid 3px;
  }
  #span{
  	text-align:center;
  	 margin-left: 45%;
    width: 17%; 
    display: inline-block;

  }
  #span1{
  	text-align:center;
  	 margin-top: 1%;
  	 margin-left: 42%;
    width: 25%; 
    display: inline-block;
   

  }
.login_input{
		width:100%;
		height:50px;
  }
  .login_font{
  	font-size: 20px;
  }
footer{
  margin-top: 80px;
  background-color: rgb(243, 243, 243);
  text-align: center; 
  border: solid 1px  rgb(243, 243, 243);
}
</style>
</head>
<body>
	<div id="title">
	     <h1>
         <a href="<%=request.getContextPath()%>/">Travel</a>
      </h1>
	</div>
	
	<c:if test="${user_id==null }">
	<div id="span">
	<button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal1">
  		로그인
		</button>
		<a href="join"><button type="button" class="btn btn-dark">회원가입</button></a>
	</div>
	</c:if>
	<c:if test="${user_id!=null }">
	<div id="span1">
		<h1 style="font-size: 25px" id="user_id">User_id : ${user_id}</h1>
		<a href="logout"><button type="button" class="btn btn-dark">로그아웃</button></a>
		<a href="myinfo?user_id=${user_id}">
		<button type="button" id="myinfo" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal2">내정보</button>
		</a>
		<a href="reschk?res_id=${user_id}">
		<button type="button" class="btn btn-dark">예약확인</button>
		</a>
	</div>
	</c:if>
	<form action="login" method="post">
	<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Login</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div id="body">
      <div class="modal-body">
      <p class="login_font">User_ID</p>
      <input type="text" name=user_id class="login_input" id="userid">
      </div>
      <div class="modal-body">
      <p class="login_font">User_PassWord</p>
      <input type="password" name=user_pass class="login_input" id="password">
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" >Login</button>
      </div>
    </div>
  </div>
</div>
</form>
	<nav>
		<div> 
				<a class="navbar-brand" href="${pageContext.request.contextPath}/trip?numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=APP_TEST&_type=json&listYN=Y&arrange=A&mapX=126.981611&mapY=37.568477&radius=1000&contentTypeId=15">행사 검색</a>
				<a class="navbar-brand" href="accdation">숙박시설</a> <a
				class="navbar-brand" href="destination">여행지</a> <a
				class="navbar-brand" href="tripview">여행지게시판</a> <a
				class="navbar-brand" href="acb">숙소게시판</a> <a
				class="navbar-brand" href="gallery">갤러리</a>
		</div>
	</nav>
</body>
<script>
<c:if test="${not empty loginError}">
	$(document).ready(function() {
    	$('#exampleModal1').modal('show');
    	alert('아이디 비밀번호를 다시 확인해 주세요');
});
</c:if>
</script>
</html>