<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SELECT커뮤니티</title>
<style>
main {
	display: flex;
	justify-content: center;
	align-items: center;
}

.form-control {
	margin-bottom: 1rem;
}

.right {
	display: flex;
	justify-content: flex-end;
}

.marginb {
	margin-bottom: 1rem;
}

.input-text {
	width: 40rem;
	border-radius: 0.5rem;
	border: solid 1px rgb(221, 221, 221);
}

.input-file {
	font-size: 17px;
	width: 30rem;
	border-radius: 0.5rem;
	border: solid 1px rgb(221, 221, 221);
	display: inline;
}

#second {
	display: none;
}

#first {
	display: block;
}

.heigth {
	width: 50rem;
	height: 30rem;
}
</style>
</head>
<body>
	<%@ include file="./include/top.jsp"%>
	<main>
		<div class="col-lg-8">
			<article class="center">

				<section class="mb-5 section1" id="first">
					<header class="mb-4">
						<h1 class="fw-bolder mb-1">${community.com_title }</h1>
						<div class="text-muted fst-italic mb-2" style="margin-top: 1rem">작성자 : ${community.com_id}</div>
					</header>
					<c:if test="${communityfile.com_filename!='이미지가없습니다'}">
					<img class="heigth" src="communityfile?filename=${communityfile.com_filename }" alt="..." />
					</c:if>
					<p class="fs-5 mb-4">${community.com_text }</p>
					<c:choose>
						<c:when test="${user_id==community.com_id }">
							<div class="right">
								<a class="btn btn-outline-dark" href="clubcommunity">목록</a> <a class="btn btn-outline-dark" href="" style="margin-left: 1rem;" id="modify">수정</a> <a class="btn btn-outline-dark" href="communitydelete?com_num=${community.com_num }" style="margin-left: 1rem;">삭제</a>
							</div>
						</c:when>
						<c:when test="${user_id=='admin' }">
							<a class="btn btn-outline-dark" href="clubcommunity">목록</a>
							<a class="btn btn-outline-dark" href="communitydelete?com_num=${community.com_num }" style="margin-left: 1rem;">삭제</a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-outline-dark" href="clubcommunity">목록</a>
						</c:otherwise>
					</c:choose>
				</section>
				<section id="second">
					<form action="communitymodify" method="post" enctype="multipart/form-data">
						<h1 class="display-5 fw-bolder d-flex">게시글 수정</h1>
						<div class="d-flex marginb">
							<div class="input-group input-group-lg">
								<img id="image" class="heigth" src="communityfile?filename=${communityfile.com_filename }" alt="..." />
							</div>
						</div>
						<input type="hidden" value="${community.com_num }" name="com_num" id="communitynum"> 
						<input type="hidden" value="${communityfile.com_filename }" name="previousimage"> 
						<input type="hidden" value="${user_id }" name="com_id" id="userid">
						<div class="d-flex marginb">
							<div class="input-group input-group-lg">
								<span class="input-group-text">제목</span> <input type="text" class="input-text" required name="com_title">
							</div>
						</div>
						<div class="d-flex marginb">
							<div class="input-group input-group-lg">
								<span class="input-group-text">내용</span>
								<textarea class="input-text" rows="3" placeholder="Join the discussion and leave a comment!" name="com_text"> </textarea>
							</div>
						</div>
						<div class="d-flex marginb">
							<input type="file" class="btn btn-outline-dark input-file" name="file">
						</div>
						<button id="complete" class="btn btn-outline-dark flex-shrink-1" type="submit" style="margin-bottom: 1rem;">
							<i class="bi-cart-fill me-1">modify</i>
						</button>
						<button id="close" class="btn btn-outline-dark flex-shrink-1" type="button" style="margin-bottom: 1rem;">
							<i class="bi-cart-fill me-1">close</i>
						</button>
					</form>
				</section>
				<section class="mb-5">
					<div class="card bg-light">
						<div class="card-body">
							<div class="mb-4" style="border-bottom:solid 1px rgb(221, 220, 220);">
								<textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!" id="comment"> </textarea>
								<div class="right">
									<c:if test="${user_id!=null }">
										<a class="btn btn-outline-dark" id="commentbtn" href="" style="margin-bottom: 1rem;">작성</a>
									</c:if>
								</div>
							</div>
							<c:forEach items="${ comment}" var="cmm">
							<div class="d-flex mb-4 marginb">			
								<div class="ms-3" style="width: 80rem; border-bottom:solid 1px rgb(221, 220, 220); justify-content: center;">
									<div class="fw-bold">${cmm.com_id }</div>
									<p>${cmm.com_text }</p>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</section>
			</article>
		</div>
	</main>
	<%@ include file="./include/footer.jsp"%>
	<script>
	const combtn = document.getElementById("complete");
	const modbtn = document.getElementById("modify");
	const closebtn = document.getElementById("close");
	const firstsection = document.getElementById("first");
	const secondsection = document.getElementById("second");
	const fileInput = document.getElementById('file-input');
	const comment = document.getElementById('comment');
	const commentbtn = document.getElementById('commentbtn');
	const communitynum = document.getElementById('communitynum');
	const comid = document.getElementById("userid");
	commentbtn.addEventListener("click", function() {
		$.ajax({
		    type: 'get',
		    url: 'communitycomment',
		    data: {
		    	com_num : communitynum.value,
		    	com_id : comid.value,
		    	com_text : comment.value
		    	 
		      },
		    success: function(result){
		    	if(result==0){
		    	$('.d-flex mb-4').append(
		    			'<div class="ms-3" style="width: 80rem; border-bottom:solid 1px rgb(221, 220, 220); justify-content: center;">'+
		    			'<div class="fw-bold" >'+comid.value+'</div>'+
						'<p>'+comment.value+'</p>'+'</div>'
						
			      );
		    	}else{
		    		alter("댓글을 작성해주세요")
		    	}
		    	
		      }
		  });
	});
	combtn.addEventListener("click", function() {
		 if (fileInput.files.length === 0) {
	            
	            return false; 
	        }
	        return true; 

	});
	modbtn.addEventListener("click", function() {
			event.preventDefault(); 
	        firstsection.style.display = "none";
	        secondsection.style.display = "block";

	});
	closebtn.addEventListener("click", function() {
		event.preventDefault(); 
        firstsection.style.display = "block";
        secondsection.style.display = "none";

});
	document.querySelector('.input-file').addEventListener('change', function() {
	    const file = this.files[0]; 
	    const reader = new FileReader();
	    reader.readAsDataURL(file);
	    reader.onload = function(event) {
	        const image = document.getElementById('image');
	        image.src = event.target.result;
	    };

	});

	</script>
</body>
</html>