<!-- 
	Created By Mayank Gupta 
		Page Name:-	Teacher_MS_Add_Questions.jsp	-->
			
<!-- Add New Questions into assignment SQL database command to store Data into the database-->
<%	try{  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@	page import="java.sql.*" %>
    <%
    	int number=1;	
   		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	int teacher_id=(Integer)session.getAttribute("Teacher_Id");
	int chapter_id=(Integer)session.getAttribute("chapter");
	int assignment_id=(Integer)session.getAttribute("Assi_Id");
	String assignment_name=request.getParameter("assignment_name");
	PreparedStatement ps=con.prepareStatement("insert into Chapter_Assignment values(?,?,?)");
	ps.setInt(1, assignment_id);
	ps.setInt(2, teacher_id);
	ps.setInt(3, chapter_id);
	ps.executeUpdate();
	
                PreparedStatement ps1=con.prepareStatement("insert into Create_Assignment(Assignment_Id,File_Name,Assignment_Type) values(?,?,?)");
		ps1.setInt(1, assignment_id);
		ps1.setString(2, assignment_name);
		ps1.setString(3, "Enter");
		ps1.executeUpdate();
                
               
			response.sendRedirect("Assi_Questions.jsp");
		

%>
</body>
</html>
<%}
    catch(Exception e)
    {
		System.out.println(e);
		//if exception occur goto error.jsp page
                System.out.println("Error in Add_Quistion.jsp");
		response.sendRedirect("error.jsp");
    }

%>