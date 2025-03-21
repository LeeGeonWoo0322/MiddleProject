<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.book.vo.ReservVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ReservVO> revList = (List<ReservVO>) request.getAttribute("revList");
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg"); // 한번 사용한 데이터 삭제

//페이징
List<ReservVO> list = (List<ReservVO>) request.getAttribute("list");
int start = (int) request.getAttribute("start");
int startPage = (int) request.getAttribute("startPage");
int endPage = (int) request.getAttribute("endPage");
int totalPage = (int) request.getAttribute("totalPage");
int totalCount = (int) request.getAttribute("totalCount");
int currentPage = (int) request.getAttribute("currentPage");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<style>
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

body {
	display: flex;
	flex-direction: column;
}

.content-wrapper {
	flex: 1 0 auto;
	display: flex;
}

.main-content {
	flex: 1;
	padding: 20px;
}

.book-image {
	width: 100px;
	height: 150px;
	object-fit: cover;
}
.pagingButton {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
	margin-bottom: 10px;
	flex-direction: column;
	width: 100%;
}
</style>
</head>
<body>
	<!-- Header -->
	<%@include file="/include/header.jsp"%>
	<%--     <%@include file="/include/bookSidebar.jsp"%> --%>


	<div class="content-wrapper">
		<!-- Main Content -->
		<main class="main-content">
			<table class="table table-hover">
			
				<thead>
					<tr>
						<th>예약번호</th>
						<th>도서ID</th>
						<th>도서제목</th>
						<th>회원ID</th>
						<th>예약날짜</th>
						<th>대기순위</th>
					</tr>
				</thead>
				<tbody>
					<%
// 						int revsize = revList.size();
						int revsize = list.size();
					if (revsize > 0) {
// 						for (ReservVO rv : revList) {
						for (ReservVO rv : list) {
					%>
					<tr>
						<td><%=rv.getRevNo()%></td>
						<td><%=rv.getBookId()%></td>
						<td><%=rv.getBookName()%></td>
						<td><a href="<%=request.getContextPath()%>/member/detail.do?memId=<%=rv.getMemId()%>"><%=rv.getMemId()%></a></td>
						<td><%=rv.getRevDate()%></td>
						<td><%=rv.getWaitCount()%></td>
					</tr>
					<%
						} //for문
					} else {
					%>
					<tr>
						<td colspan="5">예약정보가 없습니다.</td>
					</tr>
					<%
						} //if문
					%>

				</tbody>
			</table>
			
			<!-- 페이징처리 -->
			<div class = "pagingButton">
		        <ul class="pagination" style="margin: 0;">
				<%
				for(int i=1 ; i <= totalPage; i++){
				%>
					  <li <% if(i==currentPage) {%> class="active" <% } else {}%>><a href="<%=request.getContextPath() %>/reserv/list.do?page=<%=i%>"><%=i %></a></li>
				<%		
				}
				%>
					</ul>
			</div>


		</main>
	</div>

	<!-- Footer -->
	<%@include file="/include/footer.jsp"%>

	<script>
		function adjustFooter() {
			var docHeight = document.documentElement.offsetHeight;
			var windowHeight = window.innerHeight;
			var footer = document.querySelector('footer');

			if (docHeight <= windowHeight) {
				footer.style.position = 'fixed';
				footer.style.bottom = '0';
				footer.style.width = '100%';
			} else {
				footer.style.position = 'static';
			}
		}

		window.addEventListener('load', adjustFooter);
		window.addEventListener('resize', adjustFooter);
	</script>
</body>
</html>