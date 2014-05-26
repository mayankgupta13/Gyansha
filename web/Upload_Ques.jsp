<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_Upload_Ques.jsp	-->
			
<!-- for uploading question file-->
<%try{ %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload File</title>
</head>
<body>
<%	
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
         	int assignment_id=(Integer)(session.getAttribute("Assi_Id"));
           file_name=(assignment_id+saveFile);
            	//Uploaded Assignment Question File Location
           path=getServletContext().getRealPath("/")+"//file//";
            saveFile = path+  file_name;
            File ff = new File(saveFile);
               	FileOutputStream fileOut = new FileOutputStream(ff);
            	fileOut.write(dataBytes, startPos, (endPos - startPos));
            	fileOut.flush();
            	fileOut.close();
      }
%>
	<%
    session.setAttribute("File_Name", file_name);
%>
<script type="text/javascript">
	alert("Your file is successfully upload");
	
		//After uploading file goto Add_Assignment.jsp for insert into the database
	window.open("Add_Assignment.jsp?f1ag=File","_self");
</script>
</body>
</html>
<%}
catch(Exception e)
{
	System.out.println(e);
	//if exception occur goto error.jsp page
        System.out.println("Error in Upload_question");
	response.sendRedirect("error.jsp");
}
%>