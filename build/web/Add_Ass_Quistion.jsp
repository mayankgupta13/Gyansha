<%-- 
    Document   : Add_Ass_Quistion.jsp
    Created on : May 14, 2014, 10:30:21 AM
    Author     : Administrator
--%>



<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Assignment Question</title>
</head>
<body>
<%	
    try
    {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
                int assignment_id=(Integer)session.getAttribute("Assi_Id");
		 int Ques_Id=(Integer)session.getAttribute("Ques_Id");
                 String ques_type=request.getParameter("ques_type");
                  String ques=request.getParameter("ques");
                  
           
                   
                    
                 if(ques_type.equals("Text"))
                 {
                      String ans=request.getParameter("ans");
                       String exp1=request.getParameter("exp1");
                       out.println("Text");
                        out.println("ans:"+ans);
                        PreparedStatement ps=con.prepareStatement("INSERT INTO Assignment_Questions VALUES(?,?,?,?,?,?)");
                        ps.setInt(1,Ques_Id);
                        ps.setInt(2,assignment_id);
                        ps.setString(3,ques);
                        ps.setString(4,ques_type);
                        ps.setString(5,exp1);
                        ps.setString(6,ans);
                        ps.executeUpdate();  
                        
                 }
                 else if(ques_type.equals("Multi"))
                  {
                         String exp3=request.getParameter("exp3");
                         out.println("Multi");
                          int a[]={0,0,0,0};
                          if(request.getParameter("c1")==null)
                            a[0]=0;
                          else
                              a[0]=1;
                          if(request.getParameter("c2")==null)
                            a[1]=0;
                          else
                              a[1]=1;
                           if(request.getParameter("c3")==null)
                            a[2]=0;
                          else
                              a[2]=1;
                            if(request.getParameter("c4")==null)
                            a[3]=0;
                          else
                              a[3]=1;
                           
                                String op[]=new String[4];
                    
                                 op[0]=request.getParameter("option1");
                                op[1]=request.getParameter("option2");
                                op[2]=request.getParameter("option3");
                                op[3]=request.getParameter("option4");
                        PreparedStatement ps=con.prepareStatement("INSERT INTO Assignment_Questions VALUES(?,?,?,?,?,?)");
                        ps.setInt(1,Ques_Id);
                        ps.setInt(2,assignment_id);
                        ps.setString(3,ques);
                        ps.setString(4,ques_type);
                        ps.setString(5,exp3);
                        ps.setString(6,"");
                         ps.executeUpdate();  
                        int i=0;
                        int n=0;
                        PreparedStatement ps1=con.prepareStatement("SELECT Option_Id FROM assignment_options ORDER BY Option_Id DESC LIMIT 1");
                        ResultSet rs=ps1.executeQuery();
			while(rs.next())
			{
				n=rs.getInt(1);
			}
				n+=1;
                        for(i=0;i<4;i++)
                        {
                              PreparedStatement ps2=con.prepareStatement("INSERT INTO assignment_options VALUES(?,?,?,?)");
                                ps2.setInt(1,n);
                                ps2.setInt(2,Ques_Id);
                                ps2.setString(3,op[i]);
                                ps2.setInt(4,a[i]);
                               
                                 ps2.executeUpdate();  
                                 n++;
                        }
                        
                   }
                   else
                   {
                        String exp2=request.getParameter("exp2");
                          out.println("Single");
                          int a[]={0,0,0,0};
                         
                          String r=request.getParameter("r");
                          if(r.equals("a"))
                             a[0]=1;
                          else if(r.equals("b"))
                             a[1]=1;
                           else if(r.equals("c"))
                                a[2]=1;
                            else
                                 a[3]=1;
                          String op[]=new String[4];
                    
                         op[0]=request.getParameter("op1");
                         op[1]=request.getParameter("op2");
                         op[2]=request.getParameter("op3");
                         op[3]=request.getParameter("op4");
                        PreparedStatement ps=con.prepareStatement("INSERT INTO Assignment_Questions VALUES(?,?,?,?,?,?)");
                        ps.setInt(1,Ques_Id);
                        ps.setInt(2,assignment_id);
                        ps.setString(3,ques);
                        ps.setString(4,ques_type);
                        ps.setString(5,exp2);
                        ps.setString(6,"");
                          ps.executeUpdate();  
                        int i=0;
                        int n=0;
                        PreparedStatement ps1=con.prepareStatement("SELECT Option_Id FROM assignment_options ORDER BY Option_Id DESC LIMIT 1");
                        ResultSet rs=ps1.executeQuery();
			while(rs.next())
			{
				n=rs.getInt(1);
			}
				n+=1;
                        for(i=0;i<4;i++)
                        {
                              PreparedStatement ps2=con.prepareStatement("INSERT INTO assignment_options VALUES(?,?,?,?)");
                                ps2.setInt(1,n);
                                ps2.setInt(2,Ques_Id);
                                ps2.setString(3,op[i]);
                                ps2.setInt(4,a[i]);
                               
                                 ps2.executeUpdate();  
                                 n++;
                        }
                      
                     }
                         
                       con.close();
                 
                       response.sendRedirect("Assi_Questions.jsp");
%>			 					
</body>
</html>
<%
}
catch(Exception e)
{
	System.out.println(e);
	//if exception occur goto error.jsp page
	response.sendRedirect("error.jsp");
}
%>
