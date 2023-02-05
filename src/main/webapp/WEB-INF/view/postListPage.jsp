<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="container"><br/>
	<h3 id="font-h3">게시글 리스트</h3>
	
	<!-- 검색 영역 시작-->
	<form action="/postpage" class="form-inline d-flex justify-content-end" method="GET">
		<select name="field" id="field" class="form-control form-control-sm">
			<option value="title">제목</option>
			<option value="contents">내용</option>
		</select> 
		<input type="text" id="word" name="word" class="form-control form-control-sm"
			style="margin: 10px;"> 
		<input type="submit" class="btn btn-outline-info btn-sm" value="검색">
	</form>
	<!-- 검색 영역 끝 -->

	<!-- 테이블 영역 시작-->
	<table class="table table-hover">
	
	<caption>게시글 수: ${plist.totalElements}</caption> <!-- 게시글 수 -->
		<tr>
			<th>제목</th>
			<th>내용</th>
		</tr>
		<c:forEach items="${plist.content}" var="posts">
			<tr>
				<td><a href="/post/view/${posts.id}">${posts.title}</a></td>
				<td>${posts.contents}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 테이블 영역 끝 -->
	
	<!-- 페이징 영역 시작 -->
	<div class="text-xs-center">
		<ul class="pagination justify-content-center">
		
			<!-- 이전 -->
			<c:choose>
				<c:when test="${ulist.first}"></c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="/postpage/?field=${param.field}&word=${param.word}&page=0">처음</a></li>
					<li class="page-item"><a class="page-link" href="/postpage/?field=${param.field}&word=${param.word}&page=${plist.number-1}">&larr;</a></li>
				</c:otherwise>
			</c:choose>

			<!-- 페이지 그룹 -->
			<c:forEach begin="${startBlockPage}" end="${endBlockPage}" var="i">
				<c:choose>
					<c:when test="${plist.pageable.pageNumber+1 == i}">
						<li class="page-item disabled"><a class="page-link" href="/postpage/?field=${param.field}&word=${param.word}&page=${i-1}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/postpage/?field=${param.field}&word=${param.word}&page=${i-1}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음 -->
			<c:choose>
				<c:when test="${plist.last}"></c:when>
				<c:otherwise>
					<li class="page-item "><a class="page-link" href="/postpage/?field=${param.field}&word=${param.word}&page=${plist.number+1}">&rarr;</a></li>
					<li class="page-item "><a class="page-link" href="/postpage/?field=${param.field}&word=${param.word}&page=${plist.totalPages-1}">마지막</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<!-- 페이징 영역 끝 -->
</div>