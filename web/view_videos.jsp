<%-- 
    Document   : Books
    Created on : May 15, 2014, 3:38:24 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Books</title>
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

<!-- Chang URLs to wherever Video.js files will be hosted -->
  
<link href="css/video-js.css" rel="stylesheet" type="text/css">
  
<!-- video.js must be in the <head> for older IEs to work. -->
  <script src="js/video.js"></script>

  
<!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
  
<script>
    videojs.options.flash.swf = "video-js.swf";
  </script>



<title>Easylearning.guru</title>

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
    
      <%@ page import="java.sql.*"%>
 <jsp:useBean id="c" class="com.MyConnection" scope="session" /> 
 <%
                if(session.getAttribute("Teacher_Id")==null)
		{
			response.sendRedirect("Login.jsp"); //if user not login goto Login.jsp Page
		}
		if(session.getAttribute("subject")==null)
		{
			response.sendRedirect("Sel_Subject.jsp"); 
		}
 
 %>
    <body class="home blog skin-default gecko not-ie sidebar-none list-post" onload="return select();">
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
        <div><a href="Main.jsp?f1=<%=session.getAttribute("subject")%>" target="_self">Back to Main Page</a></div>
<div>
<p>&nbsp;</p>
<div>
	
	<div>
		<label class='g8-name'>Teacher Id :&nbsp;<%=session.getAttribute("Teacher_Id")%></label>
	</div>
	&nbsp;
	<div>
		<label class='g8-name'>Subject :&nbsp;<%=session.getAttribute("subject")%></label>
	</div>
	&nbsp;	
        &nbsp;
       
	&nbsp;
	<div id='contact-form-8'>
            
            
               
                <div>
                    <table align="center" cellspacing="5" cellpadding="5" width="110%"  >
                        <tr>
                            <th>S.No.</th><th>Chapter Name</th><th>Video Name</th>  <th>Video Description</th><th>View</th>  <th>Delete</th>
                        </tr>
                         <%
            try
            {
                    
                      int n=1;
                      String   path=getServletContext().getRealPath("/")+"\\file\\";
                     
                        int teacher_id=(Integer)session.getAttribute("Teacher_Id");
                        Connection con=c.getConnection();
                        PreparedStatement ps1=con.prepareStatement("SELECT Video_Id,Video_Name,Video_Description,File_Name,Chapter_Name from New_Chapter as C join videos as B on B.Chapter_Id=C.Chapter_Id where B.Teacher_Id="+teacher_id);
                        ResultSet rs=ps1.executeQuery();
			while(rs.next())
			{
                              System.out.println(path+"2a.mp4");
			%>
                        <tr>
                            <td align="center"><%=n%></td>
                            <td align="center"><%=rs.getString("Chapter_Name")%></td>
                            <td align="center"><%=rs.getString("Video_Name")%></td>
                            <td align="center"><%=rs.getString("Video_Description")%></td>
                             
                            <td align="center"><a href="#" >
                                  
                                
                                    <video id="example_video_<%=n %>" class="video-js vjs-default-skin" controls preload="none" width="540" height="250"
      poster="http://video-js.zencoder.com/oceans-clip.png"
      data-setup="{}">
   
                <source src="http://localhost:8080/Teacher_LMS/file/<%=rs.getString("File_Name")%>" type="video/mp4">
  

                <source src="http://localhost:8080/Teacher_LMS/file/<%=rs.getString("File_Name")%>" type='video/webm' />
                            <source src="http://localhost:8080/Teacher_LMS/file/<%=rs.getString("File_Name")%>" type='video/ogg' />
                            <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
                            <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
  
                        </video>
                                   
                                </a></td>
                            
                                <td align="center"><a href="Delete_Video.jsp?f1=<%=rs.getInt("Video_Id") %>&f2=<%=rs.getString("File_Name")%>" onclick="return next();">Delete</a></td>
                            
                        </tr>
                        <%
                            n++;
			}
                        
                        %>
                    </table>
                </div>
                
            
            </div>
	
	</div>
	</div>
	</div>
    </body>
     <%
               }
    catch(Exception e)
{
	out.println(e);
	//if exception occur goto error.jsp page
    
	response.sendRedirect("error.jsp");
}
%>
</html>
