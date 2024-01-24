<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  -->
<!DOCTYPE html>
<html>
<head>
<title>destination page</title>

</head>
<style>
#root-div {
	/* width: 1280px;
        height: 960px; */
	margin-top:2%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.destin-div {
	
	display:flex;
	flex-direction:row;
	width: 1000px;
	height: auto;
	margin-botom:5px;
}
p{
font-size: 18px;
}
.destination-description{
display:flex;
flex-direction:column;
margin-left: 5%;
}

.destin-img {
	width: 500px;
	height: 600px;
}

.detail-img {
	display: flex;
	flex-direction: row;
}
</style>

<body>
<%@ include file="./include/top.jsp" %>
	<div id="root-div">
		<input type=hidden id="searchid" value="${contentId}">
		<h2>여행 경로</h2>

	</div>
</body>
<script>
    $(document).ready(function () {
        const apiKey2 = "uzgT2g7ltKt%2B8O%2FCqO8T3bHxBW8RYr8DAGORFnI3TW9v43lRBWmEjIbw%2B5SRUU4eDhaEgtTmgec3FMvAN%2B6O5Q%3D%3D";
        const apiKey = "uzgT2g7ltKt+8O/CqO8T3bHxBW8RYr8DAGORFnI3TW9v43lRBWmEjIbw+5SRUU4eDhaEgtTmgec3FMvAN+6O5Q=="; //인증키
        const protocol = "https://";
        const baseUrl = "apis.data.go.kr/B551011/KorService1"; // 베이스 유알엘 뒤에 / 붙여서 검색목록작성
        const localSearch = "detailInfo1"; // 지역기반 검색 . 뒤에 ?넣고 세부파라미터 작성
        const localSearch2 = "detailCommon1"
        const localSearch3 = "detailImage1"
		const contentId=$('#searchid').val();
        let subContentid;
        const subUrl = "&MobileOS=ETC&MobileApp=AppTest&_type=json&contentId=${contentId}&contentTypeId=25&numOfRows=10&pageNo=1"; // 나머지 검색 카테코리들
        let subUrl2=null;
        let subUrl3=null; 
        const url = `${'${protocol}'}${'${baseUrl}'}/${'${localSearch}'}?&serviceKey=${'${apiKey2}'}&${'${subUrl}'}`; // 템플릿 리터럴 + 표현삽입식. */
        let url2 = `${'${protocol}'}${'${baseUrl}'}/${'${localSearch2}'}?&serviceKey=${'${apiKey2}'}&${subUrl2}`;
        let url3 = null;
        
        async function JSONData3(subcontentid) {
        	subUrl3 = `MobileOS=ETC&MobileApp=AppTest&_type=json&contentId=${'${subcontentid}'}&imageYN=Y&subImageYN=Y&numOfRows=10&pageNo=1`;
        	url3 = `${'${protocol}'}${'${baseUrl}'}/${'${localSearch3}'}?&serviceKey=${'${apiKey2}'}&${'${subUrl3}'}`;
        	//url3 = `${'${protocol}'}apis.data.go.kr/B551011/KorService1/detailImage1?serviceKey=uzgT2g7ltKt%2B8O%2FCqO8T3bHxBW8RYr8DAGORFnI3TW9v43lRBWmEjIbw%2B5SRUU4eDhaEgtTmgec3FMvAN%2B6O5Q%3D%3D&MobileOS=ETC&MobileApp=AppTest&_type=json&contentId=126374&imageYN=Y&subImageYN=Y&numOfRows=10&pageNo=1`;
        	const response = await fetch(url3);
            if (response.ok) {
                const jsonData3 = await response.json();
                console.log(jsonData3);
                var images = jsonData3.response.body.items.item;
            } else {
                console.error("서버에서 JSON 형식의 응답이 아닙니다.");
            }
            return images;
        }
        
        async function JSONData2(subcontentid) {
        	subUrl2 = `MobileOS=ETC&MobileApp=AppTest&_type=json&contentId=${'${subcontentid}'}&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=10&pageNo=1`;
        	url2 = `${'${protocol}'}${'${baseUrl}'}/${'${localSearch2}'}?&serviceKey=${'${apiKey2}'}&${'${subUrl2}'}`;
        	console.log(subUrl2);
        	
            const response = await fetch(url2);
            if (response.ok) {
                const jsonData2 = await response.json();
                var data = jsonData2.response.body.items.item;
            } else {
                console.error("서버에서 JSON 형식의 응답이 아닙니다.");
                console.log(response+2);
            }
            return data;
        }
        async function JSONData() {
        	subcontentid=0;
            const response = await fetch(url);
            if (response.ok) {
                const jsonData = await response.json();
                var items = jsonData.response.body.items.item;
            } else {
                console.error("서버에서 JSON 형식의 응답이 아닙니다.");
            }
             for (let i = 0; i < items.length; i++) {
            	 let subname=items[i].subname;
            	 let subcontentid=items[i].subcontentid;
            	 let items2 = await JSONData2(subcontentid);
            	 let items3 = await JSONData3(subcontentid);
            	 //console.log(items2);
            	 console.log(items2)
            	 $('#root-div').append(`
            	 	<div class="destin-div">
                         <div class="detail-img">
                             <img class="destin-img" src=${'${items3[0].originimgurl}'}>
                    	</div>
                    	<div class="destination-description"> 
                         <p class="destin-title">장소 ${'${i+1}'} : ${'${subname}'}</p>
                         <br>
                         <p class="destin-addr">주소 : ${'${items2[0].addr1}'}</p>
                         <p class="destin-addr">소개 : ${'${items2[0].overview}'}</p>
                         <input type=hidden class="mapx" value="${'${items2[0].mapx}'}">
                         <input type=hidden class="mapy" value="${'${items2[0].mapx}'}">
                         </div>
                 </div><br>`
                     );
            } 
        }
        JSONData();
    });
</script>

</html>