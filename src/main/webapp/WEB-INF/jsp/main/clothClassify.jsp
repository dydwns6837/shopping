<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section>
	<div>
		<div
			class="d-flex justify-content-center align-items-end product-text mt-2">
			<h4>our products</h4>
		</div>
		<div class="product-list d-flex flex-wrap">
			<c:forEach var="cloth" items="${clothList }">
				<a href="/main/clothes-detail?id=${cloth.clothId }"
					class="text-dark">
					<div class="products mt-3">
						<img src="${cloth.clothImageUrl }" width="100%">
						<div class="my-1 ml-1">${cloth.clothName }</div>
						<div style="font-size: 12px" class="ml-1">₩${cloth.clothPrice }</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</section>
