<%	try{  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String test_id=request.getParameter("f1");
	String chapter_id=request.getParameter("f2");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
	PreparedStatement ps=con.prepareStatement("INSERT INTO TEST_QUESTIONS SELECT * FROM TEMP_TEST_QUESTIONS");
	ps.executeUpdate();
	PreparedStatement ps1=con.prepareStatement("INSERT INTO TEST_OPTIONS SELECT * FROM TEMP_TEST_OPTIONS");
	ps1.executeUpdate();
	PreparedStatement ps2=con.prepareStatement("delete from temp_test_questions");
	ps2.executeUpdate();
	PreparedStatement ps3=con.prepareStatement("delete from temp_test_options");
	ps3.executeUpdate();
	
%>
<script type="text/javascript">
window.open("Question_Display.jsp?f1=<%=test_id%>&f2=<%=chapter_id%>","_self");
</script>
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