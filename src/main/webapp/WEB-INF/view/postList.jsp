<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
</head>

<style>

    .layout {
        width : 500px;
        margin : 0 auto;
        margin-top : 40px;
    }

</style>

<body>
    <div class="container">
        <main class="loginMain">
            <section class="login">
                <article class="login__form__container">
                    <div class="login__form">
                         <table class="login__input">
                                    <thead>
                                        <tr>
                                            <th>제목</th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th>내용</th>
                                            <a href="/postForm"><b>글쓰기</b></a></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                            <td><c:forEach items="${posts}" var="posts">
                                                <tr>
                                                    <td><a href="/post/view/${posts.id}"><c:out value="${posts.title}"/></a></td>
                                                    <td><c:out value="${posts.contents}"/></td>
                                                </tr>
                                            </c:forEach></td>
                                    </tbody>
                                </table>
                    </div>
                </article>
            </section>
        </main>
    </div>
</body>
</html>
<script type="text/javascript" src="/js/post.js"></script>