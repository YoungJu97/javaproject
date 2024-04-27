<%@page import="org.springframework.beans.factory.parsing.ReaderContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <style>
:root {
  --white: #e9e9e9;
  --gray: #333;
  --blue: #0367a6;
  --lightblue: #008997;
  --button-radius: 0.7rem;
  --max-width: 758px;
  --max-height: 420px;

  font-size: 16px;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
    Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
}

body {
  align-items: center;
  background-color: var(--white);
  background: url("<%=request.getContextPath()%>/resources/img/EPL_Predictions.jpg");
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  display: grid;
  height: 100vh;
  place-items: center;
}

.form__title {
  font-weight: 300;
  margin: 0;
  margin-bottom: 0.9rem;
  margin-top: 0.9rem;
}

.link {
  color: var(--gray);
  font-size: 0.9rem;
  margin: 1.5rem 0;
  text-decoration: none;
}

.container {
  background-color: var(--white);
  border-radius: var(--button-radius);
  box-shadow: 0 0.9rem 1.7rem rgba(0, 0, 0, 0.25),
    0 0.7rem 0.7rem rgba(0, 0, 0, 0.22);
  height: var(--max-height);
  max-width: var(--max-width);
  overflow: hidden;
  position: relative;
  width: 100%;
}

.container__form {
  height: 100%;
  position: absolute;
  top: 0;
  transition: all 0.6s ease-in-out;
}

.container--signin {
  left: 0;
  width: 50%;
  z-index: 2;
}

.container.right-panel-active .container--signin {
  transform: translateX(100%);
}

.container--signup {
  left: 0;
  opacity: 0;
  width: 50%;
  z-index: 1;
}

.container.right-panel-active .container--signup {
  animation: show 0.6s;
  opacity: 1;
  transform: translateX(100%);
  z-index: 5;
}

.container__overlay {
  height: 100%;
  left: 50%;
  overflow: hidden;
  position: absolute;
  top: 0;
  transition: transform 0.6s ease-in-out;
  width: 50%;
  z-index: 100;
}

.container.right-panel-active .container__overlay {
  transform: translateX(-100%);
}

.overlay {
  background-color: var(--lightblue);
  background: url("<%=request.getContextPath()%>/resources/img/EPL_Predictions.jpg");
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  height: 100%;
  left: -100%;
  position: relative;
  transform: translateX(0);
  transition: transform 0.6s ease-in-out;
  width: 200%;
}

.container.right-panel-active .overlay {
  transform: translateX(50%);
}

.overlay__panel {
  align-items: center;
  display: flex;
  flex-direction: column;
  height: 100%;
  justify-content: center;
  position: absolute;
  text-align: center;
  top: 0;
  transform: translateX(0);
  transition: transform 0.6s ease-in-out;
  width: 50%;
}

.overlay--left {
  transform: translateX(-20%);
}

.container.right-panel-active .overlay--left {
  transform: translateX(0);
}

.overlay--right {
  right: 0;
  transform: translateX(0);
}

.container.right-panel-active .overlay--right {
  transform: translateX(20%);
}

.btn {
  background-color: var(--blue);
  background-image: linear-gradient(90deg, var(--blue) 0%, var(--lightblue) 74%);
  border-radius: 20px;
  border: 1px solid var(--blue);
  color: var(--white);
  cursor: pointer;
  font-size: 0.8rem;
  font-weight: bold;
  letter-spacing: 0.1rem;
  padding: 0.9rem 4rem;
  text-transform: uppercase;
  transition: transform 80ms ease-in;
}

.form > .btn {
  margin-top: 0.2rem;
}

.btn:active {
  transform: scale(0.95);
}

.btn:focus {
  outline: none;
}

.form {
  background-color: var(--white);
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 3rem;
  height: 100%;
  text-align: center;
}


.input {
  background-color: #fff;
  border: none;
  padding: 0.9rem 0.9rem;
  margin: 0.5rem 0;
  width: 90%;
}

