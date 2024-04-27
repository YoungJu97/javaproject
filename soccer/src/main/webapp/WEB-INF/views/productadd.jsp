<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품등록</title>
<style>
.slide {
	overflow-x: scroll;
	white-space: nowrap;
	width: 100%;
}

.s-object {
	display: inline-block;
	width: 300px;
}

.margin {
	padding-left: 1rem;
}

.d-flex {
	margin-bottom: 1rem;
}

.input-text {
	width: 40rem;
	border-radius: 0.5rem;
	border: solid 1px rgb(221, 221, 221);
}

.input-text1 {
	width: 15rem;
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
</style>
</head>
<body>
	<%@ include file="./include/top.jsp"%>
	<main>
		<section class="py-5">
			<form action="registration" method="POST"
				encType="multipart/form-data">
				<div class="row gx-1 gx-lg-5 align-items-center">
					<div class="col-md-6">
						<img id="image" class="card-img-top mb-2 mb-md-0"
							src="<%=request.getContextPath()%>/resources/img/image.jpg"
							alt="..." />
					</div>
					<div class="col-md-6">
						<h1 class="display-5 fw-bolder d-flex">제품 등록(Product Add)</h1>
						<div class="d-flex">
							<div class="input-group input-group-lg">
								<span class="input-group-text">제품명(Product Name)</span> <input
									type="text" class="input-text" name="pro_title" required>
							</div>
						</div>

						<div class="d-flex">
							<div class="input-group input-group-lg">
								<span class="input-group-text">가격(Price)</span> <input
									type="number" class="input-text1" min="0" step="5000"
									name="pro_price" placeholder="가격을 입력하세요" required> <input
									type="hidden" name="pro_id" value="${user_id}">
							</div>
						</div>
						<h4 class="fst-italic">사이즈</h4>
						<div class="d-flex">
							<div class="input-group input-group-lg">
								<span class="input-group-text">XL</span> <input type="number"
									class="form-control" name="pro_xl" value="0">
							</div>
							<div class="input-group input-group-lg margin">
								<span class="input-group-text">L</span> <input type="number"
									class="form-control" name="pro_l" value="0">
							</div>
							<div class="input-group input-group-lg margin">
								<span class="input-group-text">M</span> <input type="number"
									class="form-control" name="pro_m" value="0">
							</div>
							<div class="input-group input-group-lg margin">
								<span class="input-group-text">S</span> <input type="number"
									class="form-control" name="pro_s" value="0">
							</div>
						</div>
						<div class="d-flex">
							<input type="file" class="btn btn-outline-dark input-file"
								name="pfile" required>
						</div>
						<button class="btn btn-outline-dark flex-shrink-1" type="submit">
							<i class="bi-cart-fill me-1">Add</i>

						</button>
					</div>
				</div>
			</form>
		</section>
	</main>
	<%@ include file="./include/footer.jsp"%>
<script>
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