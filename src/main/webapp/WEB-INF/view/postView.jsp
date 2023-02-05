<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
    <div class="container">
        <main class="loginMain">
            <section class="login">
                <article class="login__form__container">
                    <div class="login__form">
                        <div class="login__input">
                            <div>게시글 자세히 보기</div><br>
                            <h1>"${posts.title}"</h1>
                            <p>"${posts.contents}"</p>
                            <button><a href="/">확인</a></button></br>
                            <button><a href="javascript:remove(${posts.id})">삭제하기</a></button></br>
                            <button><a href="/post/update/${posts.id}">수정하기</a></button></br>

                        </div>
                    </div>
                </article>
            </section>
        </main>
    </div>
</body>
</html>
<script type="text/javascript" src="/js/post.js"></script>