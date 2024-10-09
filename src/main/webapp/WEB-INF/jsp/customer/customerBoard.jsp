<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객 게시판</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">고객 게시판</h1>
        <a href="/customer/create" class="btn btn-primary mb-3">새 글 작성</a>
        <ul class="list-group">
            <c:forEach var="post" items="${posts}">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <a href="/customer/post/${post.id}" class="flex-grow-1">${post.title}</a>
                    <form action="/customer/delete/${post.id}" method="post" style="display:inline;">
                        <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                    </form>
                </li>
            </c:forEach>
        </ul>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>