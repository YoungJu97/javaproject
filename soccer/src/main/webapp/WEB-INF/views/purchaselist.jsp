<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품구매</title>
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

.table {
	text-align: center;
}

table td {
	vertical-align: middle;
}

.height {
	height: 10rem;
}
</style>
</head>
<body>
	<%@ include file="./include/top.jsp"%>
	<main>
		<div class="background">
			<div>
				<h1 class="display-1 fw-bolder context">PURCHASE LIST</h1>
			</div>
		</div>

		<article>
			<section id="section">
				<table class="table">
				<c:if test="${user_id!='admin'}">
					<tr>
						<th style="width: 5%;">구매번호</th>
						<th style="width: 20%;">이미지</th>
						<th style="width: 20%;">제품명</th>
						<th style="width: 15%;">주소</th>
						<th style="width: 5%;">XL</th>
						<th style="width: 5%;">L</th>
						<th style="width: 5%;">M</th>
						<th style="width: 5%;">S</th>
						<th style="width: 5%;">총 개수</th>
						<th style="width: 5%;">가격</th>
						<th style="width: 5%;">환불</th>
					</tr>
					</c:if>
					<c:if test="${user_id=='admin' }">
					<tr>
						<th style="width: 5%;">구매번호</th>
						<th style="width: 20%;">이미지</th>
						<th style="width: 20%;">제품명</th>
						<th style="width: 15%;">주소</th>
						<th style="width: 5%;">XL</th>
						<th style="width: 5%;">L</th>
						<th style="width: 5%;">M</th>
						<th style="width: 5%;">S</th>
						<th style="width: 5%;">총 개수</th>
						<th style="width: 5%;">구매자</th>
						<th style="width: 5%;">가격</th>
					</tr>
					</c:if>
					<c:forEach items="${purchase }" var="pur">
					<c:if test="${user_id!='admin'}">
						<tbody class="board">
							<td>${pur.pur_num }</td>
							<td><img class="height"
								src="download?filename=${pur.pur_img}" /></td>
							<td>${pur.pur_title }</td>
							<td>${pur.pur_addr }</td>
							<td>${pur.pur_xl }</td>
							<td>${pur.pur_l }</td>
							<td>${pur.pur_m }</td>
							<td>${pur.pur_s }</td>
							<td>${pur.pur_s +pur.pur_xl+pur.pur_l+pur.pur_m}</td>
							<td><fmt:formatNumber value="${pur.pur_price}"
									pattern="₩###,###" /></td>
							<td><a
								href="refund?pur_num=${pur.pur_num }&&pur_id=${user_id}&&pur_pronum=${pur.pur_pronum}&&pur_xl=${pur.pur_xl}&&pur_l=${pur.pur_l}&&pur_m=${pur.pur_m}&&pur_s=${pur.pur_s}">
								<button id="add" class="btn btn-outline-dark">환불</button></a></td>
						</tbody>
						</c:if>
						<input type="hidden" value=${user_id } id="user">
						<c:if test="${user_id=='admin'}">
						
						<tbody class="board">
							<td>${pur.pur_num }</td>
							<td><img class="height"
								src="download?filename=${pur.pur_img}" /></td>
							<td>${pur.pur_title }</td>
							<td>${pur.pur_addr }</td>
							<td>${pur.pur_xl }</td>
							<td>${pur.pur_l }</td>
							<td>${pur.pur_m }</td>
							<td>${pur.pur_s }</td>
							<td>${pur.pur_s +pur.pur_xl+pur.pur_l+pur.pur_m}</td>
							<td>${pur.pur_id }</td>
							<td><fmt:formatNumber value="${pur.pur_price}"
									pattern="₩###,###" /></td>	
						</tbody>
						</c:if>
					</c:forEach>
				</table>

			</section>
		</article>
	</main>
	<%@ include file="./include/footer.jsp"%>
</body>
<script>
	const refundbtn = document.getElementById("add");
	refundbtn.addEventListener("click", function() {
	   alert("환불완료");
	});
</script>
</html>