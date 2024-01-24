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
	display: inline-block;
}

#section1 {
	margin-top: 2%;
	display: inline-block;
	width: 100%; 
	
}


.sub {
	margin-left: 10px;
	font-weight: bolder;
	font-size: x-large;
	text-align: center;
}

.video {
	margin-top: 100px;
	width: 100%;
}

.youtube {
	display: inline-block;
	margin-left: 0px;
	width: 33%; 
	padding-bottom: 20%; 
	position: relative;
}

.yvideo {
	position: absolute;
	width: 100%;
	height: 100%;
}

div iframe {
	border-radius: 50px;
}

footer {
	margin-top: 80px;
	background-color: rgb(243, 243, 243);
	text-align: center;
	border: solid 1px rgb(243, 243, 243);
}
.write{
	font-weight: bolder;
	 color: rgb(144, 255, 161);
}

.travel {
	width: 16%; 
	padding-bottom: 16%; 
	position: relative;
	display: inline-block;
	margin-left: 3%;	

}
.travel:hover{
	transform:scale(1.2);
}
.travelimg {
	position: absolute;
	border-radius: 200px;
	width: 100%;
	height: 100%;
	box-shadow: 10px 0px 10px rgba(0, 0, 0, 0.7);
}
#carouselExampleAutoplaying{
	box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.5);
}
#carouselExampleAutoplaying1{
	box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.5);
}

.travelhot {
	position: absolute;
	left: 38%;
	top: 100%;
	text-align: center;
	font-size: 25px;
	margin-top: 15px;
}
</style>
</head>
<body>
	<%@ include file="./include/top.jsp"%>
	<article>
		<section id="section1">
 			<div>
                <p class="sub">인기 숙소 Top3</p>
            </div>
            <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <c:forEach items="${rank }" var="rank" varStatus="loop">
                        <div class="carousel-item ${loop.index == 0 ? 'active' : ''}">
                            <img src="${rank.res_img_addr }" class="d-block w-100" alt="..." height="400px">
                            <div class="carousel-caption d-none d-md-block">
                                <h5 class="write">${rank.res_title }</h5>
                                <a href="reservation?res_title=${rank.res_title}&res_img_addr= ${rank.res_img_addr}&res_addr=${rank.res_addr}&res_price=${rank.res_price}">
                                <button type="button" class="btn btn-light">예약하기</button>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
		</section>
		
		<section class="video">
			<div>
				<p class="sub">지역별 여행지</p>
			</div>
			<div class="travel">
				<a href="region?region=서울"><img src="<%=request.getContextPath()%>/resources/img/seuol.jpg"
					alt="" class="travelimg"></a>
			<p class="travelhot">서울</p>
			</div>
			<div class="travel">
			<a href="region?region=대전"	><img src="<%=request.getContextPath()%>/resources/img/deajeon.jpg"
					alt="" class="travelimg"></a>
			<p class="travelhot">대전</p>
			</div>
			<div class="travel">
			<a href="region?region=부산">	<img src="<%=request.getContextPath()%>/resources/img/busan.jpg"
					alt="" class="travelimg"></a>
				<p class="travelhot">부산</p>
			</div>
			<div class="travel">
			<a href="region?region=대구">	<img src="<%=request.getContextPath()%>/resources/img/deagu.jpg"
					alt="" class="travelimg"></a>
				<p class="travelhot">대구</p>
			</div>
			<div class="travel">
			<a href="region?region=인천"><img src="<%=request.getContextPath()%>/resources/img/injeun.jpg"
					alt="" class="travelimg"></a>
				<p class="travelhot">인천</p>
			</div>
		</section>
		<section class="video">
			<div>
				<p class="sub">추천 여행지 YouTube</p>
			</div>
			<div class="youtube">
				<iframe
					src="https://www.youtube.com/embed/l3XW6ZpF2wk?si=izuGIebtN7tooMkk"
					class="yvideo" title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></iframe>
			</div>
			<div class="youtube">
				<iframe
					src="https://www.youtube.com/embed/rRCfmGa4MJg?si=QfnUp1F7wX6n4b6x"
					class="yvideo" title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></iframe>
			</div>
			<div class="youtube">
				<iframe
					src="https://www.youtube.com/embed/8yjWvsaqFAE?si=vK9QB8hXhe1n2TcN"
					class="yvideo" title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></iframe>
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
<script>

</script>
</html>
