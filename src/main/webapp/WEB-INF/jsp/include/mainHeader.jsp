<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<!-- 검색 -->
<div class="col-3 d-flex align-items-end">
	<div class="input-group mb-2">
		<input type="text" class="form-control">
		<div class="input-group-append">
			<button class="btn btn-light" type="button">검색</button>
		</div>
	</div>
</div>

<!-- 로고 -->
<div class="col-5 d-flex justify-content-center">
	<div>
		<div class="display-4">강남 스타일</div>
		<div>강한 남자들의 패션몰</div>
	</div>
</div>
<!-- 로그인 -->
<nav class="top-menu col-4 d-flex align-items-end">
	<ul class="nav">
		<li class="nav-item">
			<!-- 로그인시 --> 
			<c:if test="${not empty userId}">
				<span class="nav-link text-dark">${userName}</span>
			</c:if> 
			<!-- 비로그인시 --> 
			<c:if test="${empty userId}">
				<a href="/user/sign-in-view" class="nav-link text-dark">로그인</a>
			</c:if>
		</li>
		<li class="nav-item">
			<c:if test="${not empty userId}">
				<a href="/user/sign-out" class="nav-link text-dark">로그아웃</a>
			</c:if> 
			<c:if test="${empty userId}">
				<a href="/user/sign-up-view" class="nav-link text-dark">회원가입</a>
			</c:if>
		</li>
		<li class="nav-item"><a href="#" class="nav-link text-dark">고객센터</a></li>
		<li class="nav-item"><a href="#" class="nav-link text-dark">장바구니</a></li>
	</ul>
</nav>