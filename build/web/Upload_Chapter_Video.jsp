<%-- 
    Document   : Upload_Chapter_Video
    Created on : May 16, 2014, 12:11:07 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <%@ page import="java.io.*"%>
 <%@ page import="java.sql.*"%>
 <jsp:useBean id="c" class="com.MyConnection" scope="session" />
    <body>
      <%
          try
          {
              
                        String video_name=request.getParameter("video_name");
                        String video_description=request.getParameter("video_description");
                        String video_file=request.getParameter("file");
                      
                          int video_id=(Integer)session.getAttribute("Video_Id");
                           int teacher_id=(Integer)session.getAttribute("Teacher_Id");
                        int chapter_id=(Integer)session.getAttribute("chapter");
                       
         
      
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
         	
           file_name=video_id+saveFile;
            	//Uploaded Assignment Question File Location
           path=getServletContext().getRealPath("/")+"//file//";
            saveFile = path+  file_name;
            File ff = new File(saveFile);
            String s1="",s=ff.getName();
            System.out.println( ff.getName());
            for(int i=s.length()-3;i<s.length();i++)
            {
                s1=s1+s.charAt(i);
            }
             System.out.println(" "+s1);
            if(s1.equalsIgnoreCase("mp4") ||s1.equalsIgnoreCase("ogg"))
            {
            
           
           
                        FileOutputStream fileOut = new FileOutputStream(ff);
                        fileOut.write(dataBytes, startPos, (endPos - startPos));
                        fileOut.flush();
                        fileOut.close();
                
                
                        Connection con=c.getConnection();
                        PreparedStatement ps2=con.prepareStatement("INSERT INTO videos VALUES(?,?,?,?,?,?)");
                                ps2.setInt(1,video_id);
                                ps2.setInt(2,chapter_id);
                                ps2.setInt(3,teacher_id);
                                ps2.setString(4,video_name);
                                ps2.setString(5,video_description);
                                ps2.setString(6,file_name);
                            
                                  ps2.executeUpdate();  
                                 con.close();
                                 %>
                                 <script language="javascript">
                                     alert('Video Uploaded Success fuly');
                                     </script>
                                 <%
                                 
                                 response.sendRedirect("view_videos.jsp");
            }
            else
            {
                 %>
                                 <script language="javascript">
                                    alert('Video file format is not supported');
                                    </script>
                      <%
                  response.sendRedirect("Upload_Video.jsp?f1="+chapter_id);
            }
                
      }
       }
    catch(Exception e)
        {
    System.out.println(e);
	out.println(e);
	//if exception occur goto error.jsp page
    
	response.sendRedirect("error.jsp");
    }
                
      %>
    </body>
    
</html>
