<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클럽정보</title>
<style>
.background {
	background-color: black;
	width: 100%;
	height: 22rem;
	margin-bottom: 1rem;
	text-align: center;
	vertical-align: middle;
	display: flex;
	justify-content: center;
	align-items: center;
}

.context {
	color: white;
}

.card-body {
	background-color: black;
}

.card-text {
	color: white;
}
</style>
</head>
<body>
	<%@ include file="./include/top.jsp"%>
	<main>
		<div class="album py-0 bg-body-tertiary">
			<div class="background">
				<div>
					<h1 class="display-1 fw-bolder context">CLUB INFORMATION</h1>
				</div>
			</div>
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3"></div>
		</div>
	</main>
	<%@ include file="./include/footer.jsp"%>
	<script>
$(document).ready(function(){
	  $.ajax({
	    type: 'GET',
	    url: 'api',
	    
	    success: function(result){
	    	console.log(result);
	      const teams = result.response;
	      teams.forEach(teamInfo => {
	        const team = teamInfo.team;
	        const teamId = team.id;
	        const teamName = team.name;
	        const teamLogo = team.logo;
	        console.log(team.id);
	        $('.row.row-cols-1.row-cols-sm-2.row-cols-md-4.g-3').append(
	          '<input type="hidden" value='+teamId+'>'+
	          '<div class="col">'+
	          '<div class="card shadow-sm">'+
	          '<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="'+teamLogo+'">'+
	          '<div class="card-body">'+
	          '<p class="card-text">'+teamName+'</p>'+
	          '<div class="d-flex justify-content-between align-items-center">'+
	          '<div class="btn-group">'+
	          '<a href="selectclub?teamId='+teamId+'"><button type="button" class="btn btn-sm btn-outline-secondary">View</button></a>'+
	          '</div>'+
	          '</div>'+
	          '</div>'+
	          '</div>'+
	          '</div>'
	        );
	      });
	    },
	    error: function(jqXHR, textStatus, errorThrown){
            console.error("AJAX 오류 발생:", textStatus, errorThrown);
	    }
	  });
	  
	});
	 
	
</script>
</body>
</html>