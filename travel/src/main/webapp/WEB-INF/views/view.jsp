<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<style>

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
	<form class="row g-3" action="goback" method="get">
		<div class="col-md-4">
			<label for="inputCity" class="form-label">지역</label> <input
				type="text" name="view_wr" class="form-control" id="inputCity"
				value=${nowvo.view_region } readonly>
		</div>
		<div class="col-md-3">
			<label for="inputCity" class="form-label">작성자</label> <input
				type="text" name="view_wr" class="form-control" id="inputCity"
				value=${nowvo.view_wr } readonly>
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
			<label for="inputAddress" class="form-label">후기</label> <input
				type="text" name="view_title" class="form-control" id="inputAddress"
				value="${nowvo.view_title }" readonly>
		</div>
		<div class="form-floating">
			<label for="inputComment" class="form-label">내용</label><br> <br>
			<textarea class="form-control" id="floatingTextarea2"
				name="view_comment" readonly style="width: 100%; height: 200px;">${nowvo.view_comment }</textarea>
		</div>
		<span> 첨부파일</span>
		<c:forEach items="${files}" var="fname">
			<a href="download?filename=${fname}">${fname }</a>
			<img src="download?filename=${fname}"
				style="width: 500px; height: 300px;">
		</c:forEach>
		<hr>
		<div class="col-12">
			<button class="btn btn-light">뒤로가기</button>
			<a href="tripviewmod?tvo=${nowvo.view_num}" class="btn btn-secondary">수정</a>
			<a href="#" class="btn btn-danger"
				onclick="return delchk(${nowvo.view_num})">삭제</a>
		</div>
		<script>
			function delchk(tvo){
				if(confirm("게시물을 삭제하시겠습니까?")==true){
					location.href="tripviewdel?tvo="+tvo;
				}else{
					alert("취소함")
				}
			}
		</script>

		<script>
			document.addEventListener('DOMContentLoaded', function() {
    			const radioButtons = document.querySelectorAll('input[type="radio"]');
    			radioButtons.forEach(radio => {
       				 radio.disabled = true; // 모든 라디오 버튼을 비활성화
   			 	});
			});
		</script>
		<div style="text-align: center;">
			<p class="foot">Travel</p>
			<p class="foot">개발자 : 이수민</p>
			<p class="foot">주소 : 수원시 영통구</p>
		</div>
	</form>
</body>
</html>