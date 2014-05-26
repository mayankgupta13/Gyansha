<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_Delete_Test.jsp	-->
			
<!-- Delete Test and Test questions from the database-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%
    try
    {
	if(session.getAttribute("Teacher_Id")==null)
	{
		response.sendRedirect("Login.jsp"); //if teacher is not login then goto Login.jsp
	}
	else
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
		int Test_Id=Integer.parseInt(request.getParameter("f1"));
		int Question_Id=Integer.parseInt(request.getParameter("f3"));
		int chapter_id=Integer.parseInt(request.getParameter("f4"));
		String b1=request.getParameter("f2");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Test</title>
</head>
<body>
<%
	if(b1.equals("del"))
	{
		PreparedStatement ps4= con.prepareStatement("Delete from Test_Questions where Question_Id=?");
		ps4.setInt(1, Question_Id);
		ps4.executeUpdate();
		PreparedStatement ps5= con.prepareStatement("Delete from Test_Options where Question_Id=?");
		ps5.setInt(1, Question_Id);
		ps5.executeUpdate();
		%>
		<script type="text/javascript">
			alert("Question successfully deleted");
				//if user Delete Particular Test questions then goto Questions_Display.jsp after deletion from database
			window.open("Question_Display.jsp?f1=<%=Test_Id%>&f2=<%=chapter_id%>&f3=<%=session.getAttribute("subject")%>","_self");
		</script>
	<%
	}
	else
	{
		PreparedStatement ps= con.prepareStatement("Delete from Chapter_Test where Test_Id=?");
		ps.setInt(1, Test_Id);
		ps.executeUpdate();
		PreparedStatement ps3= con.prepareStatement("Delete from Create_Test where Test_Id=?");
		ps3.setInt(1, Test_Id);
		ps3.executeUpdate();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("SELECT Question_Id FROM TEST_QUESTIONS WHERE TEST_ID="+Test_Id);
		while(rs.next())
		{
			PreparedStatement ps1= con.prepareStatement("DELETE FROM Test_Options WHERE QUESTION_ID=?");
			ps1.setInt(1, rs.getInt(1));
			ps1.executeUpdate();
		}
		PreparedStatement ps2= con.prepareStatement("Delete from Test_Questions where Test_Id=?");
		ps2.setInt(1, Test_Id);
		ps2.executeUpdate();
		%>
		<script type="text/javascript">
			alert("Test successfully deleted");
				//if user Delete Test then goto Questions_Display.jsp after deletion from database
			window.open("Display_Test.jsp","_self");
		</script>
	<%}
%>

</body>
</html>
<%
	}}
catch(Exception e)
{
	System.out.println(e);
	//if exception occur goto error.jsp page
	response.sendRedirect("error.jsp");
}
%>