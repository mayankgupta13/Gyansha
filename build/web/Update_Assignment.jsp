<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_abc.jsp	-->
			
<!-- Update Edited Assignment Question into the database -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
 <jsp:useBean id="c" class="com.MyConnection" scope="session"></jsp:useBean>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
</head>
<body>
    <%
        int checkbox[]={0,0,0,0};
        int radio[]={0,0,0,0};
        int option_id[]=new int[4];
        String option[]=new String[4];
 	int assignment_Id=Integer.parseInt(request.getParameter("f1"));
        String chapter_id=request.getParameter("f2");
try{
      
	Connection con = c.getConnection();
	option_id[0]=Integer.parseInt(request.getParameter("option_id1"));
	option_id[1]=Integer.parseInt(request.getParameter("option_id2"));
	option_id[2]=Integer.parseInt(request.getParameter("option_id3"));
	option_id[3]=Integer.parseInt(request.getParameter("option_id4"));
	int question_id=Integer.parseInt(request.getParameter("question_id"));
	String question=request.getParameter("question");
        String explanation=request.getParameter("explanation");
	option[0]=request.getParameter("option1");
	option[1]=request.getParameter("option2");
	option[2]=request.getParameter("option3");
	option[3]=request.getParameter("option4");
	String question_type=request.getParameter("question_type");
       
          if(question_type.equals("Multi"))
         {
             if(request.getParameter("c1")!=null)
                checkbox[0]=Integer.parseInt(request.getParameter("c1"));
            if(request.getParameter("c2")!=null)
                checkbox[1]=Integer.parseInt(request.getParameter("c2"));
            if(request.getParameter("c3")!=null)
                checkbox[2]=Integer.parseInt(request.getParameter("c3"));
             if(request.getParameter("c4")!=null)
                 checkbox[3]=Integer.parseInt(request.getParameter("c4"));
           
         }
        
       if(question_type.equals("Single"))
         {
           if(request.getParameter("r")!=null)
           {
               if(request.getParameter("r").equals("a1"))
                    radio[0]=1;
               if(request.getParameter("r").equals("a2"))
                    radio[1]=1;
               if(request.getParameter("r").equals("a3"))
                    radio[2]=1;
               if(request.getParameter("r").equals("a4"))
                    radio[3]=1;
           }
        }
        
	PreparedStatement ps=con.prepareStatement("update Assignment_Questions set Assignment_Question=?,explanation=? where Question_Id=?;");
	ps.setString(1, question);
        ps.setString(2, explanation);
	ps.setInt(3, question_id);
	ps.executeUpdate();
		for(int i=0;i<4;i++)
                {
		PreparedStatement ps1=con.prepareStatement("update Assignment_Options set Options=?,Correct_Ans=? where Option_Id=?;");
		ps1.setString(1, option[i]);
                if(question_type.equals("Multi"))
                    ps1.setInt(2,checkbox[i] );
                else
                     ps1.setInt(2,  radio[i]);
		ps1.setInt(3, option_id[i]);
		ps1.executeUpdate();
                }
		//options 2

        con.close();
		//After updation go to Question_Display.jsp Page
       %>
       <script type="text/javascript">
           alert('Question updated');
           window.open("View_Assignment.jsp?f1=<%=assignment_Id %>&f2=<%=chapter_id%>","_self")
           </script>
       
       <%
	
	}
	catch(Exception e)
	{
		System.out.println(e);
		//Exception occur then goto the error.jsp page
		response.sendRedirect("error.jsp");
	}
		
%>
</body>
</html>
<%	
%>