<%-- 
    Document   : Upload_Video
    Created on : May 16, 2014, 9:56:39 AM
    Author     : Administrator
--%>

<jsp:useBean id="c" class="com.MyConnection" scope="session"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%
                try
                {
                int number=0;
		if(session.getAttribute("Teacher_Id")==null)
		{
			response.sendRedirect("Login.jsp"); //if user not login goto Login.jsp Page
		}
		else if(session.getAttribute("subject")==null)
		{
			response.sendRedirect("Sel_Subject.jsp"); 
		}
		else
		{
			
			Connection con =c.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("SELECT Video_Id FROM videos ORDER BY Video_Id DESC LIMIT 1");
			while(rs.next())
			{
				number=rs.getInt(1);
			}
			number+=1;
			session.setAttribute("Video_Id", number);
			int chapter=Integer.parseInt(request.getParameter("f1"));
			con.close();
			session.setAttribute("chapter", chapter);
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
	
	function check()
	{
		if(document.myform.video_name.value=="")
		{
			alert("Please enter video name");
			return false;
		}
		if(document.myform.file.value=="")
		{
			alert("Please select file to upload");
			return false;
		}
		
	}

	function Submit()
	{
                var video_name=document.myform.video_name.value;
		var video_description=document.myform.video_description.value;
                var file=document.myform.file.value;
                
		document.myform.action=("Upload_Chapter_Video.jsp?video_name="+video_name+"&video_description="+video_description+"&file="+file);
	}
	
</script>
</head>
<body  class="home blog skin-default gecko not-ie sidebar-none list-post" >
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

	<h1 class="post-title"><a href="www.easylearning.guru">Easylearning.guru Assignment Page</a></h1>	
<div><a href="Main.jsp?f1=<%=session.getAttribute("subject")%>" class='g8-name'>Go to HomePage</a></div>&nbsp;
<div>
&nbsp;
<p>Enter the Video Details<br />
    
    <div><label class='g8-name'>Video Id :	<%=number %></label></div>&nbsp;
    
	<div><label class='g8-name'>Teacher Id :	<%=session.getAttribute("Teacher_Id") %></span></label></div>&nbsp;
<div id='contact-form-8'>
    <form action="" method="post" name="myform" class='contact-form commentsblock' enctype="multipart/form-data" onsubmit="return check();">
	
	<div>
		<label for='g8-name' class='g8-name'>Video Name<span>(Required)</span></label>
		 <input type='text' name='video_name' />
	</div>
        <div>
		<label for='g8-name' class='g8-name'>Video Description<span>(Optional)</span></label>
		   <textarea name="video_description"  class='name' id="area"></textarea>
	</div>
	<div>
          <label>Select File<span>(Required)</span></label><input type="file" name="file" id='g8-name' class='name'>
        </div>
        <div>&nbsp;</div>
	<div  class='contact-submit'>
			
            <input type='submit' value='Submit' name="b2" class='pushbutton-wide' onclick="Submit();"/>
	</div>
	
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
                System.out.println("Error in Assignment");
		response.sendRedirect("error.jsp");
	}
%>