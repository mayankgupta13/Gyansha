<%-- 
    Document   : Books
    Created on : May 14, 2014, 3:38:24 PM
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

<title>Easylearning.guru</title>

<meta property="og:site_name" content="easylearning.guru" />
<meta property="og:url" content="http://www.easylearning.guru" />
<!-- End Open Graph Tags -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">

<script type="text/javascript">
   
   
	function select()
	{
		var v=document.myform.type.value;
		if(v=="File")
		{ 
			document.getElementById("hide_file").style.visibility='visible';
			document.getElementById("b2").style.visibility='hidden';
		}
		else if(v=="URL")
		{ 
			document.getElementById("hide_file").style.visibility='hidden';
			document.getElementById("b2").style.visibility='visible';
                       
		}
		else
		{	
			document.getElementById("hide_file").style.visibility='hidden';
			document.getElementById("b2").style.visibility='hidden';
		}
		
	}
	function check()
	{
		if(document.myform.book_name.value=="")
		{
			alert("Please enter book name");
			return false;
		}
		if(document.myform.type.value=="-1")
		{
			alert("Please select type of assignment");
			return false;
		}
		if(document.getElementById("hide_file").style.visibility=="visible")
		{
			if(document.myform.book.value=="")
			{
				alert("Please select book to upload");
				return false;
			}
		}
                if(document.getElementById("b2").style.visibility=="visible")
		{
			if(document.myform.url.value=="")
			{
				alert("Please enter url of book");
				return false;
			}
		}	
	}

	function Submit()
	{
                
		 var book_name=document.myform.book_name.value;
                 var book_description=document.myform.book_description.value;
                 var book_type=document.myform.type.value;
                 var book=document.myform.book.value;
                 var url=document.myform.url.value;
                 document.myform.action=("upload_book.jsp?book_name="+book_name+"&book_description="+book_description+"&book_type="+book_type+"&book="+book+"&url="+url);
	}
	
</script>

    </head>
    
       
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
        <%
        int chapter_id=Integer.parseInt(request.getParameter("f1"));
        String chapter=request.getParameter("f2");
        session.setAttribute("chapter", chapter_id);
        %>
	<div>
		<label class='g8-name'>Chapter Name:&nbsp;<%=chapter %></label>
	</div>
	&nbsp;
	<div id='contact-form-8'>
            
            <form action="" method="post" name="myform" class='contact-form commentsblock' enctype="multipart/form-data" onsubmit="return check();">
               
                <div>
		<label for='g8-name' class='g8-name'>Book Name<span>(Required)</span></label>
                </div>
                <div>
		<input type='text' name='book_name' id='g8-name'  class='name' />
                </div>
                  <div>&nbsp;</div>
                 <div>
		<label for='g8-name' class='g8-name'>Book Description</span></label>
                 </div>
                  <div>
               <textarea name="book_description"  class='name' id="area"></textarea>
                  </div>
                   <div>&nbsp;</div>
                   <div>
		<label for='g8-name' class='g8-name'>Type<span>(Required)</span></label>
		<select name="type" id='g8-name' class="name" onclick="select();">
			
			<option value="URL" id='g8-name' class="name">URL</option>
			<option value="File" id='g8-name' class="name">Upload Book</option>
		</select>
		</div>
                   <div>&nbsp;</div>
                   <div id="b2" class='contact-submit'>
			
                      
		<input type='text' name='url' placeholder="Enter URL"/>
                <div>&nbsp;</div>
            <input type='submit' value='Submit' name="b2" class='pushbutton-wide' onclick="Submit()"/>
	</div>
	<div id="hide_file">
			<label>Select File<span>(Required)</span></label><input type="file" name="book" id='g8-name' class='name'>
		<div>&nbsp;</div>
		<div class='contact-submit'>
				<input type='submit' value='Upload' name="b1" class='pushbutton-wide' onclick="Submit()"/>
		</div>
	</div>
                   
            
            </form>
            
            </div>
	
	</div>
	</div>
	</div>
    </body>
</html>
