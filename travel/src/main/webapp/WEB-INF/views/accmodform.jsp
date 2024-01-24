<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  -->
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

#aboard-cate {
	display: flex;
	/* border: solid black 1px; */
	height: 8vh;
	margin: 1vh;
}

.cate {
	width: 20vw;
	/* border: solid red 1px; */
	display: flex;
	justify-content: center;
	align-items: center;
}

.cate-content {
	align-items: center;
	display: flex;
	/* border: solid black 1px; */
	width: 79vw;
	height: 99vh margin: 1vw;
}

#aboard-title {
	display: flex;
	/* border: solid black 1px; */
	height: 8vh;
}

#aboard-titleInput {
	display: flex;
	width: 79vw;
	height: 99vh margin: 1vw;
	border-width: 0;
	outline: none;
}

#aboard-content {
	display: flex;
	/* border: solid black 1px; */
	/* height: 70vh; */
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

#aboard-file {
	display: flex;
	flex-direction: column;
	margin-top: 1vw;
	border: 1px solid black;
	/* width : 79.8vw; */
	height: auto;
}

#aboard-file>input {
	flex-direction: culumn;
	border: 1px solid red;
	width: 20vw;
	height: 5vh;
}

.downImage {
	display: flex;
	width: 300px;
	height: 300px;
	margin: 10px;
}

#images {
	display: flex;
	flex-direction: row;
	overflow:auto;
}

.imageOne {
	display: flex;
	flex-direction: row;
}
#fnames{
display:none;
}
.btn{
	font-size : 20px;
	width : 200px;
	height:50px;
}

</style>

<body>
	<form id="abwrForm" 
	action="modconfirm" method="POST" encType="multipart/form-data">
		<div id="aboard-head">숙소 게시판 글쓰기</div>
		<div id="aboard-mid">
			<div id="aboard-cate">
				<input type="hidden" name="accNum" value="${uvo.accNum }">
				<span class="cate">작성자</span> <span class="cate-content">${uvo.accWriter}</span>
			</div>
			<div id="aboard-title">
				<span class="cate">제목</span> <input type="text"
					id="aboard-titleInput" name="accTitle" placeholder="제목을 입력해 주세요"
					value="${uvo.accTitle}">
			</div>
			<textarea id="aboard-content" name="accContents">${uvo.accContents}
            </textarea>
			<div id="images">
				<c:forEach items="${uvo.files }" var="image">
					<div class="imageOne">
					<input type="hidden" class="sendImage" value="${image}">
						<a href="download?filename=${image}" class="image-a"> <img
							class="downImage" src="download?filename=${image }" alt='1.png'></a>
						<button type="button" class=image-remove>x</button>
					</div>
				</c:forEach>
			</div>

		</div>
		<div id="aboard-file">
		
		</div>
		<button type="button" id="addFileBtn" class="btn">addFile</button>
		<div id="aboard-bottom">

			<a href="modconfirm">
				<button type="submit" class="btn">수정하기</button>
			</a> <a href="modcancel" ><button class="btn">취소</button></a>
		</div>
	</form>
</body>
<script>
// 버튼클릭하면 버튼과 왼쪽에있는 이미지를포함한 div를 삭제. >> 이때 해당 이미지파일명을 컨트롤러로 넘겨주고 싶음.(넘겨준 이미지명으로 삭제하는용도)
	let findname = "filename=";
	$(document).ready(function() {
		$(".image-remove").click(function() {
			let num = $(".image-remove").index(this);
			let fnum = $(".downImage").eq(num).attr("src").indexOf(findname);
			/* let fname =  $(".downImage").eq(num).attr("src").slice(fnum+fnum.length); */
			let createFinput = document.createElement('input')
			createFinput.type='hidden';
			createFinput.name='Dfiles';
			createFinput.value = $(".sendImage").eq(num).val();
			$("#abwrForm").append(createFinput);
			$(".imageOne").eq(num).remove();
		});
	});
	
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