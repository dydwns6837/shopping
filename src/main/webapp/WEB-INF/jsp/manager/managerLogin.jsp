
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager Login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="d-flex justify-content-center">
			<div id="login-form" class="text-center mt-5">
				<div class="my-5">
					<h1>관리자 로그인</h1>
				</div>
				<form id="loginForm">
					<input type="text" class="form-control my-3" placeholder="id" id="logInId">
					<input type="password" class="form-control mb-3" placeholder="password" id="logInPw">
					<button type="submit" class="btn btn-info btn-lg my-3" id="logInBtn">로그인</button>
				</form>
				<hr>
				<div class="mt-5">
				<a href="/admin/join">회원가입</a>&nbsp;또는&nbsp;<a href="/main-view">메인 페이지로</a>
				</div>
				<div class="my-3">
					<a href="/user/sign-in-view">고객 로그인</a>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
		
		
	<script>
		$(document).ready(function(){
			
			
			$("#loginForm").on("submit",function(e){
				
				e.preventDefault();
				
				id = $("#logInId").val();
				pw = $("#logInPw").val();
				
				if(id == ""){
					alert("아이디를 입력하세요");
					return;
				}
				
				if(pw == ""){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/admin/login"
					, data:{"loginId":id, "loginPw":pw}
					, success:function(data){
						console.log(data);
						
						if(data.result == "success"){
							alert("로그인 성공 관리자 페이지로 이동합니다.");
							location.href="/main-view";
						} else {
							alert("아이디 또는 비밀번호를 확인하세요.");
						}
					}
					, error:function(){
						alert("로그인 에러");
					}
					
					
				});
				
			});
			
			
		});
	

	</script>
</body>
</html>
