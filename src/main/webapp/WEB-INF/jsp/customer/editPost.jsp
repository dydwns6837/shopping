<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 수정</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>글 수정</h1>
        <form action="/customer/edit/${post.id}" method="post">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control" name="title" value="${post.title}" required>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" name="content" rows="5" required>${post.content}</textarea>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" name="isAdminPost" ${post.isAdminPost ? 'checked' : ''}>
                <label class="form-check-label" for="isAdminPost">관리자 공지 여부</label>
            </div>
            <button type="submit" class="btn btn-success">저장</button>
            <a href="/customer/board" class="btn btn-secondary">취소</a>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>