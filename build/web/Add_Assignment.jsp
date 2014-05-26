<!-- 
	Created By Mayank Gupta 
		Page Name:-	Teacher_MS_Add_Assignment.jsp	-->
			
<!-- Add New Assignment SQL database command to store Assignment Data into the database-->
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%try{ 
		if(session.getAttribute("Teacher_Id")==null)
		{
			response.sendRedirect("Login.jsp"); //if user not login goto Login.jsp Page
		}
		else
		{
 %>
 <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Assignment</title>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
	int teacher_id=(Integer)session.getAttribute("Teacher_Id");
	int chapter_id=(Integer)session.getAttribute("chapter");
	int assignment_id=(Integer)session.getAttribute("Assi_Id");
	String file=(String)session.getAttribute("file");
	PreparedStatement ps=con.prepareStatement("insert into Chapter_Assignment values(?,?,?)");
	ps.setString(1, null);
	ps.setInt(2, teacher_id);
	ps.setInt(3, chapter_id);
	ps.executeUpdate();
	
	if(file.equals("File"))
	{
		String file_name=(String)session.getAttribute("File_Name");
	
		PreparedStatement ps1=con.prepareStatement("insert into Create_Assignment(Assignment_Id,File_Name,Assignment_Type) values(?,?,?)");
		ps1.setInt(1, assignment_id);
		ps1.setString(2, file_name);
		ps1.setString(3, file);
		ps1.executeUpdate();
		%>
		<script type="text/javascript">
			alert("Add Assignment Successful");
			//if user select file then goto Main.jsp page after upload file and save into the database 
			window.open("Display_Assi.jsp?f1=<%=session.getAttribute("subject")%>","_self");
		</script>
		<%
	}
	if(file.equals("Enter"))
	{
		PreparedStatement ps1=con.prepareStatement("insert into Create_Assignment(Assignment_Id,File_Name,Assignment_Type) values(?,?,?)");
		ps1.setInt(1, assignment_id);
		ps1.setString(2, "Entered");
		ps1.setString(3, "Enter");
		ps1.executeUpdate();
		%>
		<script type="text/javascript">
			//if user select file then goto Main.jsp page after upload file and save into the database 
			window.open("Assi_Questions.jsp","_parent");
		</script>
		<%
	}
%>
</body>
</html>
<%	}
	}
	catch(Exception e)
	{
		System.out.println(e);
		//if Exception occur then goto error.jsp page
                System.out.println("Error in Add_Asssignment");
		//response.sendRedirect("error.jsp");
	}
%>