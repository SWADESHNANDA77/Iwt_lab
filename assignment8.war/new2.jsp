<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<%
 Date date=new Date();
 %>
<body>
<h1>Today's Date!</h1>
<p>Today's date is <%= date %></p>
</body>
</html>