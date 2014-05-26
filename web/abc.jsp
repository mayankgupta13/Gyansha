<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_abc.jsp	-->
			
<!-- Update Edited Test Question into the database -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
    <%String checkbox1=null,checkbox2=null,checkbox3=null,checkbox4=null;
 	String chapter_id=request.getParameter("f2");
 	int T_Id=Integer.parseInt(request.getParameter("f1"));
	try{ Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
	int option_id1=Integer.parseInt(request.getParameter("option_id1"));
	int option_id2=Integer.parseInt(request.getParameter("option_id2"));
	int option_id3=Integer.parseInt(request.getParameter("option_id3"));
	int option_id4=Integer.parseInt(request.getParameter("option_id4"));
	int question_id=Integer.parseInt(request.getParameter("question_id"));
	String question=request.getParameter("question");
	String option1=request.getParameter("option1");
	String option2=request.getParameter("option2");
	String option3=request.getParameter("option3");
	String option4=request.getParameter("option4");
	String question_type=request.getParameter("question_type");
	int section=Integer.parseInt(request.getParameter("section"));
	
	checkbox1=request.getParameter("checkbox1");
	checkbox2=request.getParameter("checkbox2");
	checkbox3=request.getParameter("checkbox3");
	checkbox4=request.getParameter("checkbox4");
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
</head>
<body>
<%
	PreparedStatement ps=con.prepareStatement("update Test_Questions set Test_Questions=? where Question_Id=?;");
	ps.setString(1, question);
	ps.setInt(2, question_id);
	ps.executeUpdate();
		//options 1
		PreparedStatement ps1=con.prepareStatement("update Test_Options set Test_Options=? where Option_Id=?;");
		ps1.setString(1, option1);
		ps1.setInt(2, option_id1);
		ps1.executeUpdate();
		//options 2
		PreparedStatement ps2=con.prepareStatement("update Test_Options set Test_Options=? where Option_Id=?;");
		ps2.setString(1, option2);
		ps2.setInt(2, option_id2);
		ps2.executeUpdate();
		//options 3
		PreparedStatement ps3=con.prepareStatement("update Test_Options set Test_Options=? where Option_Id=?;");
		ps3.setString(1, option3);
		ps3.setInt(2, option_id3);
		ps3.executeUpdate();
		//options 4
		PreparedStatement ps4=con.prepareStatement("update Test_Options set Test_Options=? where Option_Id=?;");
		ps4.setString(1, option4);
		ps4.setInt(2, option_id4);
		ps4.executeUpdate();
		
		//option 1 answer
		PreparedStatement ps5=con.prepareStatement("update Test_Options set Correct_Ans=? where Option_Id=?;");
		if(checkbox1!=null)
			ps5.setBoolean(1, true);
		else
			ps5.setBoolean(1, false);
		ps5.setInt(2, option_id1);
		ps5.executeUpdate();

		//option 2 answer
		PreparedStatement ps6=con.prepareStatement("update Test_Options set Correct_Ans=? where Option_Id=?;");
		if(checkbox2!=null)
			ps6.setBoolean(1, true);
		else
			ps6.setBoolean(1, false);
		ps6.setInt(2, option_id2);
		ps6.executeUpdate();
		
		//option 3 answer
		PreparedStatement ps7=con.prepareStatement("update Test_Options set Correct_Ans=? where Option_Id=?;");
		if(checkbox3!=null)
			ps7.setBoolean(1, true);
		else
			ps7.setBoolean(1, false);
		ps7.setInt(2, option_id3);
		ps7.executeUpdate();
		
		//option 4 answer
		PreparedStatement ps8=con.prepareStatement("update Test_Options set Correct_Ans=? where Option_Id=?;");
		if(checkbox4!=null)
			ps8.setBoolean(1, true);
		else
			ps8.setBoolean(1, false);
				
		ps8.setInt(2, option_id4);
		ps8.executeUpdate();
		
		//Update Section
		PreparedStatement ps9=con.prepareStatement("update Test_Questions set Question_type=? where Question_Id=?;");
		ps9.setString(1, question_type);
		ps9.setInt(2, question_id);
		ps9.executeUpdate();
		
		//Update Question_type
		PreparedStatement p=con.prepareStatement("update Test_Questions set Section_No=? where Question_Id=?;");
		p.setInt(1, section);
		p.setInt(2, question_id);
		p.executeUpdate();
%>
</body>
</html>
<%	con.close();
		//After updation go to Question_Display.jsp Page
	response.sendRedirect("Question_Display.jsp?f1="+T_Id+"&f2="+chapter_id+"&f3="+session.getAttribute("subject"));
	}
	catch(Exception e)
	{
		System.out.println(e);
		//Exception occur then goto the error.jsp page
		response.sendRedirect("error.jsp");
	}
%>