<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>
h2 {
	margin-top: 30px;
	font-weight: bolder;
}

article {
	position: relative;
	width: 89%;
	margin-left: 5.2%;
}

section {
	width: 100%;
}

table {
	width: 100%;
}

.tabletd {
	border-bottom: solid 1px rgb(255, 255, 255);
	background-color: rgb(225, 225, 225);
}

.tableth {
	text-align: center;
	border-bottom: solid 1px rgb(255, 255, 255);
	height: 50px;
	background-color: rgb(99, 99, 99);
	color: white;
}

.textbtn {
	font-size: 18px;
	background-color: rgb(0, 0, 0);
	color: white;
	border-radius: 8px;
	margin-top: 5%;
	width: 10%;
	margin-left: 2%;
}

#divbtn {
	text-align: right;
	padding: 1%;
}

.review {
	text-align: center;
	color: white;
	background-color: rgb(99, 99, 99);
}

.comment {
	margin-top: 10px;
	display: inline-block;
	width: 200px;
}

#commentdiv {
	padding-top: 1%;
	background-color: rgb(169, 169, 169);
}

.commentbtn {
	margin-bottom: 15px;
	font-size: 18px;
	width: 12%;
	color: white;
	background-color: black;
}

#cdiv {
	margin-left: 10px;
}

.comment_id {
	text-align: center;
	color: white;
	border-bottom: solid 1px white;
	background-color: rgb(99, 99, 99);
}

.comment_text {
	width: 90%;
	background-color: rgb(169, 169, 169);
	border-bottom: solid 1px white;
}

.detail_img {
	width: 30%;
}

#likeimg{
	width : 5%;
}
 #likeimg:hover{
 	width : 6%;
 }
#likeimg1{
	border-radius:10px;
 background-color: crimson;
	width : 5%;
	color:red;
}
 #likeimg1:hover{
 	width : 6%;
 }
</style>
</head>
<body>
<%@ include file="./include/top.jsp" %>
	<article>
		<section>
			<div>
				<h2>갤러리 상세보기</h2>
			</div>
			<c:if test="${gvo.userid==cookie_id  }">
			<div id="divbtn">
				<a href="gallery"><button class="textbtn">목록</button></a> 
				<a href="viewmod?gallery_num=${gvo.gallery_num }">
				<button class="textbtn">수정</button></a>
				<a href="textdel?gallery_num=${gvo.gallery_num }">
				<button class="textbtn">삭제</button></a>
			</div>
			</c:if>
			<c:if test="${gvo.userid!=cookie_id  }">
			<div id="divbtn">
				<a href="gallery"><button class="textbtn">목록</button></a> 
			</div>
			</c:if>
			<table>
				<tr>
					<th class="tableth">제목</th>
					<td class="tabletd" colspan="5">${gvo.gallery_title }</td>
				</tr>
				<tr>
					<th class="tableth">작성자</th>
					<td class="tabletd" style="width:30%;" >${gvo.userid }</td>
					<th class="tableth" >등록일</th>
					<td class="tabletd" style="width:30%;">${gvo.gallery_date }</td>
				</tr>
				<tr>
					<th class="tableth">지역</th>
					<td class="tabletd">${gvo.gallery_region}</td>
					<th class="tableth">조회수</th>
					<td class="tabletd">${gvo.gallery_cnt }</td>
				</tr>
				<tr>
					<th colspan="5" class="tableth">내용</th>
				</tr>
				<tr style="text-align: center;">
					<th colspan="4" style="font-size: 25px;" class="tabletd"><c:forEach
							items="${flist }" var="filename">
							<img src="download?filename=${filename.gallery_filename}"
								class="detail_img">
						</c:forEach></th>
				</tr>
				<tr>
					<th colspan="5" style="font-size: 25px;" class="tabletd">${gvo.gallery_text }</th>
					
				</tr>
				
				<tr style="text-align: center;">
					<th colspan="5" style="font-size: 25px;" class="tabletd" >
					<p id="good_num">${gvo.gallery_good }</p>
					<input type="image" src="<%=request.getContextPath()%>/resources/img/likebtn.png"
					 id="likeimg">
					</th>
				</tr>
				
				
			</table>
			
			<div id="reviewdiv">
				<table id="comment_table">
					<tr>
						<th class="comment_id" colspan="3"><h3>리뷰</h3></th>
					</tr>
					<c:forEach items="${gcmt }" var="glist">
					<tr id="table_tr">		
						<th class="comment_id" >${glist.comment_id }</th>
						<td class="comment_text"><p>${glist.comment_text }</p></td>
						
						
					</tr>
					</c:forEach>
				</table>
			</div>
			<div id="commentdiv">
				<div id="cdiv">
					<h2 style="font-size: 25px;" id="com_id">${user_id }</h2>
					<input type="hidden" value="${gvo.gallery_num}" class="number">
					<textarea name="commenttext" id="com_text" cols="145" rows="4"></textarea>
					<button class="commentbtn" onclick="comment()">작성</button>
				</div>
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
$(document).ready(function(){
	$('.commentbtn').click(function(){
		var commetid=$('#com_id').text()
		var commenttext=$('#com_text').val()
		var commentnum=$('.number').val()
	$.ajax({
		async : true,    
		type:'POST',
		data : JSON.stringify(    
			{ 
				comment_num : commentnum,
				comment_text : commenttext,
				comment_id : commetid
			}	
		),					
		url : 'insertcomment',
		dataType: 'json',
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data==0){
				 alert("등록")	
			}
		},
	});
});
	$('#likeimg').click(function(){
		var goodnum=$('.number').val()
		var good=$('#good_num').text()
	$.ajax({
		async : true,    
		type:'POST',
		data : JSON.stringify(    
			{ 	
				gallery_num : goodnum,
				gallery_good : good
			}	
		),					
		url : 'updategood',
		dataType: 'json',
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#good_num').html(data)
			
		},
	});
});
});

    function comment(){
    let cid=document.getElementById('com_id').textContent
    let ctext=document.getElementById('com_text').value
    let newtr=document.createElement('tr');
      let newth=document.createElement('th');
      newth.innerText=cid;
      newth.className='comment_id';
      let newtd=document.createElement('td');
      newtd.innerText=ctext;
      newtd.className='comment_text';
      newtr.appendChild(newth);
      newtr.appendChild(newtd);
      let newtable=document.querySelector('#comment_table');
      newtable.appendChild(newtr);
      
    }
</script>
</html>