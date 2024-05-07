<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
	<div id="wrap">		
		<header class="d-flex">
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
                        <div class="display-4"> 강남 스타일</div>
                        <div>강한 남자들의 패션몰</div>
                    </div>
                </div>
                <!-- 로그인 -->
                <nav class="top-menu col-4 d-flex align-items-end">
                    <ul class="nav">
                        <li class="nav-item"><a href="/user/sign-in-view" class="nav-link text-dark">로그인</a></li>
                        <li class="nav-item"><a href="/user/sign-up-view" class="nav-link text-dark">회원가입</a></li>
                        <li class="nav-item"><a href="#" class="nav-link text-dark">고객센터</a></li>
                        <li class="nav-item"><a href="#" class="nav-link text-dark">장바구니</a></li>
                    </ul>
                </nav>
            </header>

            <!-- 중간 메뉴 -->
            <nav class="menu">
                <ul class="nav nav-fill">
                    <li class="nav-item"><a href="#" class="nav-link text-dark">Outer</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-dark">Top</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-dark">Bottom</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-dark">Shoes</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-dark">ACC</a></li>
                </ul>
            </nav>
            
            <!-- 배너 영역 -->
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
                        <div class="text-secondary"><del>87,000원</del></div>
                        <div>80,000원</div>
                    </article>
                    <article>
                        <img src="/static/img/top1.jpg" alt="상의1" width="200">
                        <div class="font-weight-bold">후드티</div>
                        <div class="text-secondary"><del>50,000원</del></div>
                        <div>45,000원</div>
                    </article>
                    <article>
                        <img src="/static/img/pants1.jpg" alt="하의1" width="200">
                        <div class="font-weight-bold">와이드 데님 팬츠_그레이</div>
                        <div class="text-secondary"><del>50,000원</del></div>
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
                        <div class="text-secondary"><del>30,000원</del></div>
                        <div>25,000원</div>
                    </article>
                </div>
            </section>

            <!-- footer -->
            <footer class="d-flex justify-content-center align-items-center">
                <div class="text-center text-secondary">
                    <div>회사: GangnamStyle 대표: 노일권 유용준</div>
                    <div>주소: 경기도 용인시 기흥구 강남로 40</div>
                    <div>사업자 번호: 10101010-1010101010</div>
                </div>
            </footer>
		</div>
	</div>
</body>
</html>


