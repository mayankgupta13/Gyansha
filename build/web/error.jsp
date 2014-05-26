<!-- 
	Created By Mayank Gupta 
		Page Name:-	Teacher_MS_error.jsp	-->
			
<!-- Error Page --> 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error</title>
<style type="text/css">
body{
	background-color: "#afafaf";
	background: url("img/error.jpg");
	background-repeat: no-repeat;
}
a
{
	color: White;
}
</style>
</head>
<body>
<div>
		<!-- Onclick goto Home page i.e Main.jsp -->
	<a href="Main.jsp?f1=<%=session.getAttribute("subject") %>" target="_Parent">Go to Homepage</a>
</div>
</body>
</html>