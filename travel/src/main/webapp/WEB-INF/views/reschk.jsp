<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <style>
      article{
        margin-top: 2%;
       width: 90%;
        margin-left: 4.5%;
       
       
      }
     
      #table{
        
        width: 70%;
        margin-left: 15%;
      }
      .table1{
        width: 100%; 
      }
      #titletr{
        height: 50px;
        border-bottom:solid 3px rgb(199, 199, 199) ;
       border-right:solid 1px rgb(224, 223, 223) ;
        background-color: black;
      }
      .tabletitle{
        font-size: 17px;
        border-left:solid 1px rgb(224, 223, 223) ;
        color: white;
        text-align: center;
      }
      .table2{
        border:solid 1px  rgb(199, 199, 199);
      }
      .tabletext{
        font-size: 15px;
        height: 40px;
        
        text-align: center;
      }
      
      
     
      footer{
        margin-top: 80px;
        background-color: rgb(243, 243, 243);
        text-align: center; 
        border: solid 1px  rgb(243, 243, 243);
      }
    
    </style>
  </head>
  <body>
   <%@ include file="./include/top.jsp" %>

      <article>
        <section id="table">         
        <table class="table1">
          <tr id="titletr">
            <th class="tabletitle" width="10%">예약번호</th>
            <th class="tabletitle" width="50%">숙소이름</th>
            <th class="tabletitle" width="10%">시작일</th>
            <th class="tabletitle" width="10%">종료일</th>
            <th class="tabletitle" width="10%">가격</th>
          </tr>
          <c:forEach items="${resvo }" var="resinfo">
          <tr class="table2">
            <td class="tabletext">${resinfo.res_num }</td>
            <td class="tabletext">${resinfo.res_title }</td>
            <td class="tabletext" >${resinfo.res_start }</td>
            <td class="tabletext" >${resinfo.res_end }</td>
            <td class="tabletext" >${resinfo.res_price }</td>
          </tr>
          </c:forEach>
        </table>
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
</html>
