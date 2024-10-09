<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<style>
    body {
        padding: 20px;
        font-family: Arial, sans-serif;
        background-color: #f4f6f9;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #ffffff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }
    th, td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #dee2e6;
        vertical-align: middle;
    }
    th {
        background-color: #f1f3f5;
        font-weight: bold;
    }
    td {
        background-color: #ffffff;
    }
    .orderStatusSelect {
        width: 100%;
        padding: 5px;
        border: 1px solid #ced4da;
        border-radius: 4px;
        text-align: center;
    }
    .updateStatusBtn {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .updateStatusBtn:hover {
        background-color: #0056b3;
    }
    h1 a {
        text-decoration: none;
        color: #333333;
    }
    h1 a:hover {
        color: #007bff;
    }
</style>
</head>
<body>
    <div>
        <h1 class="font-weight-bold"><a href="/main-view" class="text-dark">강남스타일</a></h1>
    </div>

   <table class="table text-center">
      <thead>
         <tr>
            <th>번호</th>
            <th>주문일자</th>
            <th>주문번호</th>
            <th>주문내역</th>
            <th>회원 id</th>
            <th>받는 사람</th>
            <th>연락처</th>
            <th>배송지 주소</th>
            <th>배송상태</th>
            <th>배송수정</th>
         </tr>
      </thead>

      <tbody>
         <c:forEach var="order" items="${orderList}">
            <tr>
               <td>${order.orderIndex}</td>
               <td><fmt:formatDate value="${order.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
               <td>${order.orderNumber}</td>
               <td>${order.orderDetailsString}</td>
               <td>${order.userLoginId}</td>
               <td>${order.recipientName}</td>
               <td>${order.recipientPhone}</td>
               <td>${order.recipientAddress}</td>
               <td><select class="form-control orderStatusSelect" data-order-number="${order.orderNumber}">
                     <c:choose>
                        <%-- 현재 상태가 주문 완료일 경우 --%>
                        <c:when test="${order.clothStatus == '주문 완료'}">
                           <option value="주문 완료" selected>주문 완료</option>
                           <option value="배송중">배송중</option>
                           <option value="배송 완료">배송 완료</option>
                        </c:when>
                        <%-- 현재 상태가 배송중일 경우 --%>
                        <c:when test="${order.clothStatus == '배송중'}">
                           <option value="주문 완료">주문 완료</option>
                           <option value="배송중" selected>배송중</option>
                           <option value="배송 완료">배송 완료</option>
                        </c:when>
                        <%-- 현재 상태가 배송 완료일 경우 --%>
                        <c:when test="${order.clothStatus == '배송 완료'}">
                           <option value="주문 완료">주문 완료</option>
                           <option value="배송중">배송중</option>
                           <option value="배송 완료" selected>배송 완료</option>
                        </c:when>
                     </c:choose>
               </select></td>
               <td>
                  <button type="button" class="btn btn-success updateStatusBtn">수정하기</button>
               </td>
            </tr>
         </c:forEach>
      </tbody>
   </table>

   <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    
    <script>
    $(document).ready(function() {
        // 수정하기 버튼 클릭 시
        $(".updateStatusBtn").on("click", function() {
            let orderNumber = $(this).closest('tr').find('.orderStatusSelect').data("order-number");
            let newStatus = $(this).closest('tr').find('.orderStatusSelect').val();
            
            $.ajax({
                type: "PUT",
                url: "/change/status",
                data: {
                    "orderNumber": orderNumber,
                    "status": newStatus
                },
                success: function(data) {
                    if (data.result == "success") {
                        alert("배송상태 수정 완료");
                        location.reload();
                    } else {
                        alert("배송상태 수정 실패");
                    }
                },
                error: function() {
                    alert("수정 에러");
                }
            });
        });
    });
    </script>
</body>
</html>