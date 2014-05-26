<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_Delete_Chapter.jsp	-->
			
<!-- Delete Chapter from the database-->
<%try{ %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/final_teacher","root","");
		int chapter_id=Integer.parseInt(request.getParameter("f1"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Test</title>
</head>
<body>
<%
	
		PreparedStatement ps= con.prepareStatement("Delete from New_Chapter where Chapter_Id=?");
		ps.setInt(1, chapter_id);
		ps.executeUpdate();
		PreparedStatement ps1= con.prepareStatement("Delete from Chapter_added where Chapter_Id=?");
		ps1.setInt(1, chapter_id);
		ps1.executeUpdate();
		%>
		<script type="text/javascript">
			alert("Chapter successfully deleted");
				//if user Delete Particular Test questions then goto Display Chapter i.e Display_Chap.jsp
			window.open("Display_Chap.jsp","_self");
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