<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- 종류별 옷 보여지는곳 --%>

<section>
	<div>
		<div class="d-flex justify-content-center align-items-end mt-2">
			<h4>our products</h4>
		</div>
		<div class="d-flex flex-wrap justify-content-between mt-3">
			<c:forEach var="cloth" items="${clothList }">
				<a href="/main/clothes-detail?id=${cloth.clothId }"
					class="text-dark">
					<div>
						<img src="${cloth.clothImageUrl }" width="300">
						<div class="my-1 ml-1">${cloth.clothName }</div>
						<div style="font-size: 12px" class="ml-1">₩${cloth.clothPrice }</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</section>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

