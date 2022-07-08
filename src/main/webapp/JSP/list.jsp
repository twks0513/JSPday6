<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="testBoard.TestDAO"></jsp:useBean>
	<c:set var="list" value="${dao.list() }"/>
	size : ${list.size() }
	<table border="1">
		<tr>
			<th>번호</th> <th>제목</th>
			<th>등록날짜</th> <th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${list.size() ==0}">
				<tr>
					<th colspan="4">데이터없음</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.num }</td> <td>${dto.title }</td>
						<td>${dto.pdate }</td> <td>${dto.count }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4">
				<input type="button" value="글 등록" onclick="location.href='regForm.jsp'">
			</td>
		</tr>
	</table>
</body>
</html>