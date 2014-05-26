<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_Edit_Questions.jsp	-->
			
<!-- Edit Test Questions Form Page -->

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
   <%@page import="java.util.*" %>
    <%@page import="java.util.TimeZone" %>
 <%
    try
    {
 	int i=1,j=1;
	if(session.getAttribute("Teacher_Id")==null)
	{
		response.sendRedirect("Login.jsp"); //if user not login goto Login.jsp Page
	}
	else
	{
		String chapter_id=request.getParameter("f4");
		String question=null,question_type=null;
		String question_id=request.getParameter("f1");
		int section=Integer.parseInt(request.getParameter("f2"));
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
		Statement st=con.createStatement();
		Statement st1=con.createStatement();
		ResultSet rs=st.executeQuery("SELECT Test_Questions,Question_Type from Test_Questions where Question_Id='"+question_id+"'");
		while(rs.next())
		{
			question=rs.getString(1);
			question_type=rs.getString(2);
		}
		int Test_Id=Integer.parseInt(request.getParameter("f3"));
	%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
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

<!-- Open Graph Tags -->
<meta property="og:site_name" content="easylearning.guru" />
<meta property="og:url" content="http://www.easylearning.guru" />
<!-- End Open Graph Tags -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<script type="text/javascript">
//if user click on cancel button then goto Question_Display.jsp 

	//function for onclick on cancel button togo Display Questions page i.e Question_Display.jsp
	function back()
	{
		window.open("Question_Display.jsp?f1=<%=Test_Id%>&f2=<%=chapter_id%>&f3=<%=session.getAttribute("subject")%>","_self");
	}

	//function to delete particular question which teacher want to delete goto Delete_Test.jsp 
	function delques()
	{
		var c=confirm("You wnat to delete this question");
		if(c==true)
		{	window.open("Delete_Test.jsp?f1=<%=Test_Id%>&f2=del&f3=<%=question_id%>&f4=<%=chapter_id%>","_self");
			return true;}
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
	<!--/welcome message -->

	<h1 class="post-title">Edit Questions</h1>	

			<!-- Onclick goback to Main page i.e Main.jsp-->
<div><a href="Main.jsp?f1=<%=session.getAttribute("subject")%>" target="_self">Back to Main Page</a>
<div>
<p>&nbsp;</p>
<div>
<p>Enter the Question details<br />
<div id='contact-form-8'>

	<!-- Update edited question onsubmit goto abc.jsp page for update database-->
<form action="abc.jsp?f1=<%=Test_Id %>&f2=<%=chapter_id%>" method='post' name="myform" class='contact-form commentsblock' onsubmit="return check();">
	<div>
		<label class='g8-name'>Question<span>(required)</span></label>
		<textarea rows="3" cols="70" name="question" id='g8-name' class='name'><%=question%></textarea>
	</div>
	<input type="hidden" name="question_id" value="<%=question_id%>">
	<div>
		<label class='g8-name'>Section<span>(required)</span></label>
		<select id='g8-name' class='name' name="section" >
		<%for(j=1;j<=section;j++)
		{
			if(j==section)
				out.println("<option value="+j+" selected='selected'>"+j+"</option>");
			else
				out.println("<option value="+j+">"+j+"</option>");				
		}
		%>
		</select>
	</div>
	<div>
		<label for='g8-name' class='g8-name'>Type of Question<span>(Required)</span></label>
		<select name="question_type" id='g8-name' class="name">
			<%if(question_type.equals("Single")){%>
				<option value="Single" id='g8-name' class="name" selected="selected">Single Choice Question</option>
				<option value="Multiple" id='g8-name' class="name">Multi Choice Question</option>
			<%}%>
			<%if(question_type.equals("Multiple")){%>
				<option value="Single" id='g8-name' class="name">Single Choice Question</option>
				<option value="Multiple" id='g8-name' class="name" selected="selected">Multi Choice Question</option>
			<%}%>
			
		</select>
	</div>
			
	<%	//int i is user here for set auto increment values into options 
		ResultSet rs1=st1.executeQuery("select Option_Id,Test_Options,Correct_Ans from Test_Options where Question_Id="+question_id);
		while(rs1.next()){%>
		<input type="hidden" name="option_id<%=i%>" value="<%=rs1.getInt(1)%>" id='g8-name' class='name'/>
		<label class='g8-name'>Option <%=i %><span>(required)</span></label>
			<%if(rs1.getBoolean(3)==true){%>
				<input type="checkbox" name="checkbox<%=i%>" value="<%=i%>" checked="checked"  id='g8-name' class='name'><%}
			if(rs1.getBoolean(3)==false){%>
				<input type="checkbox" name="checkbox<%=i%>" value="<%=i%>"  id='g8-name' class='name'><%}%>			
			&nbsp; &nbsp;<input type="text" name="option<%=i%>" value="<%=rs1.getString(2)%>" maxlength="100"  id='g8-name' class='name'>
		<%i++;}%>
	&nbsp;
	<p class='contact-submit'>
		<input type="submit" name='b1' id='g8-name' class='name' value="Submit" class='pushbutton-wide'/>&nbsp;
		<input type="button" name='b7' id='g8-name' class='name' value="Delete" class='pushbutton-wide' onclick="delques()"/>&nbsp;
		<input type="button" name='b2' id='g8-name' class='name' value="Cancel" class='pushbutton-wide' onclick="back()"/>
	</p>
</form>
</div>
</div>			
	</div>
    </article>

		</div>
	<!-- /body -->
	
		<!-- slider -->
		
        <link rel='stylesheet' id='grunion.css-css'  href='css/grunion.css' type='text/css' media='all' />
<script type='text/javascript' src='js/devicepx-jetpack.js'></script>
<script type='text/javascript' src='js/jquery.slider.js'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var themifyScript = {"lightbox":{"lightboxSelector":".lightbox","lightboxOn":true,"lightboxContentImages":false,"lightboxContentImagesSelector":".post-content a[href$=jpg],.page-content a[href$=jpg],.post-content a[href$=gif],.page-content a[href$=gif],.post-content a[href$=png],.page-content a[href$=png],.post-content a[href$=JPG],.page-content a[href$=JPG],.post-content a[href$=GIF],.page-content a[href$=GIF],.post-content a[href$=PNG],.page-content a[href$=PNG],.post-content a[href$=jpeg],.page-content a[href$=jpeg],.post-content a[href$=JPEG],.page-content a[href$=JPEG]","theme":"pp_default","social_tools":false,"allow_resize":true,"show_title":false,"overlay_gallery":false,"screenWidthNoLightbox":600,"deeplinking":false,"contentImagesAreas":".post, .type-page, .type-highlight, .type-slider","gallerySelector":".gallery-icon > a[href$=jpg],.gallery-icon > a[href$=gif],.gallery-icon > a[href$=png],.gallery-icon > a[href$=JPG],.gallery-icon > a[href$=GIF],.gallery-icon > a[href$=PNG],.gallery-icon > a[href$=jpeg],.gallery-icon > a[href$=JPEG]","lightboxGalleryOn":true},"lightboxContext":"#pagewrap","fixedHeader":"1"};
/* ]]> */
</script>
<script type='text/javascript' src='js/themify.script.js'></script>
<script type='text/javascript' src='js/themify.gallery.js'></script>
<script type='text/javascript' src='js/lightbox.js'></script>
<script type='text/javascript' src='js/carousel.min.js'></script>
<script type='text/javascript' src='js/themify.builder.module.plugins.js'></script>
<script type='text/javascript' src='js/themify.builder.script.js'></script>
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