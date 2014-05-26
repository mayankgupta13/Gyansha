<%-- 
    Document   : upload_book
    Created on : May 14, 2014, 4:10:49 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="java.io.*"%>
 <%@ page import="java.sql.*"%>
 <jsp:useBean id="c" class="com.MyConnection" scope="session" />
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
                        String book_name=request.getParameter("book_name");
                        String book_description=request.getParameter("book_description");
                        String book_type=request.getParameter("book_type");
                        String book=request.getParameter("book");
                        String url=request.getParameter("url");
                       
                       
                        int teacher_id=(Integer)session.getAttribute("Teacher_Id");
                        int chapter_id=(Integer)session.getAttribute("chapter");
                        int n=0;
                        Connection con=c.getConnection();
                        PreparedStatement ps1=con.prepareStatement("SELECT Book_Id FROM books ORDER BY Book_Id DESC LIMIT 1");
                        ResultSet rs=ps1.executeQuery();
			while(rs.next())
			{
				n=rs.getInt(1);
			}
				n+=1;
                   if(book_type.equals("File"))  
                   {
                String path=null;
                String saveFile = "";
		String file_name=null;
             String contentType = request.getContentType();
      if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
            DataInputStream in = new DataInputStream(request.getInputStream());
            int formDataLength = request.getContentLength();
            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            while (totalBytesRead < formDataLength) {
                  byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                  totalBytesRead += byteRead;
            }
            String file = new String(dataBytes);
            saveFile = file.substring(file.indexOf("filename=\"") + 10);
            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
            int lastIndex = contentType.lastIndexOf("=");
            String boundary = contentType.substring(lastIndex + 1, contentType.length());
            int pos;
            pos = file.indexOf("filename=\"");
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            int boundaryLocation = file.indexOf(boundary, pos) - 4;
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
         	
           file_name=n+saveFile;
            	//Uploaded Assignment Question File Location
           path=getServletContext().getRealPath("/")+"//file//";
            saveFile = path+  file_name;
            File ff = new File(saveFile);
               	FileOutputStream fileOut = new FileOutputStream(ff);
            	fileOut.write(dataBytes, startPos, (endPos - startPos));
            	fileOut.flush();
            	fileOut.close();
                book=file_name;
                
                 
      }
       
                                PreparedStatement ps2=con.prepareStatement("INSERT INTO books VALUES(?,?,?,?,?,?,?)");
                                ps2.setInt(1,n);
                                ps2.setInt(2,chapter_id);
                                ps2.setInt(3,teacher_id);
                                ps2.setString(4,book_name);
                                ps2.setString(5,book_description);
                                ps2.setString(6,book_type);
                                ps2.setString(7,book);
                                  ps2.executeUpdate();  
                                 con.close();
                                 %>
                                 <script language="javascript">
                                     alert('Book Uploaded Successfully');
                                     </script>
                                 <%
                                 response.sendRedirect("view_books.jsp");
                   }
                   else
                   {
                        String s="";
                        if(url!=null)
                        {
                        for(int i=0;i<=6;i++)
                        {
                            s=s+url.charAt(i);
                        }
                       
                        if(!s.equalsIgnoreCase("http://"))
                           url="http://"+url;
                        }
                        PreparedStatement ps2=con.prepareStatement("INSERT INTO books VALUES(?,?,?,?,?,?,?)");
                                ps2.setInt(1,n);
                                ps2.setInt(2,chapter_id);
                                ps2.setInt(3,teacher_id);
                                ps2.setString(4,book_name);
                                ps2.setString(5,book_description);
                                ps2.setString(6,book_type);
                                ps2.setString(7,url);
                                ps2.executeUpdate();  
                                 con.close();
                                 %>
                                 <script language="javascript">
                                     alert('Book URL saved Successfully');
                                     window.open("view_books.jsp","_self");
                                     </script>
                                 <%
                                
                   }
    
%>
<%
    }
    catch(Exception e)
{
    System.out.println(e);
	out.println(e);
	//if exception occur goto error.jsp page
    
	
}
%>
    </body>
</html>
