<!-- 
	Created By Mayank Gupta 
		Page Name:-	Teacher_MS_Chap_Signup.jsp	-->
		
<!-- SQL database command to store New Chapter data into the database-->
<%	try{  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%
		int chapter_id=Integer.parseInt(request.getParameter("f2"));
		int class_id=Integer.parseInt(request.getParameter("classs"));
		String chapter_name=request.getParameter("chapter_name");
		String descriptions=request.getParameter("description");
		String subject=request.getParameter("subject");
		int teacher_id=(Integer)session.getAttribute("Teacher_Id");
		int subject_id=Integer.parseInt(request.getParameter("f1"));
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/final_teacher","root","");
		con.setAutoCommit(false);
		PreparedStatement ps1=con.prepareStatement("insert into Chapter_Added values(?,?,?,?)");
		ps1.setInt(1, chapter_id);
		ps1.setInt(2, teacher_id);
		ps1.setInt(3, subject_id);
		ps1.setInt(4, class_id);
		ps1.executeUpdate();
		Statement st=con.createStatement();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chapter Signup</title>
<script type="text/javascript">
function preventBack(){window.history.forward();}
setTimeout("preventBack()", 0);
window.onunload=function(){null};
</script>
</head>
<body>
<%	
	PreparedStatement ps=con.prepareStatement("insert into New_Chapter values(?,?,?)");
	ps.setInt(1, chapter_id);
	ps.setString(2, chapter_name);
	ps.setString(3, descriptions);
	ps.executeUpdate();
	%>
	<script>
		alert("Chapter successfully added");
			//if chapter successfully added goto Main Page i.e Main.jsp
		window.open("Main.jsp?f1=<%=session.getAttribute("subject")%>","_self");
	</script>
</body>
</html>
<%		con.commit();
		con.close();
	}
	catch(Exception e)
	{
		System.out.println(e);
		//if exception occur goto error.jsp page
		response.sendRedirect("error.jsp");
	}
%>