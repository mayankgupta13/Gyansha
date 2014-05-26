<!-- Created By Mayank Gupta 
			Page Name:- Teacher_MS_Signin.jsp	-->
			
<!-- Provide Authorization to the valid teacher-->
<jsp:useBean id="c" class="com.MyConnection" scope="session"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign In</title>
</head>
<body>
<%	
    try
       {
		
        Connection con = c.getConnection();
        String email_id=request.getParameter("email_id");
	String pass=request.getParameter("pass");
        String teacher_name=null;
        int teacher_id=0;
        boolean flag=false;
	PreparedStatement ps=con.prepareStatement("select * from teacher_login where email_id=? and Password=?");
        ps.setString(1, email_id);
         ps.setString(2, pass);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
                teacher_name=rs.getString("Teacher_Name");
                teacher_id=rs.getInt("Teacher_Id");
		flag=true;
        }
        if(flag==true)
        {
            
            session.setAttribute("Teacher_Id", teacher_id);
            session.setAttribute("Teacher_Name", teacher_name);
	    response.sendRedirect("Sel_Subject.jsp");
        }
	else{			
	%>			
		<script type="text/javascript">
						//if teacher enter invalid password then goto Login Page i.e. Login.jsp
		alert("Invalid User ID and Password");
		window.open("Login.jsp","_parent");
		</script>
			
</body>
</html>
<%	
        }
            con.close();
	}
	catch(Exception e)
	{
		out.println(e);
		//if any exception is occur then goto error.jsp page
		response.sendRedirect("error.jsp");
	}
%>