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
	margin-top: 2%;
	width: 90%;
	margin-left: 4.5%;
}

#table {
	width: 100%;
}
.tabletext {
	font-size: 15px;
	height: 40px;
	text-align: center;
}





#maindiv {
	width: 100%;
	
}

.carddiv:hover {
	transform:scale(1.2);
	background-color: rgb(118, 118, 118);
	color: white;
}

.carddiv {
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);
	border-radius: 10px;
	width: 25%;
	margin-left: 6%;
	margin-top: 20px;
	display: inline-block;
	
}

#wdiv {
	text-align: right;
	margin-right: 2%;
	margin-top: 15px;
}

#wbtn {
	background-color: rgb(200, 200, 200);
	font-weight: bolder;
	border-radius: 7px;
}

.card-text {
	width: 100%;
	text-align: left;
	color:black;
}

#pagebtn {
	margin-top: 20px;
	text-align: center;
}

.card-img-top {
	height: 250px;
	border-radius: 10px;
}

footer {
	margin-top: 80px;
	background-color: rgb(243, 243, 243);
	text-align: center;
	border: solid 1px rgb(243, 243, 243);
}
</style>
</head>
<body>
<%@ include file="./include/top.jsp" %>	
	<article>
		<section id="table">
			<h2>갤러리</h2>
			
		
			<div id="maindiv">
					<c:forEach items="${glist }" var="gallery">
			<a href="detailview?gallery_num=${gallery.gallery_num}&&gallery_cnt=${gallery.gallery_cnt}">
			<div class="carddiv" >
					<c:forEach items="${file }" var="file">	
								<c:if test="${gallery.gallery_num  == file.files_num }">
									
									<img src="download?filename=${file.gallery_filename}" class="card-img-top">
								
								</c:if>
					</c:forEach>
					<p class="card-text" style="font-size: 13px; font-weight: bolder;">${gallery.gallery_num }</p>
					<p class="card-text" style="font-size: 21px; font-weight: bolder;">제목
						:${gallery.gallery_title }</p>
					<p class="card-text" style="font-size: 16px; font-weight: bolder;">지역
						: ${gallery.gallery_region}</p>
					<p class="card-text" style="font-size: 15px; font-weight: bolder;">작성자
						:${gallery.userid}</p>
					<p class="card-text" style="font-size: 14px; font-weight: bolder;">조회순
						: ${gallery.gallery_cnt}</p>
					
			</div>
			</a>
				</c:forEach>	
			</div>
			<div id="wdiv">
				<a href="gwrite"><button id="wbtn">글쓰기</button></a>
			</div>	
			<div id="pagebtn">
				<c:forEach var="pagenum" begin="${page.startPage }"
					end="${page.endPage }">
					<a href="gallery?page=${pagenum }"><button>${pagenum }</button></a>
				</c:forEach>
			</div>
			

		</section>
	</article>
	<footer>
		<div>
			<p class="foot">Travel</p>
			<p class="foot">개발자 : 이영주</p>
			<p class="foot">주소 : 수원시 영통구</p>
		</div>
	</footer>
</body>
</html>
