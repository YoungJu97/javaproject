<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유니폼 샵</title>
<style>
.background{
   background-color: black;
   width: 100%;
   height: 22rem;
   margin-bottom: 1rem;
   display: flex;
  justify-content: center;
  align-items: center; 
    
  }
 .context{
 color: white;

 }
 .card-img-top{
 	height:20rem;
 }
 #pagebtn {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>
	<%@ include file="./include/top.jsp"%>
	<main>
	<div class="background">
	<div>
	<h1 class="display-1 fw-bolder context">CLUB SHOP</h1>
	</div>
	</div>
	 <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                	<c:forEach items="${product }" var="pro">	
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<c:forEach items="${files }" var="file">
                        	<c:if test="${pro.pro_num==file.pro_num }">
                            <img class="card-img-top" src="download?filename=${file.pro_filename}" alt="..." />
                            </c:if>
                            </c:forEach>
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">${pro.pro_title }</h5>
                                    <span class="text-muted"><fmt:formatNumber value="${pro.pro_price}" pattern="₩###,###" /></span>
                                   
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="selectshop?pro_num=${pro.pro_num }">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                     </c:forEach>                  
                </div>
                <div id="pagebtn">
					<c:if test="${page.prev}">
						<a href="clubshop?page=${page.startPage - 1}">
							<button class="btn btn-outline-dark" style="margin-left: 0.5rem;">Previous</button>
						</a>
					</c:if>

					<c:forEach var="pagenum" begin="${page.startPage}" end="${page.endPage}">
						<a href="clubshop?page=${pagenum}">
							<button class="btn btn-outline-dark" style="margin-left: 0.5rem;">${pagenum}</button>
						</a>
					</c:forEach>

					<c:if test="${page.next}">
						<a href="clubshop?page=${page.endPage + 1}">
							<button class="btn btn-outline-dark" style="margin-left: 0.5rem;">Next</button>
						</a>
					</c:if>
				</div>
                <c:if test="${user_id=='admin' }">
               <div><a class="btn btn-outline-dark" href="productadd">Product Add</a>
               </div>
             </c:if>
            </div>
        </section>
        </main>
	<%@ include file="./include/footer.jsp"%>
</body>
</html>