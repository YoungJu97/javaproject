
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>


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
	<form class="row g-3" action="viewwrpro" method="post"
		onsubmit="return validateForm()" enctype="multipart/form-data">
		<div class="col-md-4">
			<label for="inputState" class="form-label">지역을 선택해주세요</label> <select
				id="inputState" class="form-select" name="view_region">
				<option selected>서울</option>
				<option>부산</option>
				<option>여수</option>
				<option>제주</option>
			</select>
		</div>
		<div class="col-md-3">
			<label class="form-label">작성자</label> <input type="text"
				name="view_wr" class="form-control" id="inputCity"
				value="${user_id}" readonly>
		</div>
		<div class="col-md-3">
			<span class="text-bold">평점</span> <br>
			<fieldset>
				<input type="radio" name="view_star" value="5" id="rate1" checked>
				<label for="rate1">★</label> <input type="radio" name="view_star"
					value="4" id="rate2"> <label for="rate2">★</label> <input
					type="radio" name="view_star" value="3" id="rate3"><label
					for="rate3">★</label> <input type="radio" name="view_star"
					value="2" id="rate4"> <label for="rate4">★</label> <input
					type="radio" name="view_star" value="1" id="rate5"><label
					for="rate5">★</label>
			</fieldset>
		</div>
		<div class="col-12">
			<label for="inputAddress" class="form-label">제목</label> <input
				type="text" name="view_title" class="form-control" id="inputAddress"
				placeholder="제목을 입력하세요">
		</div>
		<div class="form-floating">
			<label for="inputComment" class="form-label">내용</label><br> <br>
			<textarea class="form-control" id="floatingTextarea2"
				name="view_comment"></textarea>
		</div>

		<div class="mb-3">
			<label for="fileInput" class="form-label">첨부 파일</label>
			<div id="fileInputsContainer">
				<input type="file" class="form-control" name="file"
					 multiple>
			</div>
			<button type="button" onclick="addFileInput()">파일 추가</button>
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
		<div class="col-12">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" id="gridCheck">
				<label class="form-check-label" for="gridCheck"> 회원만 보기 </label>
			</div>
		</div>
		<!-- <div class="col-12">
			<button type="submit">저장하기</button>
		</div> -->
		<div class="col-12">
			<!-- 저장하기 버튼 -->
			<button type="submit" onclick="onSave()">저장하기</button>
		</div>
		<script>
			CKEDITOR.replace('floatingTextarea2', {
				language : 'ko',
				filebrowserUploadUrl : "/ImgUpload"
			});
		</script>
		<script>
			// 저장 버튼을 누를 때 처리
			function onSave() {
				// 에디터의 내용을 가져오기
				var comment = CKEDITOR.instances['floatingTextarea2'].getData();

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

	</form>

	<footer>
		<div>
			<p class="foot">Travel</p>
			<p class="foot">개발자 : 이수민</p>
			<p class="foot">주소 : 수원시 영통구</p>
		</div>
	</footer>
</body>
</html>