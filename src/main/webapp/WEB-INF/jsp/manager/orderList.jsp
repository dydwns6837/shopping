
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div>
		<h1 class="font-weight-bold"><a href="/main-view" class="text-dark">강남스타일</a></h1>
	</div>
	
	<div id="wrap">
	
	<div class="my-3 d-flex justify-content-between">
		<button type="button" class="btn btn-outline-info" id="logoutBtn"><a href="/admin/logout" class="text-info">로그아웃</a></button>
		<button type="button" class="btn btn-outline-info" id="logoutBtn"><a href="/admin/add-product" class="text-info">상품 추가</a></button>
	</div>
	
	
	<table class="table text-center">
		<thead>
			<tr>
				<th>번호</th>
				<th>사용자 이름</th>
				<th>제품 이름</th>
				<th>사이즈</th>
				<th>제품 수량</th>
				<th>사용자 주소</th>
				<th>상태</th>
				<th>배송중</th>
				<th>배송완료</th>
			</tr>
		</thead>
			
		<tbody>
			<c:forEach var="list" items="${orderList }" varStatus="status">
			<c:if test="${list.clothStatus != '장바구니' }">
			<tr>
				<td>${status.count }</td>
				<td>${list.userName }</td>
				<td>${list.clothName }</td>
				<td>${list.clothSize }</td>
				<td>${list.clothCount }</td>
				<td>${list.userAddress }</td>
				<td>${list.clothStatus }</td>
				<td><button type="button" class="btn btn-warning onDeliverBtn" data-deliver-id="${list.id }">배송중</button></td>
				<td><button type="button" class="btn btn-success deliveredBtn" data-deliver-id="${list.id }">배송 완료</button></td>
			</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>
	</div>





	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
	
	
	
	
	
	<script>
		$(document).ready(function(){
			
			$(".onDeliverBtn").on("click",function(){
				let orderId = $(this).data("deliver-id");
				
				$.ajax({
					type:"put"
					, url:"/change/status/onDeliver"
					, data:{"id" : orderId}
					, success:function(data){
						if(data.result == "success"){
							alert("제품 배송중")
							location.reload();
						} else {
							alert("배송 실패");
						}
					}
					, error:function(){
						alert("배송 에러");
					}
				});
			});
			
			
			$(".deliveredBtn").on("click",function(){
				let orderId = $(this).data("deliver-id");
				
				$.ajax({
					type:"put"
					, url:"/change/status/delivered"
					, data:{"id" : orderId}
					, success:function(data){
						if(data.result == "success"){
							alert("배송 완료")
							location.reload();
						} else {
							alert("배송 실패");
						}
					}
					, error:function(){
						alert("배송 에러");
					}
					
				});
			});
			
			
		});
	
	
	</script>
	
	
</body>
</html>
