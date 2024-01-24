<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Rubik+Doodle+Shadow&display=swap"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<style>
footer {
	margin-top: 80px;
	background-color: rgb(243, 243, 243);
	text-align: center;
	border: solid 1px rgb(243, 243, 243);
}

article {
	float: left;
	width: 100%;
}

table {
	margin-top: 8px;
}

.table_td {
	padding-top: 10px;
}

#article_table {
	margin-left: 20px;
}

fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

fieldset legend {
	text-align: right;
}

input[type=radio] {
	display: none;
}

fieldset label {
	font-size: 2em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

button {
	background-color: black;
	color: white;
	width: 100px;
	height: 50px;
}

form.row.g-3 {
	padding-top: 15px;
	padding-left: 100px;
	width: 1200px;
	height: 900px;
}

</style>
</head>
<body>
	<%@ include file="./include/top.jsp" %>
	<form class="row g-3" action="updateviewpro" method="post"
		enctype="multipart/form-data" onsubmit="return validateForm()">
		<div class="col-md-4">
			<label for="inputState" class="form-label">지역을 선택해주세요</label> <select
				id="inputState" class="form-select" name="view_region">
				<option ${mtvo.view_region.equals("서울") ? "selected" : ""}>서울</option>
				<option ${mtvo.view_region.equals("부산") ? "selected" : ""}>부산</option>
				<option ${mtvo.view_region.equals("여수") ? "selected" : ""}>여수</option>
				<option ${mtvo.view_region.equals("제주") ? "selected" : ""}>제주</option>
			</select>
		</div>
		<div class="col-md-3">
			<label class="form-label">작성자</label> <input type="text"
				name="view_wr" class="form-control" id="inputCity"
				value="${mtvo.view_wr}" readonly>
		</div>
		<div class="col-md-3">
			<span class="text-bold">평점</span> <br>
			<fieldset>
				<input type="radio" name="view_star" value="5" id="rate1"
					${mtvo.view_star == 5 ? 'checked' : ''}> <label for="rate1">★</label>
				<input type="radio" name="view_star" value="4" id="rate2"
					${mtvo.view_star == 4 ? 'checked' : ''}> <label for="rate2">★</label>
				<input type="radio" name="view_star" value="3" id="rate3"
					${mtvo.view_star == 3 ? 'checked' : ''}> <label for="rate3">★</label>
				<input type="radio" name="view_star" value="2" id="rate4"
					${mtvo.view_star == 2 ? 'checked' : ''}> <label for="rate4">★</label>
				<input type="radio" name="view_star" value="1" id="rate5"
					${mtvo.view_star == 1 ? 'checked' : ''}> <label for="rate5">★</label>
			</fieldset>
		</div>
		<div class="col-12">
			<label for="inputAddress" class="form-label">제목</label> <input
				type="text" name="view_title" class="form-control" id="inputAddress"
				value="${mtvo.view_title}">
		</div>
		<div class="form-floating">
			<label for="inputComment" class="form-label">내용</label><br> <br>
			<textarea class="form-control" id="floatingTextarea2"
				name="view_comment">${mtvo.view_comment}</textarea>
		</div>
		<input type="hidden" name="view_num" value="${mtvo.view_num}">
		<c:forEach items="${files}" var="fname">
			<div>
				<img src="download?filename=${fname}"
					style="width: 500px; height: 300px;"> <span>${fname}</span>
				<button type="button"
					onclick="deleteFile(this,'<c:out value="${fname}" />')">삭제</button>
			</div>
		</c:forEach>
		<script>
    		function deleteFile(button,filename) {
        		// Ajax를 이용하여 서버에 파일 삭제 요청 보내기
        		if(confirm(filename+"를 삭제하시겠습니까?")==true){
        			var xhr = new XMLHttpRequest();
            		xhr.open("GET", "deleteFile?filename=" + encodeURIComponent(filename), true);
            		xhr.onreadystatechange = function () {
                		if (xhr.readyState == 4 && xhr.status == 200) {
                    		// 서버에서 파일 삭제가 완료되면 화면에서도 해당 파일 표시 삭제
                    		var fileContainer = button.parentNode;
                    		fileContainer.parentNode.removeChild(fileContainer);
                		}
            		};	
            		xhr.send();
        		}
    		}
		</script>
		<div class="mb-3">
			<label for="fileInput" class="form-label">첨부 파일</label>
			<div id="fileInputsContainer">
				<input type="file" class="form-control" name="file" multiple>
			</div>
			<button type="button" onclick="addFileInput()">파일 추가</button>
		</div>
		<div class="col-12">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" id="gridCheck">
				<label class="form-check-label" for="gridCheck"> 회원만 보기 </label>
			</div>
		</div>
		<div class="col-12">
			<button type="submit" onclick=onSave()>저장하기</button>
		</div>
		<script>
			let fileInputIndex = 1;

			function addFileInput() {
				const fileInputsContainer = document
						.getElementById('fileInputsContainer');
				const newFileInput = document.createElement('input');
				newFileInput.type = 'file';
				newFileInput.className = 'form-control';
				newFileInput.name = 'file';
				newFileInput.style.display = 'block';
				newFileInput.multiple = true;
				fileInputIndex++;
				fileInputsContainer.appendChild(newFileInput);
			}
		</script>
		<script>
			// CKEditor를 특정 textarea에 적용
			CKEDITOR.replace('floatingTextarea2',{
				language: 'ko', // 한글 언어 설정 추가
				filebrowserUploadUrl : "/ImgUpload"});

			// 저장 버튼을 누를 때 처리
			function onSave() {
				// 에디터의 내용을 가져오기
				var comment = CKEDITOR.instances['floatingTextarea2']
						.getData();

				// <p> 태그를 지우기 위해서 사용
				comment = comment.replace(/<p>/g, '');
				comment = comment.replace(/<\/p>/g, '');

				// 처리된 내용을 다시 에디터에 넣기
				CKEDITOR.instances['floatingTextarea2'].setData(comment);
			}
			function validateForm() {
				// 필수 입력 필드들의 값을 가져오기
				let writer = document.querySelector('input[name="view_wr"]').value;
				let title = document.querySelector('input[name="view_title"]').value;
				let comment = CKEDITOR.instances['floatingTextarea2'].getData();

				// 어떤 필드라도 값이 null인 경우 알림창 띄우고 폼 제출 중단
				if (writer === '') {
					alert('작성자를 입력해주세요');
					return false; // 폼 제출 중단
				} else if (title === '') {
					alert('제목을 입력해주세요');
					return false; // 폼 제출 중단
				} else if (comment === '') {
					alert('내용을 입력해주세요');
					return false; // 폼 제출 중단
				}
				return true; // 폼 제출
			}
		</script>
		<div style="text-align: center;">
			<p class="foot">Travel</p>
			<p class="foot">개발자 : 이수민</p>
			<p class="foot">주소 : 수원시 영통구</p>
		</div>
	</form>
</body>
</html>