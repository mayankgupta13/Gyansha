<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_Question_Display.jsp	-->
			
<!-- Display All question of select test and Edit questions also -->
<%try{ %>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
   <%@page import="java.util.*" %>
    <%@page import="java.util.TimeZone" %>
<%!	int section=1;
	String test_name=null;
%>
	<%
	if(session.getAttribute("Teacher_Id")==null)
	{
		response.sendRedirect("Login.jsp");
	}
	else
	{
		String subject=request.getParameter("f2");
		int Test_Id=Integer.parseInt(request.getParameter("f1"));
		int chapter_id=Integer.parseInt(request.getParameter("f2"));
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
		Statement st=con.createStatement();
		Statement st1=con.createStatement();
		ResultSet rs=st.executeQuery("SELECT Test_Name,No_of_Section from Create_Test where Test_Id='"+Test_Id+"'");
		while(rs.next())
		{
			test_name=rs.getString(1);
			section=rs.getInt(2);
		}
		
	
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

	//when click on Finish button goto Display_Test.jsp page for display all test	
	function gonext()
	{			
		var c=confirm("You want to final submission of your questions...?");
		if(c==true)
		{
			alert("Your questions have been submitted");
			window.open("Display_Test.jsp","_Self");
			return true;
		}
		else
			return false;		
	}
</script>
</head>
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

	<h1 class="post-title"><a href="www.easylearning.guru">Easylearning.guru Questions Details</a></h1>	
	
				<!-- Onclick goback to Main page i.e Main.jsp-->
<div>
<div>
<p>&nbsp;</p>
<div>
	<form action="Main.jsp?f1=<%=session.getAttribute("subject")%>" method="post">
	<div>
		<label class='g8-name'>Test Id :&nbsp;<%=Test_Id%></label>
	</div>
		&nbsp;
	<div>
		<label class='g8-name'>Subject :&nbsp;<%=session.getAttribute("subject")%></label>
	</div>
	<%if(test_name!=null){ %>
		<h3 align="center"><%=test_name%></h3>
	<%} %>
	<%for(int i=1;i<=section;i++){ %>
	<div id='contact-form-8'>
		<p>&nbsp;</p>
		<table cellspacing="5" cellpadding="5" width="110%" border="0">
		<caption>Section No.:&nbsp; <%=i%></caption>
		
		<% int a=1;%>
		<%ResultSet rs2=st.executeQuery("select Question_Id,Test_Questions from Test_Questions where Test_Id='"+Test_Id+"' AND Section_No='"+i+"'");
		while(rs2.next()){ int question_id=rs2.getInt(1);%>
	
		<tr><td><a href="Edit_Questions.jsp?f1=<%=question_id%>&f2=<%=i%>&f3=<%=Test_Id%>&f4=<%=chapter_id%>">Edit</a></td></tr><tr>
			<td width="5%" align="center"><%=a %>.</td>
			<td colspan="8"><%=rs2.getString(2) %>
			</tr>	
			<tr>	
				<%ResultSet rs3=st1.executeQuery("select Test_Options,Correct_Ans from Test_Options where Question_Id="+question_id);
				while(rs3.next())
				{%>
					<%if(rs3.getBoolean(2)==true){%>
					<td width="3%" align="right"><img src="img/Yes.png"></td>
					<td><font color="GREEN"><%=rs3.getString(1)%></font></td>
					<%}%>
					<%if(rs3.getBoolean(2)==false){%>
					<td width="3%" align="right"><img src="img/no.png"></td>
					<td><%=rs3.getString(1) %></td>
				<%}
			}a++;%>
			</tr>
			<tr>
			<td colspan="8">
			<hr></td>
			</tr>&nbsp;
		<%}%>
		</table>
		
	</div>
	<%}%>
		&nbsp;
		<p class='contact-submit'>
			<input type="button" name='t6' id='g8-name' class='name' value="Finish" onclick="gonext()" class='pushbutton-wide'/>	&nbsp;
		</p>
	</form>
	</div>
	</div>
	</div>
</body>
</html>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);
	//if exception occur goto error.jsp page
	response.sendRedirect("error.jsp");
}
%>