@keyframes show {
  0%,
  49.99% {
    opacity: 0;
    z-index: 1;
  }

  50%,
  100% {
    opacity: 1;
    z-index: 5;
  }
}
.input-box{
background-color: #fff;
  border: none;
  padding: 0.9rem;
  margin: 0.5rem 0;
  width: 56%;
}
.input-box1{
background-color: #fff;
  border: none;
  padding: 0.9rem;
  margin: 0.5rem 0;
  width: 35%;
}
.btn-chk{
background-color: var(--blue);
  background-image: linear-gradient(90deg, var(--blue) 0%, var(--lightblue) 74%);
  border: 1px solid var(--blue);
  color: var(--white);
  cursor: pointer;
  font-size: 0.8rem;
  font-weight: bold;
  letter-spacing: 0.1rem;
  padding-top: 0.9rem;
  padding-bottom: 0.9rem;
  text-transform: uppercase;
  transition: transform 80ms ease-in;
}
.disabled {
    background-color: gray; 
    color: white; 
    cursor: not-allowed; 
}
.margin-b{
  margin-bottom: 1rem;
}
.margin-t{
margin-top: 1rem;
}

  </style>
</head>
<body>
  <div class="container right-panel-active">
   <!-- Sign In -->
    <div class="container__form container--signin">
      <form action="clear" class="form" id="form2" method="post">
        <h2 class="form__title">Sign In</h2>
        <input type="text" placeholder="Id" class="input" name="user_id" id="loginid"/>
        <input type="password" placeholder="Password" class="input" name="user_pass" id="loginpass" />
        <div>
        <input type="submit" class="btn-chk" value="Sign In" id="login">
        <a href="<%=request.getContextPath()%>/"><button type="button" class="btn-chk">Home page</button></a>
        </div>
        
      </form>
    </div>
    <!-- Sign Up -->
    <div class="container__form container--signup">
      <form action="join" method="post" class="form" id="form1" >
        <h2 class="form__title">Sign Up</h2>
        <div>
        <input type="text" placeholder="Name" class="input" name="username" id="user"/>
        <div>
        <input type="text" placeholder="Social Security" class="input-box1" id="one"/><span> ㅡ </span>
        <input type="text" placeholder="Number" class="input-box1" id="two"/>
        <input type="hidden" value="" name=s_number id="snum">
        </div>
        <input type="text" placeholder="Id" class="input-box" name="user_id" id="userid"/>
        <button type="button" class="btn-chk" id="idchk">ID Check</button>
        </div>
        <input type="password" placeholder="Password" class="input" id="pass" name="user_pass"/>
        <div>
        <input type="password" placeholder="Password check" class="input" id="pass-chk" />
        <span id="message" style="color: red;">비밀번호를 확인해주세요</span>
        </div>
        <input type="submit" class="btn margin-b" value="Sign Up" id="join">
      </form>
    </div>
  
   
  
    <!-- Overlay -->
    <div class="container__overlay">
      <div class="overlay">
        <div class="overlay__panel overlay--left">
          <button class="btn" id="signIn">Sign In</button>
        </div>
        <div class="overlay__panel overlay--right">
          <button class="btn" id="signUp">Sign Up</button>
        </div>
      </div>
    </div>
  </div>
  <script>
  const login = document.getElementById("login");
  const loginid = document.getElementById("loginid");
  const loginpass = document.getElementById("loginpass");
const signInBtn = document.getElementById("signIn");
const signUpBtn = document.getElementById("signUp");
const fistForm = document.getElementById("form1");
const secondForm = document.getElementById("form2");
const container = document.querySelector(".container");
const password= document.getElementById('pass');
const passwordchk = document.getElementById('pass-chk');
const Message = document.getElementById('message');
const onechk= document.getElementById('one');
const twochk= document.getElementById('two');
const user= document.getElementById('user');
const userid= document.getElementById('userid');
const join= document.getElementById('join');
const idchk = document.getElementById('idchk');

join.addEventListener("click",joinchk);
idchk.addEventListener("click",idnull);
join.addEventListener("click",idclick);
login.addEventListener("click",loginchk);
signInBtn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});

