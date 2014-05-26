<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_Display_Test.jsp	-->
			
<!-- Display Test List and View Test Questions and Delete Test -->
<%try{ %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<% int a=1;
	if(session.getAttribute("Teacher_Id")==null)
		{			//of no teacher login then goto Login Page i.e. Login.jsp
			response.sendRedirect("Login.jsp");
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
</script>
</head>
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

	<h1 class="post-title"><a href="www.easylearning.guru">Easylearning.guru Display All Test</a></h1>	
	
			<!-- Onclick goback to Main page i.e Main.jsp-->
<div><a href="Main.jsp?f1=<%=session.getAttribute("subject")%>" target="_self">Back to Main Page</a>
<div>
<p>&nbsp;</p>
<div>
	<form><div id='contact-form-8'><fieldset>
		<table cellspacing="3" cellpadding="5" border="1">
		<legend>All Solutions</legend>
		<%
                        Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
			PreparedStatement ps=con.prepareStatement("delete from temp_test_questions");
			ps.executeUpdate();
			PreparedStatement ps1=con.prepareStatement("delete from temp_test_options");
			ps1.executeUpdate();
			Statement st=con.createStatement();
			ResultSet rs= st.executeQuery("SELECT DISTINCT T.TEST_ID, T.CHAPTER_ID, C.TEST_NAME, N.CHAPTER_NAME, CL.CLASS_NAME, S.SUBJECT_NAME, C.TEST_TIME, C.CREATED_DATE "+
					"FROM (((((	CHAPTER_TEST AS T JOIN CREATE_TEST AS C ON T.TEST_ID = C.TEST_ID ) JOIN CHAPTER_ADDED AS CA ON CA.CHAPTER_ID = T.CHAPTER_ID) "+
					"JOIN NEW_CHAPTER AS N ON N.CHAPTER_ID = CA.CHAPTER_ID)	JOIN SUBJECTS AS S ON CA.SUBJECT_ID = S.SUBJECT_ID) "+ 
					"JOIN CLASS AS CL ON CL.TEACHER_ID = S.TEACHER_ID) WHERE T.TEACHER_ID ="+session.getAttribute("Teacher_Id")+" AND S.SUBJECT_NAME = '"+session.getAttribute("subject")+"' GROUP BY T.TEST_ID");
		%>			 					
		<tr><th width="5%">S. No.</th><th>Class</th><th>Subject</th><th>Chapter Name</th><th>Test Name</th><th width="7%">Test Duration</th>
		<th>Date</th><th>Time</th><th>View</th><th width="7%">Delete Test</th></tr>
		<%while(rs.next()){%>
			<tr>
				<td align="center"><%=a %>.</td>
				<td align="center"><%=rs.getString(5) %></td>
                                <td align="center"><%=rs.getString(6) %></td>
				
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getTime(7) %></td>
				<td align="center"><%=rs.getDate(8) %></td>
				<td align="center"><%=rs.getTime(8) %></td>
				
					<!-- Onclick goto View test questions -->
				<td align="center"><a href="Question_Display.jsp?f1=<%=rs.getInt(1)%>&f2=<%=rs.getInt(2)%>&f3='<%=rs.getString(6)%>'" target="_self">View</a></td>
				
					<!-- Onclick delete test-->
                                        <td align="center"><a href="Delete_Test.jsp?f1=<%=rs.getInt(1) %>&f2=Delete&f3=1&f4=1" target="_self" onclick="return next();">Delete</a></td>
			</tr>
		<%a++;}%>
		</table>
		<p>&nbsp;</p>
	</fieldset></div></form>
	</div>
	</div>
	</div>
</body>
</html>
<%}}
catch(Exception e)
{
	System.out.println(e);
	//if exception occur goto error.jsp page
	response.sendRedirect("error.jsp");
}
%>