<%-- 
    Document   : index
    Created on : May 14, 2014, 5:08:29 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
       String path = getServletContext().getRealPath("/file");
       out.println(path);
       %>
    </body>
</html>
