<!-- 
	Created By Mayank Gupta 
		Page Name:-	Teacher_MS_Add_Solution.jsp	-->
			
<!-- Add Assignment Solution SQL database command to store Data into the database-->
<%	try{  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Assignment</title>
</head>
<body>
<%	
	int id=(Integer)session.getAttribute("Teacher_Id");
	int id1=(Integer)session.getAttribute("Assi_Id");
	String sub=request.getParameter("flag");
	String file=(String)session.getAttribute("file");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment","root","");
	String type=request.getParameter("flag");
		PreparedStatement ps=con.prepareStatement("insert into Solutions values(?,?,?,?,?)");
		ps.setInt(1, id1);
		ps.setInt(2, id);
		ps.setString(3, sub);
		ps.setString(4, file);
		ps.setString(5, null);
		ps.executeUpdate();
		con.close();
%>
<script type="text/javascript">
<%session.invalidate();%>
//after insertion into the database goto Main.jsp
window.open("Main.jsp?f1=<%=session.getAttribute("subject")%>","_self");
</script>
</body>
</html>
<%}
	catch(Exception e)
	{
		System.out.println(e);
		//if exception occur goto error.jsp page
		response.sendRedirect("error.jsp");
	}
%>