signUpBtn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});
function loginchk(){
	secondForm.addEventListener("submit", (e) => e.preventDefault());
	if(loginid.value==""){
		alert("아이디를 입력해주세요");
	
	}
	else if(loginpass.value==""){
			alert("비밀번호를 입력해주세요");
			
	}
	else if(loginid.value!==""&&loginpass.value!==""){
		$.ajax({
	         type: 'POST',
	         url: 'loginchk',
	         data: JSON.stringify({
	             user_id: loginid.value,
	             user_pass: loginpass.value
	         }),
	         dataType: 'json',
	         contentType : "application/json; charset=UTF-8",
	         success: function(result){
	        	 console.log(result)
	             if(result == 0){
	             	alert("로그인 되었습니다");
	             	document.getElementById("form2").submit();
	             }
	             if(result == 1){
	             	alert("아이디를 다시 확인해주세요");
	     	
	             }
	             if(result == 2){
	              	alert("비밀번호를를 다시 확인해주세요");
	              
	              }
	         },
	         error: function(jqXHR, textStatus, errorThrown){
	             console.error("AJAX 오류 발생:", textStatus, errorThrown);
	         }
	     });

	}
}
function idnull(){
	if(userid.value==""){
		alert("아이디를 입력해주세요");
		fistForm.addEventListener("submit", (e) => e.preventDefault());
	}else{
		 $.ajax({
	            type: 'GET',
	            url: 'idchk',
	            data: {
	                user_id: userid.value
	            },
	            success: function(result){
	                if(result == 0){
	                	alert("사용가능한 아이디 입니다");
	                	$('#idchk').prop('disabled', true);
	                	$('#idchk').addClass('disabled');
	                }
	                if(result == 1){
	                	alert("중복된 아이디 입니다");
	                }
	            },
	            error: function(jqXHR, textStatus, errorThrown){
	                console.error("AJAX 오류 발생:", textStatus, errorThrown);
	            }
	        });

	}
}
function joinchk(){
	if(user.value==""){
		alert("이름을 입력해주세요");
		fistForm.addEventListener("submit", (e) => e.preventDefault());
	}
	else if(onechk.value==""){
		alert("주민등록번호를 입력해주세요");
		fistForm.addEventListener("submit", (e) => e.preventDefault());
	}
	else if(twochk.value==""){
		alert("주민등록번호를 입력해주세요");
		fistForm.addEventListener("submit", (e) => e.preventDefault());
	}
	else if(userid.value==""){
		alert("아이디를 입력해주세요");
		fistForm.addEventListener("submit", (e) => e.preventDefault());
	}
	else if(password.value==""){
		alert("비밀번호를 입력해주세요");
		fistForm.addEventListener("submit", (e) => e.preventDefault());
	}
	else if(passwordchk.value==""){
		alert("비밀번호를 입력해주세요");
		fistForm.addEventListener("submit", (e) => e.preventDefault());
	}
	else if(password.value!= passwordchk.value) {
	    alert("비밀번호를 다시 확인해주세요");
	    fistForm.addEventListener("submit", (e) => e.preventDefault());
	}else{
		alert("회원가입 되었습니다");
		fistForm.submit();		
	}
}
function idclick(){
	 if (!idchk.disabled) {
         alert("아이디 중복 확인을 해주세요.");
         fistForm.addEventListener("submit", (e) => e.preventDefault());
     }
}


function passchk() {
    if (password.value != passwordchk.value || passwordchk.value!= password.value ) {
        passwordchk.classList.add('input-error');
        Message.textContent = "비밀번호를 확인해주세요";
        
    } else {
        passwordchk.classList.remove('input-error');
        Message.textContent = "비밀번호 확인완료";
       
    }
}

passwordchk.addEventListener('input', passchk);



function snumber() {
	  const one = document.getElementById('one').value;
	  const two = document.getElementById('two').value;
	  const snum = document.getElementById('snum');
	  const snumvalue = one + "-" + two;
	  snum.value = snumvalue;
	}
	onechk.addEventListener('input', snumber);
	twochk.addEventListener('input', snumber);
  </script>
</body>
</html>