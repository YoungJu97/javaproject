<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EPL&ISC</title>
<style>
 .background{
   background-color: black;
   width: 100%;
   height: 22rem;
   margin-bottom: 1rem;
   text-align:center; 
  }
 .context{
 color: white;
 }
  .table{
 	text-align: center;
 	font-size: 1.5rem;
 	
  }
  .table td{
  vertical-align: middle;
  }
  .logo{
  	width: 2.5rem;
  }

</style>
</head>
<body>
<%@ include file="./include/top.jsp"%>
<main>
	<div class="background">
	<div>
	<h1 class="display-1 fw-bolder context">EPL&ISC</h1>
	</div>
	<div>
	<h2 class="display-4 fw-bolder context">England Premier League</h2>
	<h2 class="display-4 fw-bolder context">⚽</h2>
	<h2 class="display-4 fw-bolder context">Information | Shop | Community</h2>
	</div>
	</div>
  <div class="row mb-2">
  <h4 class="fst-italic">Youtube</h4>
  </div>

  <div class="row g-5">
    <div class="col-md-8">
      <article class="blog-post">
      <h4 class="fst-italic">클럽 순위</h4>
        <table class="table">
        	 <thead>
                   	<tr>
                   	<th>순위</th>
                   	  <th>팀</th>
                   	 <th>승점</th>
                   	 <th>경기</th>
                      <th>승</th>
                     <th>무</th>
                     <th>패</th>
                     <th>득실차</th>
                   </tr>
                 </thead>
              	<tbody class="rank">
              </tbody>
         	</table>
      </article>
      
    </div>

    <div class="col-md-4">
      <div class="position-sticky" style="top: 2rem;">


        <div>
          <h4 class="fst-italic">최근 경기</h4>
          <ul class="list-unstyled">
            <table class="table">
                 <thead>
                   	<tr>
                   	  <th>DAY</th>
                      <th>HOME</th>
                     <th>SCORE</th>
                     <th>AWAY</th>
                   </tr>
                 </thead>
              	<tbody class="score">
              </tbody>
         	</table>
          </ul>
        </div>
      </div>
    </div>
  </div>

</main>
	<%@ include file="./include/footer.jsp"%>
	<script>
	$(document).ready(function(){
		 $.ajax({
			    type: 'GET',
			    url: 'rank',
   
			    success: function(result){
			    	const ranks = result.response[0].league.standings[0];
			      ranks.forEach(rankInfo => {
			    	        const rank = rankInfo.rank;
			    	        const logo = rankInfo.team.logo;
			    	        const point = rankInfo.points;
			    	        const goaldiff = rankInfo.goalsDiff;
			    	        const played = rankInfo.all.played;
			    	        const win = rankInfo.all.win;
			    	        const draw = rankInfo.all.draw;
			    	        const lose = rankInfo.all.lose;
			    	        $('.rank').append(
			    	            '<tr>' +
			    	            '<td class="font">' + rank + '</td>' +
			    	            '<td>' + '<img src="' + logo + '" class="logo">' + '</td>' +
			    	            '<td class="font">' + point + '</td>' +
			    	            '<td class="font">' + played + '</td>' +
			    	            '<td class="font">' + win + '</td>' +
			    	            '<td class="font">' + draw + '</td>' +
			    	            '<td class="font">' + lose + '</td>' +
			    	            '<td class="font">' + goaldiff + '</td>' +
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
		    url: 'game',
		    
		    success: function(result){
		      const teams = result.response;
		      teams.forEach(teamInfo => {
		    	  	const day = teamInfo.fixture.date.split('T')[0];
			        const team = teamInfo.teams;
			        const homelogo = team.home.logo;
			        const homename = team.home.name;
			        const awaylogo = team.away.logo;
			        const awayname = team.away.name;
			        const score=teamInfo.score;
			        const homescore=score.fulltime.home;
			        const awayscore=score.fulltime.away;
			        $('.score').append(
			         '<tr>'+
			         '<td>'+day+'</td>'+
				      '<td>'+'<img src="'+homelogo+'" class="logo">'+'</td>'+
				      '<td class="font">'+homescore+'-'+awayscore+'</td>'+
				      '<td>'+'<img src="'+awaylogo+'" class="logo">'+'</td>'+
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
			    url: 'youtube',
			    data: {
			        q: 'epl'
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
		
		});
	</script>
    </body>
</html>
