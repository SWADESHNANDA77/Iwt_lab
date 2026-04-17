<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		    // End the current session
		    session.invalidate();
		
		    // Redirect to login page
		    response.sendRedirect("login.jsp");
		%>
</body>
</html>