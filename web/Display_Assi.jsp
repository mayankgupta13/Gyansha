<!-- 
	Created By Mayank Gupta 
		Page Name:-	Teacher_MS_Display_Assi.jsp	-->
			
<!-- Display Assignments added by teacher in SQL database command to store Data into the database and Display that List-->
<%try{ %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<% int a=1;
	if(session.getAttribute("Teacher_Id")==null)
	{
		response.sendRedirect("Login.jsp"); //if teacher is not login then goto Login.jsp
	}
	else
	{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<title>Easylearning.guru</title>
<link rel="canonical" href="http://www.easylearning.guru/" />
<link rel='stylesheet' id='jetpack-subscriptions-css'  href='css/subscriptions.css' type='text/css' media='all' />
<link rel='stylesheet' id='jetpack-widgets-css'  href='css/widgets.css' type='text/css' media='all' />
<link rel='stylesheet' id='themify-shortcodes-css'  href='css/shortcodes.css' type='text/css' media='all' />
<link rel='stylesheet' id='theme-style-css'  href='css/style1.css' type='text/css' media='all' />
<link rel='stylesheet' id='themify-media-queries-css'  href='css/media-queries.css' type='text/css' media='all' />
<link rel='stylesheet' id='google-fonts-css'  href='css/css.css' type='text/css' media='all' />
<link rel='stylesheet' id='pretty-photo-css'  href='css/lightbox.css' type='text/css' media='all' />
<link rel='stylesheet' id='themify-builder-style-css'  href='css/themify-builder-style.css' type='text/css' media='all' />
<link rel='stylesheet' id='sharedaddy-css'  href='css/sharing.css' type='text/css' media='all' />
<script type='text/javascript' src='js/jquery1.js'></script>
<script type='text/javascript' src='js/jquery-migrate.min.js'></script>
<meta name="generator" content="WordPress 3.8.3" />
<link rel='shortlink' href='http://easylearning.guru' />

<title>Contact Details</title>
<meta property="og:site_name" content="easylearning.guru" />
<meta property="og:url" content="http://www.easylearning.guru" />
<!-- End Open Graph Tags -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">


<script type="text/javascript">
     function next()
	{
            var c=confirm("Are you sure ?");
		if(c==true)
		{
			return true;
		}
		else
			return false;	
	}
</script>

</head>
<jsp:useBean id="c" class="com.MyConnection" scope="session"></jsp:useBean>
<body class="home blog skin-default gecko not-ie sidebar-none list-post">
<div id="pagewrap">
	<div id="headerwrap">
    		<header id="header" class="pagewidth">        
			<hgroup>
				<h1><a href="easylearning.guru" title="Easylearning.guru"><img src="img/logo.png" alt="Logo"><!--Your logo here--></a></h1>	
				<h2 id="site-description">Easylearning.guru.</h2>
			</hgroup>
	
            <nav id="main-nav-wrap">
                <a id="menu-icon" class="mobile-button"></a>
			</nav>
            <!-- /main-nav-wrap -->
			<div id="social-wrap">	
				<div class="social-widget">	
				</div>
				<!-- /.social-widget -->
			</div>
			<!-- /social-wrap -->
	
		</header>
		<!-- /#header -->      				
	</div>
	<!-- /#headerwrap -->
	
	<div id="body" class="clearfix">		
<!-- layout -->
<div id="layout" class="pagewidth clearfix">

		<!-- content -->
	<div id="content">

	<h1 class="post-title"><a href="www.easylearning.guru">Easylearning.guru Display All Assignment</a></h1>	
	<!-- Goto Mainpage when user click to goback to main page -->
<div><a href="Main.jsp?f1=<%=session.getAttribute("subject")%>" target="_self">Back to Main Page</a>
<div>
<p>&nbsp;</p>
<div>
	<form><div id='contact-form-8'><fieldset>
		<table cellspacing="5" cellpadding="5" width="110%" border="1">
		<legend>All Assignment</legend>
		<%
                        int teacher_id=(Integer)session.getAttribute("Teacher_Id");
                        String subject_name=(String)session.getAttribute("subject");
                       Connection con = c.getConnection();
			String as_type=null;
                        int as_id=0;
                        String sql="SELECT DISTINCT T.ASSIGNMENT_ID, T.CHAPTER_ID, N.CHAPTER_NAME, CL.CLASS_NAME, S.SUBJECT_NAME,C.ASSIGNMENT_TYPE,C.FILE_NAME,C.UPLOAD_DATE FROM (((((CHAPTER_Assignment AS T JOIN CREATE_ASSIGNMENT AS C ON T.ASSIGNMENT_ID = C.ASSIGNMENT_ID ) JOIN CHAPTER_ADDED AS CA ON CA.CHAPTER_ID = T.CHAPTER_ID) JOIN NEW_CHAPTER AS N ON N.CHAPTER_ID = CA.CHAPTER_ID)	JOIN SUBJECTS AS S ON CA.SUBJECT_ID = S.SUBJECT_ID)  JOIN CLASS AS CL ON CL.TEACHER_ID = S.TEACHER_ID) WHERE T.TEACHER_ID ="+teacher_id+" AND S.SUBJECT_NAME = '"+subject_name+"' GROUP BY T.ASSIGNMENT_ID";
                        PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs= ps.executeQuery(sql);
		%>			 					
		<tr><th>S. No.</th><th width="10%">Assignment Id</th><th>Class</th><th>Subject</th><th>Chapter</th>
		<th>Assignment_type</th><th>Assignment/File Name</th><th>Uploaded Date</th><th>View/Download</th><th>Delete</th></tr>
		<%
                 while(rs.next())
                 {
                as_type=rs.getString("C.ASSIGNMENT_TYPE");
                as_id=rs.getInt("T.ASSIGNMENT_ID");
                %>
			<tr>
				<td align="center"><%=a %>.</td>
				<td width="10%" align="center"><%=as_id %></td>
				<td align="center"><%=rs.getString("CL.CLASS_NAME") %></td>
				<td><%=rs.getString("S.SUBJECT_NAME") %></td>
				<td><%=rs.getString("N.CHAPTER_NAME") %></td>
                                <td align="center"><%=as_type %></td>
				<td><%=rs.getString("C.FILE_NAME") %></td>
				<td><%=rs.getDate("C.UPLOAD_DATE") %></td>
                                <%
                                if(as_type.equals("File"))
                                {
                                %>
                                <td><a href="file/<%=rs.getString("C.FILE_NAME") %>">Download</a></td>
                                <%
                                }
                                else
                                {
                                %>
                                 <td><a href="View_Assignment.jsp?f1=<%=as_id %>&f2=<%=rs.getInt("T.CHAPTER_ID")%>" >View</a></td>
                                 <%
                                }
                                    %>
                                <td><a href="Delete_Assignment.jsp?f1=<%=as_id %>&f2=<%=as_type %>&f3=<%=rs.getString("C.FILE_NAME") %>" onclick="return next();">Delete</a></td>
			</tr>
		<%
                                a++;
                }%>
		</table>
		<p>&nbsp;</p>
	</fieldset></div></form>
	</div>
	</div>
	</div>
</body>
</html>
<%}}catch(Exception e)
{
	System.out.println(e);
	//if exception occur goto error.jsp page
	response.sendRedirect("error.jsp");
}
%>