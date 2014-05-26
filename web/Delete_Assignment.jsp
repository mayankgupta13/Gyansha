<%-- 
    Document   : Delete_Assignment
    Created on : May 19, 2014, 2:52:21 PM
    Author     : Administrator
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="c" class="com.MyConnection" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           try
           {
               boolean flag1=false;
          int assignment_id=Integer.parseInt(request.getParameter("f1"));
          String assignment_type=request.getParameter("f2");
          String file_name=request.getParameter("f3");
          Connection con = c.getConnection();
              
            PreparedStatement ps=con.prepareStatement("delete from chapter_Assignment where Assignment_Id=?");
                        ps.setInt(1,assignment_id);
                        ps.executeUpdate();
            PreparedStatement ps2=con.prepareStatement("delete from create_assignment where Assignment_Id=?");
                        ps2.setInt(1,assignment_id);
                        ps2.executeUpdate();
                         String path=getServletContext().getRealPath("/")+"//file//";
                        File f=new File(path+file_name);
                        f.delete();
          if(assignment_type.equals("Enter"))
          {
                        
                        PreparedStatement ps5=con.prepareStatement("select Question_Id from assignment_questions where Assignment_Id=?");
                        ps5.setInt(1,assignment_id);
                        ResultSet rs=ps5.executeQuery();
                        while(rs.next())
                        {
                            PreparedStatement ps4=con.prepareStatement("delete from assignment_options where Question_Id=?");
                            ps4.setInt(1,rs.getInt(1));
                            ps4.executeUpdate();
                            
                        }
                        PreparedStatement ps3=con.prepareStatement("delete from assignment_questions where Assignment_Id=?");
                        ps3.setInt(1,assignment_id);
                        ps3.executeUpdate();
                        
          }
          
         %>
         <script language="javascript">
             alert('Assignment Deleted Successfully');
              window.open("Display_Assi.jsp","_self");
             </script>
             
         <%
         
          con.close();
           }
         catch(Exception e)
        {
            out.println("<h1>"+e+"</h1>");
	}
       
       %>
    </body>
</html>
