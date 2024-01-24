<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  -->
<!DOCTYPE html>
<html>
<head>
<title>destination page</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
h3 {
	text-align: center;
}

#root-div {
	/* width: 1280px;
        height: 960px; */
      

	/* display: flex;
        flex-direction: column; */
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	/* grid-template-rows: repeat(3, 100px); */
	/* justify-content: center;
        align-items: center; */
}

.destin-div {
	margin-left:3%;
	margin-top : 3%;
	height: auto;
}

.destin-img {
	width: 400px;
	height: 400px;
}

.pagination-container {
	display: flex;
	justify-content: center;
	align-items: center;
}
.destin-title{
	font-size: 20px;
}
.next-button{
	margin-top: 8%;
}
</style>

<body>
<%@ include file="./include/top.jsp" %>
	<h3>추천 여행 코스</h3>
	<div id="root-div"></div>
	<div id=paging>
		<div class="pagination-container">
			
			<div class="number-button-wrapper">
				 <!-- <span type='hidden' class="number-button">1</span> -->
			</div>
			
		</div>
	</div>
</body>

<script>
const numberButtonWrapper = document.querySelector('.number-button-wrapper');
const pageNumberButtons = document.querySelectorAll('.number-button');

const apiKey2 = "uzgT2g7ltKt%2B8O%2FCqO8T3bHxBW8RYr8DAGORFnI3TW9v43lRBWmEjIbw%2B5SRUU4eDhaEgtTmgec3FMvAN%2B6O5Q%3D%3D";
const apiKey = "uzgT2g7ltKt+8O/CqO8T3bHxBW8RYr8DAGORFnI3TW9v43lRBWmEjIbw+5SRUU4eDhaEgtTmgec3FMvAN+6O5Q=="; //인증키
const protocol = "https://";
const baseUrl = "apis.data.go.kr/B551011/KorService1"; // 베이스 유알엘 뒤에 / 붙여서 검색목록작성
const localSearch = "areaBasedList1"; // 지역기반 검색 . 뒤에 ?넣고 세부파라미터 작성
//let subUrl = "numOfRows=10&pageNo=1&MobileOS=Etc&MobileApp=Apptest&_type=json&contentTypeId=25"; // 나머지 검색 카테코리들
//const url = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=20&pageNo=1&MobileOS=Etc&MobileApp=Apptest&_type=json&contentTypeId=25&serviceKey=uzgT2g7ltKt%2B8O%2FCqO8T3bHxBW8RYr8DAGORFnI3TW9v43lRBWmEjIbw%2B5SRUU4eDhaEgtTmgec3FMvAN%2B6O5Q%3D%3D";
//const url = `https://${baseUrl}${localSearch}?${subUrl}&serviceKey=${apiKey2}`; // 템플릿 리터럴 + 표현삽입식. */

const altImage="https://velog.velcdn.com/images/heeyacjstk2/post/530246b7-61bc-467f-bacd-4a39178b69d8/image.png";

JSONData(1);
/* function loadpage(num){
	
} */
	
	

