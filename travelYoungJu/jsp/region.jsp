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
	width: 90%;
	margin-left:5.5%;
}

.table1 {
	width: 100%;
}

#titletr {
	height: 50px;
	border-bottom: solid 3px rgb(199, 199, 199);
	border-right: solid 1px rgb(224, 223, 223);
	background-color: black;
}

.tabletitle {
	font-size: 17px;
	border-left: solid 1px rgb(224, 223, 223);
	color: white;
	text-align: center;
}

.table2 {
	border: solid 1px rgb(199, 199, 199);
}

.tabletext {
	box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.3);
	font-size: 15px;
	font-weight:bolder;
	height: 40px;
	text-align: center;
}

#pagediv{
	margin-top : 1%;
	text-align: center;
}
.mapbtn{
	margin-bottom: 1%;
}

#map{
	width: 100%; 
	height: 400px; 
	display: block;
}
#range{
	display: none;
}


#mapinfo{
	width:300px;
	text-align: center;
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
			<h2>여행지</h2>
			<input type="hidden" value="${region }" id="hbtn">
<div class="mapbtn">
<button type="button" id="mapbtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  지도보기
</button>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal"   tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width :100%;">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <div id="map" ></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
			
			<table class="table1">
			</table>
			
			<div id="pagediv"></div>
<div style="padding:5px;" id="mapinfo"></div>
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
  let region=$('#hbtn').val();
  let currentPage= 1;
  let numOfRows=5;
  let totalcount=0;
  getpage(currentPage);
  function getpage(page){
  currentPage=page;	
  $('#table > table').empty();
  $('#pagediv').empty();
  $(document).ready(function(){
      $.ajax({
  type: 'GET',
  url: 're_travel',
  data: {
    numOfRows: numOfRows,
    pageNo: currentPage,
    MobileOS: 'ETC',
    MobileApp: 'appTest',
    keyword : region,
  },
    dataType : 'json',
    success: function(data){	
    console.log(data);
    let items = data.response.body.items.item;
    totalcount=data.response.body.totalCount;
    $('#exampleModal').on('shown.bs.modal', function () {
 	   map(items)
 	  });
    var totalNumOfrow=Math.ceil(totalcount/numOfRows);
    let pageGroup=Math.ceil(currentPage/numOfRows);
    let pagelastNumber=pageGroup*numOfRows;
    
    if(pagelastNumber>totalNumOfrow){
    	pagelastNumber=totalNumOfrow
    }   
    let pagefirstNumber=pagelastNumber-(numOfRows-1)
    const next = pagelastNumber + 1
	const prev = pageGroup - 1
	if(prev>0){
		$('#pagediv').append(		
			'<button class="btn btn-Light" onclick="getpage('+(pagefirstNumber-1)+')">prve</button>'
		);
    }
	for(var i=pagefirstNumber;i<=pagelastNumber;i++){
		$('#pagediv').append(
				'<button class="btn btn-Light" onclick="getpage('+(i)+')">'+(i)+'</button>'
		);
		
	}
	if(next<totalNumOfrow){
		$('#pagediv').append(
			'<button class="btn btn-Light" onclick="getpage('+(pagelastNumber+1)+')">next</button>'
		);
    }
	items.forEach(function(item) {
	let x = item.mapx;
	let y = item.mapy;
	let title = item.title;
	let firstImage = item.firstimage;
	let addr1 =item.addr1;
	if (firstImage == null || firstImage === '') {
        firstImage = '<%=request.getContextPath() %>/resources/img/noimg.png' // 기본 이미지 경로
    }
	$('#table > table').append(
          '<tr class="table2" width="100%">' +
          '<td class="tabletext" width="20%";>' + title + '</td>' +
          '<td class="tabletext" width="32%";><img src="' + firstImage + '" width="80%";></td>' +
          '<td class="tabletext" width="25%";>' + addr1 + '</td>' + 
          '<a href="reservation?res_title='+encodeURIComponent(title)+'&&res_addr='+encodeURIComponent(addr1)+
        		  '&&res_img_addr='+encodeURIComponent(firstImage)+'"><button type="button" class="btn btn-primary" >예약</button></a></td>'+

          '</tr>'
        );
	});
	},
	error: function(xhr, status, error){
	console.error("AJAX request failed:", status, error);
	}
	});
	});
  }

  function map(items){	  
	var container = document.getElementById('map');	
	var options = {
		center: new kakao.maps.LatLng(36.3085,127.8708),	
		level: 13
	};
	  var map = new kakao.maps.Map(container, options);
	  items.forEach(function(item){
			let x = item.mapx;
			let y = item.mapy;
		
		var markerPosition  = new kakao.maps.LatLng(y, x); 
		var marker= new kakao.maps.Marker({
			 position: markerPosition
		})
		
		
		marker.setMap(map);
		if (item.firstimage == null || item.firstimage === '') {
			item.firstimage = '<%=request.getContextPath() %>/resources/img/noimg.png' // 기본 이미지 경로
	    }
		var Content = '<div id="mapinfo"><img src="' + item.firstimage + '" width="50%";><p>'+item.title+'</p><p>'+item.addr1+'</p><p>'+item.tel+'</p></div>'
		var remove=true;
		
		
	
		var infowindow = new kakao.maps.InfoWindow({
		    content : Content,
		    removable : remove
		   
		})
		kakao.maps.event.addListener(marker, 'click', function() {
			
		      infowindow.open(map, marker);  
		});
	  })
  }
  </script>

</html>