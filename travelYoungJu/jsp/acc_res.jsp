<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	article{
		width:100%;
	}
	section{
		margin-top:2%;
		margin-left:5%;
		text-align:center;
		width:90%;
		
	}
	table{
	text-align:center;
	 width:100%;
	 border: solid 1px;
	}
	table td{
	text-align:center;
	border-bottom: solid 1px;
	}

	.res_img{
		width:100%;
	}
	.user{
		margin-bottom:10%;
	}
	
</style>
</head>
<body>
<%@ include file="./include/top.jsp" %>
<article>
	<section>
	<form action="reservation_clear" method="get">
		<table id="res_table">
			<tr>
				<th style="box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.4);">
				<input type="hidden" name="res_img_addr" value="${reservation.res_img_addr }">
				<img src="${reservation.res_img_addr }" class="res_img"></th>
				<td>
				<input type="hidden" name="res_id" value="${user_id }">
				<p style="font-size: 20px;">사용자ID :${user_id }</p>
				<div class="user">
				<span style="font-size: 20px;">시작일  </span>
				<input type="date" class="date_input" name="res_start">
				</div>
				<div class="user">
				<span style="font-size: 20px;">종료일  </span>
				<input type="date" class="date_input" name="res_end">
				</div>
				<div class="user">
				<button type="submit" class="btn btn-danger" style="font-size: 20px;">예약하기</button>
				</div>
				</td>
			</tr>
			<tr>
				<th colspan="2">
				<input type="hidden" name="res_title" value="${reservation.res_title }">
				<p>숙소명 :${reservation.res_title }</p></th>
				
			</tr>
			<tr>
				<th colspan="2">
				<input type="hidden" name="res_addr" value="${reservation.res_addr }">
				<p>주소 :${reservation.res_addr }</p></th>
			</tr>
			<tr>
				<th colspan="2">
				<input type="hidden" name="res_price" value="${reservation.res_price }">
				<p>가격 :${reservation.res_price }</p></th>
			</tr>
		</table>
		</form>
	</section>
</article>
</body>
</html>