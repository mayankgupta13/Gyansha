<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_Display_Chap.jsp	-->
			
<!-- Display Chapter List and Create New Test and Create New Assignment -->
<jsp:useBean id="c" class="com.MyConnection" scope="session"></jsp:useBean>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
   <%@page import="java.util.*" %>
    <%@page import="java.util.TimeZone" %>
	<%
    try
    {
		if(session.getAttribute("Teacher_Id")==null)
		{
			response.sendRedirect("Login.jsp"); //if teacher is not login then goto Login Page i.e Login.jsp
		}
		else if(session.getAttribute("subject")==null)
		{
			response.sendRedirect("Sel_Subject.jsp");
		}
		else
		{
			
			Connection con =c.getConnection();
			Statement st=con.createStatement();
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

<title>Easylearning.guru</title>

<meta property="og:site_name" content="easylearning.guru" />
<meta property="og:url" content="http://www.easylearning.guru" />
<!-- End Open Graph Tags -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
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

	<h1 class="post-title">Chapter's Details</h1>	

	<!-- Onclick goback to Main page i.e Main.jsp-->
<div><a href="Main.jsp?f1=<%=session.getAttribute("subject")%>" target="_self">Back to Main Page</a>
<div>
<p>&nbsp;</p>
<div>
	<form>
	<div>
		<label class='g8-name'>Teacher Id :&nbsp;<%=session.getAttribute("Teacher_Id")%></label>
	</div>
	&nbsp;
	<div>
		<label class='g8-name'>Subject :&nbsp;<%=session.getAttribute("subject")%></label>
	</div>
	&nbsp;	
	<div id='contact-form-8'><fieldset>
		<legend>Display All Chapter's</legend>
		<table cellspacing="5" cellpadding="5" width="110%" border="1">
		<tr>
			<th>S.No.</th><th>Chapter Id</th><th>Chapter_Name</th><th>Description</th><th>Subject</th><th>Class</th><th>Create Test</th><th>Create Assignment</th><th>Upload Books</th><th>Upload Videos</th><th>Delete Chapter</th>
		</tr>
		<% int a=1;%>
		<%ResultSet rs2=st.executeQuery("SELECT DISTINCT N.CHAPTER_ID,N.CHAPTER_NAME,N.DESCRIPTIONS,CL.CLASS_NAME,S.SUBJECT_NAME FROM ((("+
						"NEW_CHAPTER AS N JOIN CHAPTER_ADDED AS C ON N.CHAPTER_ID = C.CHAPTER_ID) JOIN subjects AS S ON S.subject_id = c.subject_id)"+
						"JOIN class AS cl ON cl.teacher_id = s.teacher_id)"+
						"WHERE C.TEACHER_ID ="+session.getAttribute("Teacher_Id")+" AND S.SUBJECT_NAME='"+session.getAttribute("subject")+"'");
		while(rs2.next()){%>
		<tr>
			<td align="center"><%=a %>.</td>
			<td align="center"><%=rs2.getInt(1)%></td>
			<td><%=rs2.getString(2)%></td>
			<td><%=rs2.getString(3)%></td>
			<td><%=rs2.getString(5)%></td>
			<td align="center"><%=rs2.getString(4)%></td>
			<td align="center"><a href="Test.jsp?f1=<%=rs2.getInt(1)%>&f2=<%=rs2.getString(5)%>">Create Test</a></td>
			<td align="center"><a href="Assignment.jsp?f1=<%=rs2.getInt(1)%>">Create Assignment</a></td>
                        <td align="center"><a href="Books.jsp?f1=<%=rs2.getInt(1)%>&f2=<%=rs2.getString(2)%>">Upload Books</a></td>
			<td align="center"><a href="Upload_Video.jsp?f1=<%=rs2.getInt(1)%>">Upload Videos</a></td>
                        <td align="center"><a href="Delete_Chapter.jsp?f1=<%=rs2.getInt(1)%>" onclick="return next();">Delete</a></td>
		</tr>
		<%a++;}%>
		</table>
		<p>&nbsp;</p>
	</fieldset></div>
	</form>
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