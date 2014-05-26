<!-- 
	Created By Mayank Gupta 
		Page Name:-	Teacher_MS_Question_Signup.jsp	-->
		
<!-- SQL database command to store New Test Question data into the database-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Question Sign Up</title>
</head>
<body>
<%String checkbox1=null,checkbox2=null,checkbox3=null,checkbox4=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
		String question=request.getParameter("question");
		int section=Integer.parseInt(request.getParameter("section"));
		int question_id=Integer.parseInt(request.getParameter("question_id"));
		int test_id=Integer.parseInt(request.getParameter("test_id"));
		String option1=request.getParameter("option1");
		String option2=request.getParameter("option2");
		String option3=request.getParameter("option3");
		String option4=request.getParameter("option4");
		int chapter_id=Integer.parseInt(request.getParameter("chapter_id"));
		String question_type=request.getParameter("question_type");
		String subject=request.getParameter("subject");
		checkbox1=request.getParameter("checkbox1");
		checkbox2=request.getParameter("checkbox2");
		checkbox3=request.getParameter("checkbox3");
		checkbox4=request.getParameter("checkbox4");
		
		String s=null;
		
		
		
		PreparedStatement ps=con.prepareStatement("INSERT INTO Test_Questions VALUES(?,?,?,?,?)");
			ps.setInt(1, test_id);
			ps.setInt(2, question_id);
			ps.setString(3, question);
			ps.setInt(4, section);
			ps.setString(5, question_type);
			ps.executeUpdate();
		
			//Option 1
			PreparedStatement ps1=con.prepareStatement("INSERT INTO Test_Options VALUES(?,?,?,?)");
			ps1.setString(1, null);
			ps1.setInt(2, question_id);
			ps1.setString(3, option1);
			if(checkbox1==null)
			{
				ps1.setBoolean(4, false);
			}
			else
			{
				ps1.setBoolean(4, true);
			}
			ps1.executeUpdate();
	
			//Option 2
			PreparedStatement ps2=con.prepareStatement("INSERT INTO Test_Options VALUES(?,?,?,?)");
			ps2.setString(1, null);
			ps2.setInt(2, question_id);
			ps2.setString(3, option2);
			if(checkbox2==null)
			{
				ps2.setBoolean(4, false);
			}
			else
			{
				ps2.setBoolean(4, true);
			}
			ps2.executeUpdate();

			//Option 3
			PreparedStatement ps3=con.prepareStatement("INSERT INTO Test_Options VALUES(?,?,?,?)");
			ps3.setString(1, null);
			ps3.setInt(2, question_id);
			ps3.setString(3, option3);
			if(checkbox3==null)
			{
				ps3.setBoolean(4, false);
			}
			else
			{
				ps3.setBoolean(4, true);
			}
			ps3.executeUpdate();
			
			//Option 4
			PreparedStatement ps4=con.prepareStatement("INSERT INTO Test_Options VALUES(?,?,?,?)");
			ps4.setString(1, null);
			ps4.setInt(2, question_id);
			ps4.setString(3, option4);
			if(checkbox4==null)
			{
				ps4.setBoolean(4, false);
			}
			else
			{
				ps4.setBoolean(4, true);
			}
			ps4.executeUpdate();
			question_id++;
			con.setSavepoint();

%>			 					
</body>
</html>
<%
response.sendRedirect("Question.jsp?f1="+test_id+"&f2="+chapter_id+"&f4="+question_id+"&f3="+subject);
}
catch(Exception e)
{
System.out.println(e);

}
%>