<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<style>
.background {
	background-color: black;
	width: 100%;
	height: 22rem;
	margin-bottom: 1rem;
	display: flex;
	justify-content: center;
	align-items: center;
}

.context {
	color: white;
}

.margin {
	padding-left: 1rem;
}

.marginb {
	margin-bottom: 1rem;
}

.input-text {
	width: 40rem;
	border-radius: 0.5rem;
	border: solid 1px rgb(221, 221, 221);
}

.input-text1 {
	width: 15rem;
	border-radius: 0.5rem;
	border: solid 1px rgb(221, 221, 221);
}

.input-file {
	font-size: 17px;
	width: 30rem;
	border-radius: 0.5rem;
	border: solid 1px rgb(221, 221, 221);
	display: inline;
}

.table {
	text-align: center;
	vertical-align: middle;
}

.tag {
	color: inherit;
	text-decoration: none;
}

article {
	width: 100%;
	height: 50rem;
}

#section2 {
	margin-left: 1rem;
	display: none;
}

section {
	display: inline-block;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

#section {
	width: 100%;
}

.box {
	width: 48%;
}

.scroll {
	overflow-y: scroll;
	white-space: nowrap;
}

.heigth {
	width: 50rem;
	height: 30rem;
}

a:hover {
	color: black;
}

#pagebtn {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>
	<%@ include file="./include/top.jsp"%>
	<main>
		<div class="background">
			<div>
				<h1 class="display-1 fw-bolder context">CLUB COMMUNITY</h1>
			</div>
		</div>
		<article>
			<section id="section" class="box">
				<table class="table">
					<tr>
						<th style="width: 15%;">번호</th>
						<th style="width: 55%;">제목</th>
						<th style="width: 15%;">조회수</th>
						<th style="width: 15%;">등록일</th>
					</tr>
					<c:forEach items="${community }" var="com">
						<tbody class="board">
							<td>${com.com_num}</td>
							<td><a class="tag" href="selectcommunity?com_num=${com.com_num }&&com_chk=${com.com_chk}">${com.com_title }</a></td>
							<td>${com.com_chk}</td>
							<td>${com.com_date}</td>
						</tbody>
					</c:forEach>

				</table>
				<div>
					<button id="add" class="btn btn-outline-dark">작성</button>
				</div>
				<div id="pagebtn">
					<c:if test="${page.prev}">
						<a href="clubcommunity?page=${page.startPage - 1}">
							<button class="btn btn-outline-dark" style="margin-left: 0.5rem;">Previous</button>
						</a>
					</c:if>

					<c:forEach var="pagenum" begin="${page.startPage}" end="${page.endPage}">
						<a href="clubcommunity?page=${pagenum}">
							<button class="btn btn-outline-dark" style="margin-left: 0.5rem;">${pagenum}</button>
						</a>
					</c:forEach>

					<c:if test="${page.next}">
						<a href="clubcommunity?page=${page.endPage + 1}">
							<button class="btn btn-outline-dark" style="margin-left: 0.5rem;">Next</button>
						</a>
					</c:if>
				</div>
			</section>
			<section id="section2" class="box scroll">
				<form action="communityadd" method="post" enctype="multipart/form-data">
					<h1 class="display-5 fw-bolder d-flex">게시글 작성</h1>
					<div class="d-flex marginb">
						<div class="input-group input-group-lg">
							<img id="image" class="heigth" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." />
						</div>
					</div>
					<input type="hidden" value="${user_id }" name="com_id">
					<div class="d-flex marginb">
						<div class="input-group input-group-lg">
							<span class="input-group-text">제목</span> <input type="text" class="input-text" required name="com_title">
						</div>
					</div>
					<div class="d-flex marginb">
						<div class="input-group input-group-lg">
							<span class="input-group-text">내용</span>
							<textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!" name="com_text"> </textarea>
						</div>
					</div>

					<div class="d-flex marginb">
						<input type="file" class="btn btn-outline-dark input-file" name="file">
					</div>
					<button id="write" class="btn btn-outline-dark flex-shrink-1" type="submit">
						<i class="bi-cart-fill me-1">Add</i>
					</button>
				</form>
			</section>
		</article>
	</main>
	<%@ include file="./include/footer.jsp"%>
	<script>
		document.getElementById("add").addEventListener("click", function() {
			document.getElementById("section2").style.display = "inline-block";
			document.getElementById("section").style.width = "48%";
		});
		document.getElementById("write").addEventListener("click", function() {
			document.getElementById("section2").style.display = "none";
			document.getElementById("section").style.width = "100%";
		});
		document.querySelector('.input-file').addEventListener('change',
				function() {
					const file = this.files[0];
					const reader = new FileReader();
					reader.readAsDataURL(file);
					reader.onload = function(event) {
						const image = document.getElementById('image');
						image.src = event.target.result;
					};

				});
	</script>
</body>
</html>