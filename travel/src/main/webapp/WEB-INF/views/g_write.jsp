<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rubik+Doodle+Shadow&display=swap" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        body{
            width: 100%;
        }
        header{
            text-align: center;
            margin-top: 20px;
            margin-bottom: 30px;
        }
        h1 {
        font-family: "Rubik Doodle Shadow", serif;
        color: rgb(0, 0, 0);
        font-size: 60px;
      }
        .form{
            position: relative;
            width: 75%;
            border: solid 1px;
           
            margin-left: 10%;
        }
        .writename{   
            display: inline-block;
            
        }
        .writep{
            background-color: rgb(233, 233, 233);
            margin-left: 90px;
            margin-top: 20px;
            text-align: center;
            width: 70px;
            height: 28px;
            display: inline-block;
            border: solid 1px;
            
        }
        .titletext{
           
            border: solid 1px;
            width: 74%;
        }
        .username{
            border: solid 1px; 
        }
        .maintext{
            width: 82%;
            margin-top: 20px;
            margin-left: 89px;
        }
        #text{
            width: 100%;
        }
        #file{
            
            margin-top: 20px;
            margin-left: 85px;
        }
        #save{
            background-color: rgb(255, 255, 255);
            color: rgb(0, 0, 0);
            width: 10%;
            height: 40px;
        }
        .files{
          
            margin-top: 10px;
            border:  solid 1px;
            border-radius: 8px;
            width: 800px;
        }
        .savebtn{
            margin-top: 20px;
            margin-bottom: 10px;
            text-align: center;
        }
        #save:hover{
            background-color: rgb(165, 165, 165);
        }
    </style>
</head>
<body>
    <header>
        <div >
            <h1>Travel</h1>
        </div>
    </header>
   <article>
   <form action="galleryview" method="post" encType="multipart/form-data" >
    <section class="form">
       <div class="write">
        <span class="writep">제목</span>
        <input type="text" name="gallery_title" class="titletext" placeholder="제목을 입력해주세요">
       </div>
       <div class="writename">
        <span class="writep">아이디</span>
        <input type="text" name="userid" class="userid" style="width: 200px;" value="${user_id }">
       </div>
       <div class="writename">
        <select name="gallery_region" required>
            <option value="">지역</option>
            <option value="서울특별시">서울특별시</option>
            <option value="인천광역시">인천광역시</option>
            <option value="대전광역시">대전광역시</option>
            <option value="대구광역시">대구광역시</option>
            <option value="광주광역시">광주광역시</option>
            <option value="울산광역시">울산광역시</option>
            <option value="부산광역시">부산광역시</option>
            <option value="제주특별자치도">제주특별자치도</option>
        </select>
       </div>
       <div class="maintext">
        <textarea name="gallery_text" id="text" cols="30" rows="10" placeholder="내용"></textarea>
       </div>
       <div id="file">
        <input type="button" value="파일첨부" id="save" onclick="fileadd()">
       </div>
       <div class="savebtn">
            <input type="submit" value="저장하기" id="save">
       </div>
    </section>
    </form>
   </article>
</body>
<script>
    function fileadd(){
        let newInput = document.createElement('input');   
        newInput.type='file';
        newInput.className='files';
        newInput.name='file';
        let newfile=document.querySelector('#file');
        newfile.appendChild(newInput);
    }
</script>
</html>
