<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q2</title>
</head>
<body>
	<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	out.println("<h1>ID:"+id+"</h1>");
	out.println("<h1>Name:"+name+"</h1>");
	
	%>
	<form  action="q2.jsp" method="post">
	Enter empid:<input type="text" name="id"><br>
	Enter empname:<input type="text" name="name"><br>
	Enter mobilenumber:<input type="number"><br>
	gender:M<input type="radio">F<input type="radio"><br>
	email:<input type="email"><br>
	Date of birth:<input type="date"><br>
	Address:<input type="text"><br>
	country:<select name="country">
			<option>India</option>
			<option>USA</option>
			</select><br>
	Language:<input type="checkbox" name="lang">Odia<input type="checkbox" name="lang">Hindi<input type="checkbox" name="lang">English
	<br>
	submit:<input type="submit" size=60>
	</form>
</body>
</html>