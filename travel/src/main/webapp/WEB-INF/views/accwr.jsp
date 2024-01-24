<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    #abwrForm {
        display: inline-block;
        margin-top: 20px;
        margin-left: 100px;
        width: 80vw;
        height: 100vh;
    }

    #aboard-head {
        /* border: 1px solid black; */
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 10px;
        height: 8vh;
    }



    #aboard-mid {
        display: flex;
        flex-direction: column;
        border: 1px solid black;
        height: 70vh;
    }
	
	#aboard-cate{
	display:flex;
    /* border: solid black 1px; */
    height: 8vh;
    margin: 1vh;
	}
	.cate{
	width : 20vw;
	/* border: solid red 1px; */
	display : flex;
	justify-content : center;
	align-items : center;
	}
	.cate-content{
	align-items : center;
	display: flex;
    /* border: solid black 1px; */
    width: 79vw;
    height : 99vh
    margin: 1vw;
	}
	#aboard-title{
		display: flex;
        /* border: solid black 1px; */
        height: 8vh;
        
        
	}
    #aboard-titleInput {
        display: flex;
        width: 79vw;
        height : 99vh
        margin: 1vw;
        border-width:0;
        outline: none; 
    }
	
    #aboard-content {
        display: flex;
        /* border: solid black 1px; */
        height: 70vh;
        margin: 1vw;
    }

    #aboard-bottom {
        display: flex;
        margin-top: 1vh;
        justify-content: center;
        /* border: 1px solid black; */
    }

    #aboard-bottom>button {
        border-radius: 15px;
        margin: 3vw;
        width: 10vw;
        height: 8vh;
    }
    #aboard-file{
    display:flex;
    flex-direction:column;
    margin-top:1vw;
    border : 1px solid black;
    /* width : 79.8vw; */
    height : auto;
    
    }
    #aboard-file>input{
    flex-direction:culumn;
    border: 1px solid red;
  	width:20vw;
    height: 5vh;
    
    }
</style>

<body>
    <form id="abwrForm" action="abwr" method="POST" encType="multipart/form-data">
        <div id="aboard-head">
            숙소 게시판 글쓰기
        </div>
        <div id="aboard-mid">
        	<div id="aboard-cate">
        		<span class="cate">작성자</span>
        		<span class="cate-content" >${user_id }</span>
        		<input type="hidden"  name="accid" value="${user_id }">
        	</div>
       		 <div id="aboard-title">
        		<span class="cate">제목</span>
            	<input type="text" id="aboard-titleInput" name="accTitle" placeholder="제목을 입력해 주세요">
        	</div>
            <textarea id="aboard-content" name="accContents"></textarea>
        </div>
		<div id="aboard-file">
          <input class="form-control"  type="file" id="formFile" name="file">
          <input class="form-control"  type="file" id="formFile" name="file">
        </div>
        <button type="button" id="addFileBtn">addFile</button>
        <div id="aboard-bottom">
        	
            <button type="submit">글쓰기</button>
           <button type="button">취소</button>
        </div>
    </form>
</body>
<script>
// 파일 추가 버튼관련한 코드를 작성하자 !!
$(document).ready(function() {
		$("#addFileBtn").click(function() {
			let addFile = document.createElement('input');
			addFile.type="file";
			addFile.id="formFile";
			addFile.className="form-control";
			addFile.name="file";
			$("#aboard-file").append(addFile);
		});
	});
</script>
</html>