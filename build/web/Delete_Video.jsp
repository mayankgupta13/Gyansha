<%-- 
    Document   : Delete_Video
    Created on : May 19, 2014, 3:45:42 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <jsp:useBean id="c" class="com.MyConnection" scope="session"></jsp:useBean>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
    <body>
        <%
            int n=0;
              try
            {
                      
                       int video_id=Integer.parseInt(request.getParameter("f1"));
                        Connection con=c.getConnection();
                        PreparedStatement ps1=con.prepareStatement("delete from videos where Video_Id=?");
                        ps1.setInt(1,video_id);
                        n=ps1.executeUpdate();
                         String file_name=request.getParameter("f2");
                         String path=getServletContext().getRealPath("/")+"//file//";
                        File f=new File(path+file_name);
                        f.delete();

               }
              catch(Exception e)
                {
                    out.println(e);
                }
              if(n>0)
              {
                  %>
                   <script language="javascript">
                                     alert('Book URL saved Successfully');
                                     window.open("view_videos.jsp","_self");
                                     </script>
                  <%
                 
              }
              else
              {
                  out.println("Not Deleted");
              }
       %>
    </body>
</html>
