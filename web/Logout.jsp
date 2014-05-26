<!-- 
	Created By Mayank Gupta 
		Page Name:-	Teacher_MS_Logout.jsp	-->
			
<!-- Logout Page -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GyanSha</title>

</head>
<body>
<script type="text/javascript">
alert("Logout Successfully");
<%session.invalidate();%>

	//When logout then goto Login page i.e Login.jsp
location.replace("Login.jsp");
</script>
</body>
</html>
