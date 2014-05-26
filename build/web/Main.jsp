<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_Main.jsp	-->
			
<!-- Teacher Main page where teacher after Login do various tasks-->
<jsp:useBean id="c" class="com.MyConnection" scope="session"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%
    try
    {
    int subject_id=0;
	String subject=request.getParameter("f1");
        System.out.println(subject);
	if(subject==null)
	{
		response.sendRedirect("Sel_Subject.jsp");
	}
			//if no teacher login then goto Login page i.e Login.jsp
		if(session.getAttribute("Teacher_Id")==null)
		{
			response.sendRedirect("Login.jsp");
		}
		else
		{
			int teacher_id=(Integer)session.getAttribute("Teacher_Id");
			session.setAttribute("subject", subject);
			
			Connection con =c.getConnection();
			PreparedStatement ps=con.prepareStatement("delete from temp_test_questions");
			ps.executeUpdate();
			PreparedStatement ps1=con.prepareStatement("delete from temp_test_options");
			ps1.executeUpdate();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("Select * from subjects where Subject_Name='"+subject+"' AND Teacher_Id="+teacher_id);
			while(rs.next())
			{
				subject_id=rs.getInt(1);
			}			
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
function preventBack(){window.history.forward();}
setTimeout("preventBack()", 0);
window.onunload=function(){null};
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

	<h1 class="post-title">Welcome <%=session.getAttribute("Teacher_Name") %></a></h1>	
<p>&nbsp;</p>
<div>
<p>Main Page<br />
</p></div>
<div><label for='g8-name' class='g8-name'>Subject :&nbsp;<%=session.getAttribute("subject")%></label> </div>&nbsp;

<div id='contact-form-8'>


<form action="" method="post" name="myform" class='contact-form commentsblock' enctype="multipart/form-data">
	
		<!-- Create New Chapter onclick goto Create New Chapter Page i.e. Create_Chapter.jsp -->
	<div><a href="Create_Chapter.jsp?f1=<%=subject_id%>" class='g8-name'>Create Chapters</a></div>&nbsp;
	
		<!-- Display all Chapter onclick goto Display Chapters/ Create Test/ Create Assignment Page i.e. Display_Chap.jsp -->
	<div><a href="Display_Chap.jsp" class='g8-name'>View Chapter</a></div>&nbsp;
		
		<!-- Display all Assignment onclick goto Display Assignment/ Upload Assignment Solutions page i.e. Display_Assi.jsp -->
	<div><a href="Display_Assi.jsp" class='g8-name'>View Assignments</a></div>&nbsp;
	
		<!-- Display all Solutions onclick goto Display Uploaded Solutions page i.e. Display_Assi.jsp -->
	<div><a href="Display_Sol.jsp" class='g8-name'>View Solutions</a></div>&nbsp;
	
		<!-- Display all Tests onclick goto Display Test/Edit Test/Delete Test page i.e. Display_Test.jsp -->
	<div><a href="Display_Test.jsp" class='g8-name'>View Test</a></div>&nbsp;
	
		<!-- View Books -->
	<div><a href="view_books.jsp" class='g8-name'>View Books</a></div>&nbsp;
        <!-- View Videos -->
	<div><a href="view_videos.jsp" class='g8-name'>View Videos</a></div>&nbsp;
	
		<!-- Change Subject onclick goto Change Subject page i.e. Sel_Subject.jsp -->
	<div><a href="Sel_Subject.jsp" class='g8-name'>Change Subject</a></div>&nbsp;
	
	<div><a href="Logout.jsp" class='g8-name'>Logout</a></div>&nbsp;
</form>
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
<%		}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>