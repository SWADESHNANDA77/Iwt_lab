<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>q3</title>

</head>
<body>
	<form  action="q3.jsp" method="post">
	number:<input type="text" name="input">
	</form>
	<%
	String s=request.getParameter("input");
	long n=Long.parseLong(s);
	boolean isPrime=true;
	if(n==1){
		out.println("the number is composite");
	}
	else if(n<1){
		out.println("the number is not valid");}
	else{
		
		for(int i=2;i<n/2;i++){
			if(n%i==0){
				isPrime=false;
				break;
			}
		}
	}
	if(isPrime){
		out.println("the number is prime");
	}
	else
	{
		out.println("the number is composite");
	}
				
	%>
	

</body>
</html>