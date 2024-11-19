<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String memId = (String) session.getAttribute("memId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1일 1문장 등록</title>
<%@include file="/include/boardDetail.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div style="margin-top: 20px;"></div>
	<div class="container">
		<div class="header">
			<h1>1일 1문장 쓰기 등록</h1>
		</div>
		<form action="<%=request.getContextPath()%>/sentence/insert.do"
			method="post" enctype="multipart/form-data">
			<div class="content">
				<div style="margin-top: 20px;"></div>
				<input type="hidden" name="memId" value=<%=memId%>>

				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="senTitle" value=""></td>
					</tr>
					<tr>
						<th>도서명</th>
						<td><input type="text" name="bookTitle" value=""></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="senContent"></textarea></td>
					</tr>
				</table>
				<div class="buttons">
					<button type="submit">글 등록</button>
					<a href="<%=request.getContextPath()%>/sentence/list.do"
						class="button">목록보기</a>
				</div>
		</form>
	</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>