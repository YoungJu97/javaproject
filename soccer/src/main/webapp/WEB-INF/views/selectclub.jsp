<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SELECT클럽</title>
<style>
.background{
   background-color: black;
   width: 100%;
   height: 22rem;
   margin-bottom: 1rem;

  }
 table{
 font-size: 20px;
 text-align: center;
 }
.image{
	width: 5rem;
}
 .table td{
  vertical-align: middle;
  }
</style>
</head>
	
<body>
<input type="hidden" value="${num}" id="team">
<%@ include file="./include/top.jsp"%>
     		<main>
        	<div class="background">
			<div>
				<div class="teamname">
                            </div>
                              <table class="table">
                 				<thead>
                   				 <tr>
                   				 	<th>LOGO</th>
                      				<th>TOTAL</th>
                      				<th>WIN</th>
                     				<th>DRAW</th>
                     				<th>LOSE</th>
                  				 </tr>
                 			   </thead>
                 			  	<tbody class="score">
                  				</tbody>
                				</table>				
			</div>
			</div>    
            <article class="blog-post">
             <div class="row mb-2">
    		  <h4 class="fst-italic">Youtube</h4>
  				</div>
                <h2 class="display-5 link-body-emphasis mb-1">선수정보</h2>
                <table class="table">
                  <thead>
                    <tr>
                      <th>사진</th>
                      <th>이름</th>
                      <th>나이</th>
                      <th>포지션</th>
                      <th>국적</th>
                    </tr>
                  </thead>
                  <tbody class="playerinfo">
                   
                  </tbody>
                </table>
              </article>
	<%@ include file="./include/footer.jsp"%>
	</main>
	<script >
	const teamid =document.getElementById("team").value;
	$(document).ready(function(){
		  $.ajax({
		    type: 'GET',
		    url: 'player',
		    data: {
		    	 team: teamid
		      },
		    success: function(result){
		
		      const players = result.response;
		      players.forEach(playerInfo => {
		        const player = playerInfo.player;
		        const photo = player.photo;
		        const name = player.name;
		        const nation = player.nationality;
		        const age = player.age;
		        const position=playerInfo.statistics[0].games.position;
		        const teamLogo = team.logo;
		        $('.playerinfo').append(
		        	'<tr>'+
		               '<td>'+'<img src="'+photo+'" class="image">'+'</td>'+
		               '<td class="size">'+name+'</td>'+
		               '<td class="size">'+age+'</td>'+
		               '<td class="size">'+position+'</td>'+
		               '<td class="size">'+nation+'</td>'+
		             '</tr>'
		        );
		      });
		    },
		    error: function(jqXHR, textStatus, errorThrown){
	            console.error("AJAX 오류 발생:", textStatus, errorThrown);
		    }
		  });
		  $.ajax({
			    type: 'GET',
			    url: 'score',
			    data: {
			    	 team: teamid
			     },
			    success: function(result){
			      	const teams = result.response;
			        const teamName = teams.team.name;
			        const teamLogo = teams.team.logo;
			        const record =teams.fixtures;
			        const total = record.played.total;
			        const win = record.wins.total;
			        const draw = record.draws.total;
			        const lose = record.loses.total;
			        console.log(teamName);
			        $('.teamname').append(
			        		'<h1 class="display-5 fw-bolder text-white mb-2">'+teamName+'</h1>'
				       );
			        $('.score').append(
				        	'<tr>'+
				        	'<td>'+'<img class="img-fluid rounded-3 my-1" src="'+teamLogo+'">'+'</td>'+
				        	   '<td>'+total+'</td>'+
				               '<td>'+win+'</td>'+
				               '<td>'+draw+'</td>'+
				               '<td>'+lose+'</td>'+
				             '</tr>'
				        );	     
				       $.ajax({
						    type: 'GET',
						    url: 'youtube',
						    data: {
						        q: teamName
						    },
						    
						    success: function(result) {
						        console.log(result.items);
						        const items = result.items;
						        
						        items.forEach(itemInfo =>{
						        	const videoId = itemInfo.id.videoId;
						        	
						        	   $('.row.mb-2').append(
							                    '<div class="col-md-6">' +
							                    '<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">' +
							                    '<iframe width="700rem" height="450" src="https://www.youtube.com/embed/' + videoId + '" frameborder="0" allowfullscreen></iframe></div></div>'
							                );
						        });	  
						      
						    },
						    error: function(jqXHR, textStatus, errorThrown) {
						        console.error("AJAX 오류 발생:", textStatus, errorThrown);
						    }
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