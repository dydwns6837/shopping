<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Us</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="d-flex justify-content-center">
			<!-- input form -->
			<div class="input-form my-5">
				<h1 class="text-center mb-3">관리자 회원가입</h1>
				<div class="d-flex justify-content-between align-items-start">	
					<input type="text" class="form-control col-8 mb-3" placeholder="id" id="identifier">
					<button type="button" class="btn btn-info" id="checkDup">중복확인</button>
				</div>
				<div class="d-flex justify-content-center align-items-start">
					<div class="small text-danger d-none mb-3" id="dupId">중복된 아이디 입니다.</div>
					<div class="small text-success d-none mb-3" id="possId">사용 가능한 아이디 입니다.</div>
				</div>
				<input type="password" class="form-control mb-3" placeholder="관리자 인증번호" id="managerPw"> 
				<input type="password" class="form-control mb-3" placeholder="password" id="password">
				<input type="password" class="form-control mb-3" placeholder="check-password" id="checkPassword">
				<input type="text" class="form-control mb-3" placeholder="name" id="name">
				<button type="button" class="btn btn-success col-12" id="joinBtn">회원가입</button>
				
				<div class="text-center pt-5">
					<a href="/admin/login">로그인</a>&nbsp;또는&nbsp;<a href="/main-view">메인 페이지로</a>
				</div>
				<div class="my-3 text-center">
					<a href="/user/sign-up-view">고객 회원가입</a>
				</div>
			</div>
			<!-- /input form -->
		</section>	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
<script>
	$(document).ready(function(){
		
		var isDupId = true; // 중복된 아이디인지 체크
		
		var isDupCheck = false; // 아이디 중복확인 검사 여부
		
		// 아이디 입력창에 변경이 생겼다면
		$("#identifier").on("input",function(){
			isDupId = true;
			isDupCheck = false;
			
			$("#dupId").addClass("d-none");
			$("#possId").addClass("d-none");
		});
		
		$("#checkDup").on("click",function(){
			let id = $("#identifier").val();
			
			if(id ==""){
				alert("Id를 입력하세요");
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/admin/duplicate-id"
				, data:{"loginId":id}
				, success:function(data){
						isDupCheck = true; // 아이디 중복 확인 여부를 참으로 만들어주기
						if(data.isDuplicateId){ // 만약 아이디가 중복아이디라면
							isDupId = true;
							$("#dupId").removeClass("d-none");
							$("#possId").addClass("d-none");
						} else { // 아이디가 사용 가능한 아이디라면
							isDupId = false;
							$("#dupId").addClass("d-none");
							$("#possId").removeClass("d-none");			
						}
					}
				, error:function(){
					alert("중복확인 에러");
				}
			});
		});

		
		$("#joinBtn").on("click",function(){
			
			let id = $("#identifier").val();
			let managerPw = $("#managerPw").val();
			let pw = $("#password").val();
			let checkPw = $("#checkPassword").val();
			let name = $("#name").val();
			
			if(id == null){
				alert("아이디를 입력하세요!");
				return;
			}
			if(managerPw != "dydwnsMall"){
				alert("매니저 인증번호를 확인하세요!");
				return;
			}
			if(!isDupCheck){
				alert("id 중복 확인을 해주세요");
				return;
			}
			if(pw ==""){
				alert("비밀번호를 입력하세요!");
				return;
			}
			if(pw != checkPw){
				alert("비밀번호를 확인하세요!");
				return;
			}
			if(name ==""){
				alert("이름을 입력하세요!");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/admin/join"
				, data:{"loginId":id, "password":pw, "managerName":name}
				, success:function(data){
					console.log(data);
					
					if(data.result == "success"){
						alert("회원가입 성공! 메인 페이지로 이동합니다");
						location.href="/admin-main-view"
					} else {
						alert("회원가입 실패.");
					}
				}
				,error:function(){
					alert("error");
				}
			});
		});
		
		
	});

</script>
	

</body>
</html>