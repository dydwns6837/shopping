<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<!-- 배너 영역 -->
<section>
	<section class="banner">
		<img src="/static/img/banner.jpg" alt="배너이미지">
	</section>
	
	<!-- 상품 영역 -->
	<section class="contents">
		<h2 class="pt-2">Best Seller</h2>
	
		<!-- 상품 목록 -->
		<div class="d-flex justify-content-between">
			<article>
				<img src="/static/img/outer1.jpg" alt="아우터1" width="200">
				<div class="font-weight-bold">블루종(cream)</div>
				<div class="text-secondary">
					<del>87,000원</del>
				</div>
				<div>80,000원</div>
			</article>
			<article>
				<img src="/static/img/top1.jpg" alt="상의1" width="200">
				<div class="font-weight-bold">후드티</div>
				<div class="text-secondary">
					<del>50,000원</del>
				</div>
				<div>45,000원</div>
			</article>
			<article>
				<img src="/static/img/pants1.jpg" alt="하의1" width="200">
				<div class="font-weight-bold">와이드 데님 팬츠_그레이</div>
				<div class="text-secondary">
					<del>50,000원</del>
				</div>
				<div>45,000원</div>
			</article>
			<article>
				<img src="/static/img/shoes1.jpg" alt="신발1" width="200">
				<div class="font-weight-bold">아이보리 스웨이드 슈즈</div>
				<div class="text-secondary">130,000원</div>
			</article>
			<article>
				<img src="/static/img/acc1.jpg" alt="악세서리1" width="200">
				<div class="font-weight-bold">팔찌</div>
				<div class="text-secondary">
					<del>30,000원</del>
				</div>
				<div>25,000원</div>
			</article>
		</div>
	</section>
</section>