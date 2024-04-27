<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SELECT유니폼</title>
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

.marginb {
	margin-bottom: 1rem;
}

.height50 {
	height: 50rem;
}

.height16 {
	height: 16rem;
}
</style>
</head>
<body>
	<%@ include file="./include/top.jsp"%>
	<main>
		<section class="py-5">
			<form action="purchase" method="post">
				<div class="row gx-1 gx-lg-5 align-items-center">
					<input type="hidden" value="${product.pro_num }" name="pro_num" />
					<div class="col-md-6">
						<img class="card-img-top mb-2 mb-md-0 height50"
							src="download?filename=${files.pro_filename}" alt="..." />
					</div>
					<div class="col-md-6">
						<h1 class="display-5 fw-bolder">${product.pro_title}</h1>
						<div class="fs-5 mb-5">
							<span class="text-muted"><fmt:formatNumber
									value="${product.pro_price}" pattern="₩###,###" /></span> <input
								type="hidden" value="${product.pro_price }" id="price" />
						</div>

						<h4 class="fst-italic">재고 사이즈</h4>
						<div class="d-flex marginb">
							<div class="input-group input-group-lg">
								<span class="input-group-text">XL</span> <input type="text"
									class="form-control" aria-describedby="size" id="stock_xl"
									name="pro_xl" readonly value="${product.pro_xl}">
							</div>
							<div class="input-group input-group-lg margin">
								<span class="input-group-text">L</span> <input type="text"
									class="form-control" aria-describedby="size" id="stock_l"
									name="pro_l" readonly value="${product.pro_l}">
							</div>
							<div class="input-group input-group-lg margin">
								<span class="input-group-text">M</span> <input type="text"
									class="form-control" aria-describedby="size" id="stock_m"
									name="pro_m" readonly value="${product.pro_m}">
							</div>
							<div class="input-group input-group-lg margin">
								<span class="input-group-text">S</span> <input type="text"
									class="form-control" aria-describedby="size" id="stock_s"
									name="pro_s" readonly value="${product.pro_s}">
							</div>

						</div>
						<h4 class="fst-italic">구매 사이즈</h4>
						<div class="d-flex marginb">
							<div class="input-group input-group-lg ">
								<span class="input-group-text">XL</span> <input type="number"
									class="form-control" id="size_xl" aria-describedby="size"
									value="0">
							</div>
							<div class="input-group input-group-lg margin">
								<span class="input-group-text">L</span> <input type="number"
									class="form-control" id="size_l" aria-describedby="size"
									value="0">
							</div>
							<div class="input-group input-group-lg margin">
								<span class="input-group-text">M</span> <input type="number"
									class="form-control" id="size_m" aria-describedby="size"
									value="0">
							</div>
							<div class="input-group input-group-lg margin">
								<span class="input-group-text">S</span> <input type="number"
									class="form-control" id="size_s" aria-describedby="size"
									value="0">
							</div>
						</div>
						<c:if test="${user_id!=null }">
						<button class="btn btn-outline-dark flex-shrink-1" type="button"
							id="productadd">
							<i class="bi-cart-fill me-1"></i> Add to cart
						</button>
						</c:if>
						<c:if test="${user_id==null }">
						<a href="login">
						<button class="btn btn-outline-dark flex-shrink-1" type="button">
							<i class="bi-cart-fill me-1"></i> 로그인 후 사용해주세요
						</button>
						</a>
						</c:if>
					</div>
				</div>
				<div class="modal" id="exampleModal" tabindex="-1">
					<div class="modal-dialog">

						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Modal title</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>

							<div class="modal-body">
								<input type="hidden" value="${files.pro_filename}"
									name="pur_img" /> <input type="hidden"
									value="${product.pro_title}" name="pur_title" /> <input
									type="hidden" value="${product.pro_num}" name="pur_pronum" />
								<h4 class="fst-italic">${product.pro_title}</h4>
								<h4 class="fst-italic">사용자 : ${user_id}</h4>
								<input type="hidden" value="${user_id}" name="pur_id" />
								<h4 class="fst-italic">사이즈</h4>
								<div class="d-flex marginb">
									<div class="input-group input-group-sm">
										<span class="input-group-text">XL</span> <input type="number"
											class="form-control" id="read_xl" aria-describedby="size"
											readonly name="pur_xl">
									</div>
									<div class="input-group input-group-sm margin">
										<span class="input-group-text">L</span> <input type="number"
											class="form-control" id="read_l" aria-describedby="size"
											readonly name="pur_l">
									</div>
									<div class="input-group input-group-sm margin">
										<span class="input-group-text">M</span> <input type="number"
											class="form-control" id="read_m" aria-describedby="size"
											readonly name="pur_m">
									</div>
									<div class="input-group input-group-sm margin">
										<span class="input-group-text">S</span> <input type="number"
											class="form-control" id="read_s" aria-describedby="size"
											readonly name="pur_s">
									</div>
								</div>
								<div class="d-flex marginb">
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">주소</span>
										<input type="text" class="form-control"
											aria-label="Sizing example input"
											aria-describedby="inputGroup-sizing-default" name="pur_addr">
									</div>
								</div>
								<input type="hidden" id="hiddenprice" name="pur_price" />
								<h4 class="fst-italic" id="totalprice"></h4>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="submit" class="btn btn-primary" id="purchase">구매</button>
							</div>
						</div>

					</div>

				</div>
			</form>
		</section>
		<section class="py-5 bg-light">
			<div class="container px-4 px-lg-5 mt-4">
				<h2 class="fw-bolder mb-4">Related products</h2>
				<div class="slide">
					<c:forEach items="${productselect}" var="pro">
						<c:if test="${pro.pro_num!=product.pro_num }">
							<div class="s-object">
								<div class="col mb-5">
									<div class="card h-100">
										<c:forEach items="${filesselect}" var="file">
											<c:if
												test="${pro.pro_num==file.pro_num && product.pro_num != pro.pro_num }">
												<img class="card-img-top height16"
													src="download?filename=${file.pro_filename}" alt="..." />
											</c:if>
										</c:forEach>
										<div class="card-body p-4">
											<div class="text-center">
												<h5 class="fw-bolder">${pro.pro_title}</h5>
												<span class="text-muted"><fmt:formatNumber
														value="${pro.pro_price}" pattern="₩###,###" /></span>
											</div>
										</div>
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<a class="btn btn-outline-dark mt-auto"
													href="selectshop?pro_num=${pro.pro_num }">Add to cart</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</section>
	</main>
	<%@ include file="./include/footer.jsp"%>
	<script>
	const addbtn=document.getElementById("productadd");
	const xlarge=document.getElementById("size_xl");
	const large=document.getElementById("size_l");
	const medium=document.getElementById("size_m");
	const small=document.getElementById("size_s");
	const readxlarge=document.getElementById("read_xl");
	const readlarge=document.getElementById("read_l");
	const readmedium=document.getElementById("read_m");
	const readsmall=document.getElementById("read_s");
	const stockxlarge=parseInt(document.getElementById("stock_xl").value);
	const stocklarge=parseInt(document.getElementById("stock_l").value);
	const stockmedium=parseInt(document.getElementById("stock_m").value);
	const stocksmall=parseInt(document.getElementById("stock_s").value);
	const price=document.getElementById("price").value;
	const hiddenprice=document.getElementById("hiddenprice");
	const totalprice=document.getElementById("totalprice");
	const purbtn=document.getElementById("purchase");
	addbtn.addEventListener("click",sizevalue);
	purbtn.addEventListener("click",purchk);
	function purchk(){
		alert("구매완료");
	}
	function sizevalue(){
		if(stockxlarge<parseInt(xlarge.value) || stocklarge<parseInt(large.value) || stockmedium<parseInt(medium.value) || stocksmall<parseInt(small.value)){
			 alert("구매하려는 사이즈의 재고가 부족합니다.");
			 return;
		     
		}else{
			const numberFormat = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' });
			hiddenprice.value=parseInt(parseInt(xlarge.value)+parseInt(large.value)+parseInt(medium.value)+parseInt(small.value))*parseInt(price);
			const formatdPrice = numberFormat.format(hiddenprice.value);
			totalprice.innerText="Total Price "+" : "+formatdPrice;
			readxlarge.value=xlarge.value;
			readlarge.value=large.value;
			readmedium.value=medium.value;
			readsmall.value=small.value;
			const myModal = new bootstrap.Modal(document.getElementById("exampleModal"));
			myModal.show();
		}
		
	}
	
</script>
</body>
</html>