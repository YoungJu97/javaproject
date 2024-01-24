<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#sixlayout {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	/* width: 90vw;
	height: 90vh; */
	margin-left:2%;
	margin-top:3%;
	
	/* border: 1px solid black; */
	padding-left: 5.5vh;
	object-fit: cover;
}

#boardOne {
	width: 300px;
	display: flex;
	flex-direction: column;
	border: 1px solid red;
	margin: 1vw;
	object-fit: cover;
}

#boardImg {
	/* height: 60vh; */
	height:auto;
	border: 1px solid black;
	object-fit: cover;
}

#description {
	display: flex;
	flex-direction: column;
	object-fit: cover;
}

.desc-detail {
	margin: 0.5vh;
	display: flex;
	flex-direction: row;
	object-fit: cover;
}

#pagenation {
	display: flex;
	border: 1px solid black;
	justify-content: center;
	object-fit: cover;
}

.downImage {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#topDiv {
	display: flex;
	flex-direction: column;
	overflow: auto;
}
#writebtn{
margin-left:50px;
}

</style>

<body>
<%@ include file="./include/top.jsp" %>
	<div id="topDiv">
		<div id="sixlayout" >
			<%-- <c:forEach items="${files }" var="fname"> <!-- files 는 스트링 배열. --> --%>
			<c:forEach items="${acclist }" var="accvo">
				<!-- var는 jap 내에서만 사용하는 지역변수 -->
				<a href="detail?acvno=${accvo.accNum }" class="greedOne">
					<div id="boardOne">
						<div id="boardImg">
							
						<%-- ${accvo.files[0] } --%>
							<%-- <c:if test="${accvo.files[0]}!=null"> --%>
								<img class="downImage" src="download?filename=${accvo.files[0]}"
									alt='1.png'>
							<%-- </c:if> --%>
							<!-- <img src="1.png" /> -->
							<!-- 나중에 이 부분 파일업로더로 올린 파일 DB 에서 가져와서 바꿔야함. -->
						</div>
						<div id="description">
							<div class="desc-detail">
								<div>제목</div>
								<div>${accvo.accTitle }</div>
							</div>
							<div class="desc-detail">
								<div>작성자</div>
								<div>${accvo.accWriter }</div>
							</div>
							<div class="desc-detail">
								<div>게시날짜</div>
								<div>${accvo.accDate }</div>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>

		<div id="pagenation">
			<c:if test="${rpagevo.prev}">
				<a class="btl" href="acb?page=${rpagevo.startPage -1 }">[이전페이지그룹]</a>
			</c:if>
			<c:forEach begin="${rpagevo.startPage }" end="${rpagevo.endPage }"
				var="idx">
				<c:if test="${idx == rpagevo.page }">[</c:if>
				<a class="btl" href="acb?page=${idx}">${idx }</a>
				<c:if test="${idx == rpagevo.page }">]</c:if>
			</c:forEach>
			<c:if test="${ rpagevo.next}">

				<a class="btl" href="acb?page=${rpagevo.endPage +1 }">[다음 페이지 그룹]</a> 
				
			</c:if>
			<a href="accwr" id="writebtn"><button>글쓰기</button></a>
		</div>
	</div>
	<!-- <div id="pagenation">[1][2][3][4](페이징 코드 따로 작성해야됨)</div> -->
</body>

<script>
	
</script>
</html>