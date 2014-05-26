<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_abc.jsp	-->
			
<!-- Update Edited Assignment Question into the database -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
 <jsp:useBean id="c" class="com.MyConnection" scope="session"></jsp:useBean>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
</head>
<body>
    <%
        
 	int assignment_Id=Integer.parseInt(request.getParameter("f1"));
        int question_Id=Integer.parseInt(request.getParameter("f2"));
        String chapter_id=request.getParameter("f3");
try{
      
	Connection con = c.getConnection();
	
        
	PreparedStatement ps=con.prepareStatement("Delete from Assignment_Questions where Question_Id=? and Assignment_Id=?");
	ps.setInt(1, question_Id);
        ps.setInt(2, assignment_Id);
	ps.executeUpdate();
        
	PreparedStatement ps1=con.prepareStatement("Delete from Assignment_Options where Questions_Id=?");
	ps.setInt(1, question_Id);

        con.close();
		//After updation go to Question_Display.jsp Page
       %>
       <script type="text/javascript">
           alert('Question Deletetd');
           window.open("View_Assignment.jsp?f1=<%=assignment_Id %>&f2=<%=chapter_id%>","_self")
           </script>
       
       <%
	
	}
	catch(Exception e)
	{
		System.out.println(e);
		//Exception occur then goto the error.jsp page
		response.sendRedirect("error.jsp");
	}
		
%>
</body>
</html>
<%	
%>