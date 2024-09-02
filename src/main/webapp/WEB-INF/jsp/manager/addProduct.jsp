<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add Product</title>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div>
		<h1 class="font-weight-bold"><a href="/main-view" class="text-dark">강남스타일</a></h1>
	</div>
	
	<div id="wrap" class="border border-dark">
		<div class="my-3 mx-1 d-flex justify-content-between">
			<button type="button" class="btn btn-outline-info" id="logoutBtn"><a href="/admin/logout" class="text-info">로그아웃</a></button>
			<button type="button" class="btn btn-outline-info" id="logoutBtn"><a href="/admin/show/orderList" class="text-info">주문 리스트 조회</a></button>
		</div>
		<section class="d-flex">
			
			
			<article class="main-contents ml-3">
				<h1 class="mt-3">상품 추가</h1>
				<!-- 상품 이미지 -->
				<div class="mx-3 mt-5">
					<div>
						<img src="https://image.msscdn.net/thumbnails/images/goods_img/20210826/2092852/2092852_17086532214128_big.jpg?" width="300">
					</div>
					<input type="file">					
				</div>
				<!-- 상품 이미지 -->

				<!-- 상품 정보 입력 칸 -->
				<div class="input-product-info mt-5 d-flex justify-content-between">
					<div>
						<div>
							<div class="d-flex jusfify-content-center align-items-center my-3">
								<input type="text" class="form-control mx-3" placeholder="상품명" id="product-name">	
								<input type="text" class="form-control mr-3" placeholder="가격" id="productPrice">					
								<div class="mr-3">
									<select class="selectpicker" data-width="200px" id="selectCategory">
								  		<option value="0" selected>분류 선택</option>
								  		<option value="1">아우터</option>
								  		<option value="2">상의</option>
								  		<option value="3">하의</option>
								  		<option value="4">신발</option>
								  		<option value="5">악세서리</option>
									</select>
								</div>
							</div>
							<div class="mb-3">
								<input type="text" class="form-control w-75 ml-3 mb-3" placeholder="상품 이미지 주소 // 나중에 파일 업로드로 대체" id="imagePath">
								<input type="text" class="form-control w-75 ml-3" placeholder="상품 상세 정보" id="productDetail">
							</div>
						</div>
					</div>
					<!-- 상품 정보 입력 칸 -->
					
					<!-- 사이즈별 수량 입력 칸 -->
					<div class="mt-1 mr-5">
						<div class="mr-5 mt-3">
						<div class="d-flex align-items-center justify-content-between mb-2">
							<label>XS</label>
							<input type="text" class="form-control input-size" id="countXS">
						</div>
						<div class="d-flex align-items-center justify-content-between mb-2">
							<label>S</label>
							<input type="text" class="form-control input-size" id="countS">
						</div>
						<div class="d-flex align-items-center justify-content-between mb-2">
							<label>M</label>
							<input type="text" class="form-control input-size" id="countM">
						</div>
						<div class="d-flex align-items-center justify-content-between mb-2">
							<label>L</label>
							<input type="text" class="form-control input-size" id="countL">
						</div>
						<div class="d-flex align-items-center justify-content-between mb-2">
							<label>XL</label>
							<input type="text" class="form-control input-size" id="countXL">
						</div>
					</div>
					</div>
					<!-- 사이즈별 수량 입력 칸 -->
				</div>
				
				<!-- 상품 추가 버튼 -->
				<div class="d-flex justify-content-end mt-4">
					<button type="button" class="btn btn-info btn-lg" id="addProductBtn">상품 추가</button>
				</div>
				<!-- 상품 추가 버튼 -->
				
			</article>
			
			
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>



	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
	
	
	<script>
		$(document).ready(function(){
			let selectCat = 0;
			
			
			$("#goBackBtn").on("click",function(){
				alert("goBackBtn");
			});
			$("#selectCategory").change(function(){
				let selectCategory = document.getElementById("selectCategory");
				let category = selectCategory.options[selectCategory.selectedIndex].value;				
				selectCat = category;
			});
			$("#addProductBtn").on("click",function(){
				
				let productName = $("#product-name").val();
				let clothPrice = $("#productPrice").val();
				let imagePath = $("#imagePath").val();
				let productDetail = $("#productDetail").val();
				let countXS = $("#countXS").val();
				let countS = $("#countS").val();
				let countM = $("#countM").val();
				let countL = $("#countL").val();
				let countXL = $("#countXL").val();
				
				if(productName == ""){
					alert("제품명을 입력하세요");
					return;
				}
				
				if(selectCat == 0){
					alert("제품 카테고리를 선택하세요");
					return;
				}
				
				if(imagePath == ""){
					alert("이미지파일을 선택하세요");
					return;
				}
				
				if(productDetail == ""){
					alert("제품 상세 정보를 입력하세요");
					return;
				}
				
				
				if(countXS == ""){
					countXS = 0;
				}
				if(countS == ""){
					countS = 0;
				}
				if(countM == ""){
					countM = 0;
				}
				if(countL == ""){
					countL = 0;
				}
				if(countXL == ""){
					countXL = 0;
				}
				
				
				
				$.ajax({
					type:"post"
					, url:"/admin/add-cloth"
					, data:{"clothName":productName
						, "clothPrice":clothPrice
						, "clothCategory":selectCat 
						, "clothImagePath":imagePath
						, "clothInfo":productDetail
						, "countXS":countXS, "countS":countS, "countM":countM, "countL":countL, "countXL":countXL }
					, success:function(data){
						if(data.result == "success"){
							alert("success");
						} else {
							alert("fail");
						}
					}
					, error:function(){
						alert("error");
					}
					
				});
						
			});
			
		});
	
	
	
	
		$(".selectpicker").selectpicker({
		});
		
		
		
	</script>
</body>
</html>