function setPageButtons(num) {
	const totalCount = 327;
	const limit = 12;
	let currentPage = num;
	const pageCount = 8;
	let pageGroup = Math.ceil(currentPage / pageCount); // 몇번째그룹인지알려줌!
	let totalPage = Math.ceil(totalCount / limit);
	let lastNumber = pageGroup * pageCount;
	if (lastNumber > totalPage) {
		  lastNumber = totalPage
		};
	let firstNumber = lastNumber - (pageCount - 1);
	const next = lastNumber + 1;
	const prev = firstNumber - 1;
	
	if(num>pageCount){
		//btnparent.appendChild(`<button class="prev-button" onclick="JSONData((firstNumber-1)">PREV</button>`)
		var newButton = document.createElement('button');
		var btnparent = document.getElementsByClassName('number-button-wrapper')[0];
		newButton.setAttribute("class","prev-button");
		newButton.setAttribute("onclick",`JSONData(${'${firstNumber-1}'})`);
		newButton.innerHTML="PREV";
		btnparent.appendChild(newButton);
	}
	  for (let i = firstNumber; i <= lastNumber; i++) {
		console.log(i);
		var newButton = document.createElement('button');
		var btnparent = document.getElementsByClassName('number-button-wrapper')[0];
	  	newButton.setAttribute("class","pageNumber");
	  	newButton.setAttribute("onclick",`JSONData(${'${i}'})`);
	  	newButton.setAttribute("id","page_"+i);
	    newButton.innerHTML=i;
	  	btnparent.appendChild(newButton);
	  }
	if(lastNumber<totalPage){
		//btnparent.appendChild(`<button class="next-button" onclick="JSONData(${lastNumber+1})">NEXT</button>`)
		var newButton = document.createElement('button');
		var btnparent = document.getElementsByClassName('number-button-wrapper')[0];
		newButton.setAttribute("class","next-button");
		newButton.setAttribute("onclick",`JSONData(${'${lastNumber+1}'})`);
		newButton.innerHTML="NEXT";
		btnparent.appendChild(newButton);
	}
	};

	async function JSONData(num) {
		currentPage=num;
		$('.number-button-wrapper').empty();
		$('#root-div').empty();
		var subUrl = `numOfRows=12&pageNo=${'${num}'}&MobileOS=Etc&MobileApp=Apptest&_type=json&contentTypeId=25`;
		const url = `${'${protocol}'}${'${baseUrl}'}/${'${localSearch}'}?${'${subUrl}'}&serviceKey=${'${apiKey2}'}`; // 템플릿 리터럴 + 표현삽입식. */	
		setPageButtons(num);
        const response = await fetch(url);
        if (response.ok) {
            const jsonData = await response.json();
            console.log(jsonData);
            console.log(jsonData.response.body.items.item)
            var items = jsonData.response.body.items.item;
            console.log(items[0].title)
        } else {
            console.error("서버에서 JSON 형식의 응답이 아닙니다.");
        }
        const rootdiv = document.querySelector("#root-div");
         for (let i = 0; i < items.length; i++) {
        	 let title=items[i].title;
        	 let contentid=items[i].contentid;
        	 $('#root-div').append(
        			 `<a href="destinDetail?contentId=${'${items[i].contentid}'}" >
        			 <div class="destin-div">
                         <h2 class="destin-title">${'${i+1}'}.${'${title}'}</h2>
                         <img class="destin-img" src=${'${items[i].firstimage ? items[i].firstimage : altImage }'}>
                     </div></a>`
                 );
        }
    }
	$(document).ready(function () {
  		/* function pagebtn(num){
  			suburl = `numOfRows=10&pageNo=${num}&MobileOS=Etc&MobileApp=Apptest&_type=json&contentTypeId=25`;
  		} */
        async function JSONData() {
  			setPageButtons();
  			
            const response = await fetch(url);
            if (response.ok) {
                const jsonData = await response.json();
                console.log(jsonData);
                console.log(jsonData.response.body.items.item)
                var items = jsonData.response.body.items.item;
                console.log(items[0].title)
            } else {
                console.error("서버에서 JSON 형식의 응답이 아닙니다.");
            }
            const rootdiv = document.querySelector("#root-div");
             for (let i = 0; i < items.length; i++) {
            	 let title=items[i].title;
            	 let contentid=items[i].contentid;
            	 $('#root-div').append(
            			 `<a href="destinDetail?contentId=${'${items[i].contentid}'}" >
            			 <div class="destin-div">
                             <h2 class="destin-title">${'${i+1}'}.${'${title}'}</h2>
                             <img class="destin-img" src=${'${items[i].firstimage ? items[i].firstimage : altImage }'}>
                         </div></a>`
                     );
            }
        }
  		
        /* JSONData(); */
    });
	
</script>

</html>