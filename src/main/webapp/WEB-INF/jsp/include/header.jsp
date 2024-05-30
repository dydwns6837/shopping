<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="h-100 mx-4 d-flex justify-content-between align-items-center">
	<%-- logo --%>
	<div>
		<h1 class="font-weight-bold"><a href="/main-view" class="text-dark">강남스타일</a></h1>
	</div>

	<%-- login 정보 --%>
	<div>
		
		<%-- 비로그인 시 --%>
		<c:if test="${empty userId}">
			<a href="/user/sign-in-view">로그인</a>
		</c:if>
	</div>
</div>