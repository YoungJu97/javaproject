
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<style>
h2 {
	text-align: center;
}
#subtitle{
margin-left: 5%;
}

.viewimg {
	display: flex;
	justify-content: center; /* 수평 가운데 정렬 */
	overflow: hidden
}

.viewimg a {
	margin: 8px; /* 이미지 간격 조절을 위한 마진 값 */
}

.viewimg a img {
	width: 230px; /* 이미지의 너비 조절 */
	height: 230px; /* 높이 자동으로 조정하여 비율 유지 */
	transform: scale(1.0);
	transition: all 0.5s;
	/* 필요한 경우 추가적인 스타일링을 할 수 있습니다. */
}

.seoul-link img {
	/* SEOUL 링크에 대한 스타일 */
	
}

.busan-link img {
	/* BUSAN 링크에 대한 스타일 */
	
}

.yeosu-link img {
	/* YEOSU 링크에 대한 스타일 */
	
}

.jeju-link img {
	/* JEJU 링크에 대한 스타일 */
	
}

.viewimg a:hover img {
	transform: scale(1.1);
}

article {
	float: left;
	width: 100%;
}

table {
	margin-top: 8px;
}

.table_td {
	padding-top: 5px;
}

#article_table {
	padding-left: 100px;
	width: 1200px;
}
</style>
</head>
<%@ include file="./include/top.jsp" %>
	<h2 id="subtitle">지역별 여행지 후기</h2>
	<div class="viewimg">
		<a href="tripview?region=서울" class="seoul-link"> <img
			src="./resources/img/seoul_image.PNG" alt="SEOUL">
		</a> <a href="tripview?region=부산" class="busan-link"> <img
			src="resources/img/busan_image.PNG" alt="BUSAN">
		</a> <a href="tripview?region=여수" class="yeosu-link"> <img
			src="resources/img/yeosu_image.PNG" alt="YEOSU">
		</a> <a href="tripview?region=제주" class="jeju-link"> <img
			src="resources/img/jeju_image.PNG" alt="JEJU">
		</a>
	</div>



	<div id="article_table">
		<table class="table">
			<tr style="text-align: center">
				<th scope="col" width=10% style="text-align: center">번호</th>
				<th scope="col" width=30% style="text-align: center">제목</th>
				<th scope="col" width=10% style="text-align: center">지역</th>
				<th scope="col" width=20% style="text-align: center">작성자</th>
				<th scope="col" width=10% style="text-align: center">조회수</th>
			</tr>
			<!-- 컨트롤러에서 보낸 리스트를 반복하여 tr단위로 출력하면 된다. -->
			<tbody>
				<c:forEach items="${tvlist}" var="tvvo">
					<tr>
						<td scope="row" style="text-align: center; padding-top: 50px;">${tvvo.view_num }</td>
						<td style="text-align: left;"><a
							href="tvdetail?tvo=${tvvo.view_num }"> <img
								src="download?filename=${tvvo.file_name}"
								style="width: 100px; height: 100px;"> ${tvvo.view_title}
						</a></td>
						<td style="text-align: center; padding-top: 50px;">${tvvo.view_region }</td>
						<td style="text-align: center; padding-top: 50px;">${tvvo.view_wr }</td>
						<td style="text-align: center; padding-top: 50px;">${tvvo.view_cnt }</td>
					</tr>
				</c:forEach>
				<!--  paging info -->
				<%-- <tr>
					<td colspan=4 align=center><c:if test="${pagevo.prev }">
							<a href="tripview?page=${pagevo.startPage -1 }"> < </a>
						</c:if> <c:forEach begin="${pagevo.startPage }" end="${pagevo.endPage }"
							var="idx">
							<a href="tripview?page=${idx}"> <c:if
									test="${idx == pagevo.page }">[</c:if> ${idx } <c:if
									test="${idx == pagevo.page }">]</c:if>
							</a>
						</c:forEach> <c:if test="${pagevo.next }">
							<a href="tripview?page=${pagevo.endPage +1 }"> > </a>
						</c:if></td>
				</tr> --%>
				<!--  paging info -->
				<tr>
					<td colspan=4 align=center><c:if test="${pagevo.prev }">
							<c:choose>
								<c:when test="${empty pagevo.region}">
									<a href="tripview?page=${pagevo.startPage - 1}"> &lt; </a>
								</c:when>
								<c:otherwise>
									<a
										href="tripview?region=${pagevo.region}&page=${pagevo.startPage - 1}">
										&lt; </a>
								</c:otherwise>
							</c:choose>
						</c:if> <c:forEach begin="${pagevo.startPage}" end="${pagevo.endPage}"
							var="idx">
							<c:choose>
								<c:when test="${empty pagevo.region}">
									<a href="tripview?page=${idx}">
								</c:when>
								<c:otherwise>
									<a href="tripview?region=${pagevo.region}&page=${idx}">
								</c:otherwise>
							</c:choose>
							<c:if test="${idx == pagevo.page }">[</c:if> ${idx } <c:if
								test="${idx == pagevo.page }">]</c:if>
							</a>
						</c:forEach> <c:if test="${pagevo.next }">
							<c:choose>
								<c:when test="${empty pagevo.region}">
									<a href="tripview?page=${pagevo.endPage + 1}"> &gt; </a>
								</c:when>
								<c:otherwise>
									<a
										href="tripview?region=${pagevo.region}&page=${pagevo.endPage + 1}">
										&gt; </a>
								</c:otherwise>
							</c:choose>
						</c:if></td>
				</tr>
			</tbody>

		</table>

		<div id="table_menu">
		<c:if test="${user_id != null }">
			<a href="tripwr">
				<button>글쓰기</button>
			</a>
		</c:if>
	</div>

	</div>
	<footer>
		<div>
			<p class="foot">Travel</p>
			<p class="foot">개발자 : 이수민</p>
			<p class="foot">주소 : 수원시 영통구</p>
		</div>
	</footer>
</body>
</html>