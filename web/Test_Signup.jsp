<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_Test_Signup.jsp	-->
			
<!-- Insertion of Test values into the database -->
<%try{ %>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test Sign Up</title>
</head>
<body>
<%			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
			String test_time=request.getParameter("test_time");
			String subject=request.getParameter("subject");
			String test_name=request.getParameter("test_name");
			int chapter_id=Integer.parseInt(request.getParameter("f1"));
			int section=Integer.parseInt(request.getParameter("section"));
			int test_id=Integer.parseInt(request.getParameter("test_id"));
			int teacher_id=(Integer)session.getAttribute("Teacher_Id");
			
			PreparedStatement ps=con.prepareStatement("INSERT INTO Chapter_Test VALUES(?,?,?)");
			ps.setInt(1, test_id);
			ps.setInt(2, chapter_id);
			ps.setInt(3, teacher_id);
			ps.executeUpdate();
			
			PreparedStatement ps1=con.prepareStatement("INSERT INTO Create_Test VALUES(?,?,?,?,?)");
			ps1.setInt(1, test_id);
			ps1.setString(2, test_name);
			ps1.setString(3, test_time);
			ps1.setInt(4, section);
			ps1.setString(5,null);
			ps1.executeUpdate();
			session.setAttribute("Test_Id", test_id);
			response.sendRedirect("Question_Id.jsp?f1="+test_id+"&f2="+chapter_id+"&f3="+subject); 
%>
</body>
</html>
<%
}
catch(Exception e)
{
	System.out.println(e);
	//if exception occur goto error.jsp page
	response.sendRedirect("error.jsp");
}
%>