<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 상세</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>게시글 상세</h1>
        <div class="card">
            <div class="card-header">
                <h2>${post.title}</h2>
            </div>
            <div class="card-body">
                <p>${post.content}</p>
            </div>
        </div>
        <a href="/customer/edit/${post.id}" class="btn btn-primary mt-3">수정</a>
        <form action="/customer/delete/${post.id}" method="post" class="mt-3">
            <button type="submit" class="btn btn-danger">삭제</button>
        </form>
        <a href="/customer/board" class="btn btn-secondary mt-3">목록으로 돌아가기</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>