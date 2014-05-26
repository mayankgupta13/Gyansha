<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_Question_Id.jsp	-->
			
<!-- For getting Question Id for insertion in database when commit -->
<%try{ %>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test Sign Up</title>
</head>
<body>
<%
			int question_id=0,option_id=0;
			String test_id=request.getParameter("f1");
			String chapter_id=request.getParameter("f2");
			String subject=request.getParameter("f3");			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("SELECT Question_Id FROM Test_Questions ORDER BY Question_Id DESC LIMIT 1");
			while(rs.next())
			{
				question_id=rs.getInt(1);
			}
			ResultSet rss1=st.executeQuery("SELECT Option_Id FROM Test_Options ORDER BY Option_Id DESC LIMIT 1");
			while(rss1.next())
			{
				option_id=rss1.getInt(1);
			}
			option_id++;
			question_id++;
			response.sendRedirect("Question.jsp?f1="+test_id+"&f2="+chapter_id+"&f3="+subject+"&f4="+question_id+"&f5="+option_id); 
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