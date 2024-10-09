<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Page</title>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
   integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
   crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<style>
.container {
   margin-top: 20px;
}

.order-summary, .order-form {
   margin-bottom: 40px;
}

.total-price {
   margin-top: 20px;
}
</style>
</head>
<header>
   <jsp:include page="../include/header.jsp" />
</header>
<body>

   <!-- jQuery -->
   <script type="text/javascript"
      src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <!-- iamport.payment.js -->
   <script type="text/javascript"
      src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

   <div class="container">
      <h2>주문 확인</h2>
      <!-- 주문 요약 섹션 -->
      <div class="order-summary">
         <h4 class="mt-4"></h4>
         <table class="table text-center">
            <thead>
               <tr>
                  <th>상품명</th>
                  <th>사이즈</th>
                  <th>가격</th>
                  <th>수량</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var="order" items="${orderList}">
                  <tr>
                     <td class="productName" data-name="${order.clothName}">${order.clothName}</td>
                     <td>${order.clothSize}</td>
                     <td>${order.clothPrice}</td>
                     <td>${order.clothCount}</td>
                     <c:set var="totalPrice"
                        value="${totalPrice + order.clothPrice * order.clothCount }" />
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>
      <!-- 총 결제 금액 -->
      <div class="text-right total-price">
         <h5>
            주문 합계: <span>${totalPrice} 원</span>
         </h5>
      </div>
      <!-- 주문 정보 입력 폼 -->
      <div class="order-form mt-5">
         <form id="orderForm" action="/order/orderCreate" method="post">
            
            <!-- 구매자 정보 섹션 -->
            <h2>구매자 정보</h2>
            <div class="form-check mb-4">
               <input type="checkbox" class="form-check-input" id="sameAsUserInfo">
               <label class="form-check-label" for="sameAsUserInfo">회원 정보와
                  동일</label>
                  
            </div>
            <!-- 이름 -->
            <div class="form-group mb-3">
               <label for="buyerName">이름</label> <input type="text"
                  class="form-control" id="buyerName" name="buyerName"
                  placeholder="ex)홍길동" required>
            </div>

            <!-- 전화번호 -->
            <div class="form-group mb-3">
               <label for="buyerPhone">전화번호</label> <input type="text"
                  class="form-control" id="buyerPhone" name="buyerPhone"
                  placeholder="ex)01012345678" required>
            </div>

            <!-- 이메일 -->
            <div class="form-group mb-4">
               <label for="buyerEmail">이메일</label> <input type="email"
                  class="form-control" id="buyerEmail" name="buyerEmail"
                  placeholder="example@example.com" required>
            </div>

            <!-- 배송지 정보 섹션 -->
            <h2>배송지 입력</h2>
            <div class="form-check mb-4">
               <input type="checkbox" class="form-check-input"
                  id="sameAsRecipientInfo"> <label class="form-check-label"
                  for="sameAsRecipientInfo">회원 정보와 동일</label>
            </div>
            <!-- 받으실 분 이름 -->
            <div class="form-group mb-3">
               <label for="recipientName">받으실 분</label> <input type="text"
                  class="form-control" id="recipientName" name="recipientName"
                  placeholder="ex)홍길동" required>
            </div>
            <!-- 받으실 분 전화번호 -->
            <div class="form-group mb-3">
               <label for="recipientPhone">전화번호 (받으실 분)</label> <input type="text"
                  class="form-control" id="recipientPhone" name="recipientPhone"
                  placeholder="ex)01012345678" required>
            </div>
            <!-- 주소 -->
            <div class="form-group mb-4">
               <label for="recipientAddress">주소</label> <input type="text"
                  class="form-control" id="recipientAddress" name="recipientAddress"
                  placeholder="ex)서울특별시 강남구..." required>
            </div>

            <!-- 결제 정보 섹션 -->
            <h2>결제 정보</h2>
            <div class="form-group my-3">
               <label for="paymentMethod">결제 수단</label> <select
                  class="form-control" id="paymentMethod" name="paymentMethod"
                  required>
                  <option value="">결제 수단을 선택하세요.</option>
                  <option value="card">신용카드</option>
                  <option value="trans">계좌이체</option>
                  <option value="kakaopay">카카오페이</option>
               </select>
            </div>

            <!-- 총 결제 금액 -->
            <div id="orderPrice" class="text-right total-price">
               <h5>
                  결제할 금액: <span>${totalPrice} 원</span>
               </h5>
            </div>

            <!-- 주문 버튼 -->
            <div class="form-group mt-4">
               <button type="button" class="btn btn-danger btn-block"
                  id="cancelOrderBtn">돌아가기</button>

               <button type="button" class="btn btn-success btn-block"
                  id="orderButton" onclick="requestPay()">결제하기</button>
            </div>
         </form>
      </div>
   </div>
   
   <!-- 포트원 결제 스크립트 -->
    <script>
        var IMP = window.IMP;
        IMP.init("imp37255548");
        
        // 서버에서 모델로 전달된 ids를 JavaScript 배열로 변환
        var ids = ${ids}; // IDs를 JSP에서 JavaScript 변수로 변환
        
        function requestPay() {
            // 폼 유효성 검사 확인
            var form = document.getElementById('orderForm');
            if (form.checkValidity() === false) {
                // 폼이 유효하지 않으면 결제 창을 띄우지 않음
                form.reportValidity(); // 브라우저가 기본 유효성 오류 메시지 표시
                return;
            }
            
            var buyerName = $("#buyerName").val(); // 구매자 이름
            var buyerEmail = $("#buyerEmail").val(); // 구매자 이메일
            var buyerPhone = $("#buyerPhone").val(); // 구매자 전화번호
            var buyerAddr = $("#recipientAddress").val(); // 배송지 주소 (배송지 정보가 아니라면 필요 없음)
            var paymethod = $("#paymentMethod").val(); // 결제 수단
            
            // 주문할 상품명 배열
            var productNames = [];
            $(".productName").each(function() {
                productNames.push($(this).data("name"));
            });
            // 상품명 배열을 문자열로 변환
            var productName = productNames.join(", ");
            
            var amount = ${totalPrice}; // 결제 금액

            IMP.request_pay({
                pg: "html5_inicis.INIpayTest",
                pay_method: paymethod,
                name: productName,
                amount: amount,
                buyer_email: buyerEmail,
                buyer_name: buyerName,
                buyer_tel: buyerPhone,
                buyer_addr: buyerAddr,
            }, function(rsp) {
                if (rsp.success) {
                    $.ajax({
                        type: 'POST',
                        url: '/order/' + rsp.imp_uid // 결제 검증 URL
                    }).done(function(data) {
                        if (rsp.paid_amount === data.response.amount) {
                            // 결제 검증 성공 후 주문 완료 요청
                            $.ajax({
                                type: 'PUT',
                                url: '/basket/orderComplete',
                                data: { "ids": ids }, // basket IDs 배열 전송
                            traditional: true, // 필요 시 사용
                                success: function(data) {
                                    if (data.result == "success") {
                                       $.ajax({
                                           type: "POST",
                                           url: "/order/orderCreate",
                                           data: {
                                               "ids": ids,
                                               "buyerName": $("#buyerName").val(),    // 구매자 이름
                                               "recipientName": $("#recipientName").val(), // 수령자 이름
                                               "recipientPhone": $("#recipientPhone").val(), // 수령자 전화번호
                                               "recipientAddress": $("#recipientAddress").val(), // 수령자 주소
                                               "paymentMethod": $("#paymentMethod").val() // 결제 방법
                                           },
                                           success: function(data) {
                                               if (data.result == "success") {
                                                   alert("주문 완료! 감사합니다.");
                                                   window.location.href = "/main-view";
                                               } else {
                                                   alert("주문 처리에 실패했습니다.");
                                               }
                                           },
                                           error: function() {
                                               alert("서버 오류가 발생했습니다.");
                                           }
                                       });
                                    } else {
                                        alert("결제 금액 불일치");
                                    }
                                },
                                error: function() {
                                    alert("주문 완료 요청 중 오류 발생");
                                }
                            });
                        } else {
                            alert("결제 금액 불일치");
                        }
                    }).fail(function() {
                        alert("결제 검증 요청 중 오류 발생");
                    });
                } else {
                    alert("결제 요청 실패: " + rsp.error_msg);
                }
            });
        }
    </script>
   
   <!-- JavaScript -->
   <script src="https://code.jquery.com/jquery-3.7.1.min.js"
      integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
      integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
      integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
      crossorigin="anonymous"></script>

   <script>
   $(document).ready(function() {
      // 사용자 정보 자동 입력
      $("#sameAsUserInfo").on("change", function() {
         if ($(this).is(":checked")) {
            // 사용자 정보로 구매자 정보 채우기
            $("#buyerName").val("${userName}");
            $("#buyerPhone").val("${userPhone}");
            $("#buyerEmail").val("${userEmail}");
         } else {
            // 체크 해제 시 구매자 정보 초기화
            $("#buyerName").val("");
            $("#buyerPhone").val("");
            $("#buyerEmail").val("");
         }
      });

      // 배송지 정보 자동 입력
      $("#sameAsRecipientInfo").on("change", function() {
         if ($(this).is(":checked")) {
            // 사용자 정보로 배송지 정보 채우기
            $("#recipientName").val("${userName}");
            $("#recipientPhone").val("${userPhone}");
            $("#recipientAddress").val("${userAddress}");
         } else {
            // 체크 해제 시 배송지 정보 초기화
            $("#recipientName").val("");
            $("#recipientPhone").val("");
            $("#recipientAddress").val("");
         }
      });

      // 주문 취소 버튼 클릭 시 페이지 이동
      $("#cancelOrderBtn").on("click", function() {
         alert("주문 취소 완료!");
          window.location.href = "/basket/list-view"; // 취소 후 이동할 페이지
      });

      // 로고 클릭 시 페이지 이동
      $("#logo").on("click", function(e) {
         alert("주문 취소 완료!");
          window.location.href = "/main-view"; // 이동할 페이지
      });
   });
   </script>


</body>
</html>
