<!-- 
	Created By Mayank Gupta 
			Page Name:- Teacher_MS_Question.jsp	-->
			
<!-- Create New Question for Test-->
<%try{ %>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
   <%@page import="java.util.*" %>
    <%@page import="java.util.TimeZone" %>
<%	int section=0;
	//if no teacher login then goto Login Page i.e Login.jsp
	if(session.getAttribute("Teacher_Id")==null)
	{
		response.sendRedirect("Login.jsp");
	}
	else
	{
		int question_id=Integer.parseInt(request.getParameter("f4"));
		int option_id=Integer.parseInt(request.getParameter("f5"));
		int chapter_id=Integer.parseInt(request.getParameter("f2"));
		int test_id=Integer.parseInt(request.getParameter("f1"));
		session.setAttribute("Test_Id", test_id);
		String subject=request.getParameter("f3"); 
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
		con.setAutoCommit(false);
		Statement st=con.createStatement();
		ResultSet rs1=st.executeQuery("SELECT No_of_Section FROM Create_Test where Test_Id="+session.getAttribute("Test_Id"));
		while(rs1.next())
		{
			section=rs1.getInt(1);
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
	
		//function for insert br tag when press enter 
	area = document.getElementById('area');
	document.onkeydown = function(e) {
    e = e || event; 
    if (e.keyCode == 13) { // escape
        document.getElementById('area').value+="<br>";
        return true;
    }}
    
    //function for submit all test questions when click on submit button 
	function gonext()
	{		var c=confirm("You want to submit your questions");
		if(c==true)
		{
			window.open("Copy_Test_Questions.jsp?f1=<%=test_id%>&f2=<%=chapter_id%>","_self");
			return true;
		}
		else
			return false;	
	}
    
    //function for checking validation of form
	function check()
	{
                        var c=0;
                        if(document.myform.checkbox1.checked==true)
                        {
                            c++;
                        }
                         if(document.myform.checkbox2.checked==true)
                        {
                            c++;
                        }
                         if(document.myform.checkbox3.checked==true)
                        {
                            c++;
                        }
                         if(document.myform.checkbox4.checked==true)
                        {
                            c++;
                        }
                        if(document.myform.question_type.value=="Multiple")
                        {
                             if(c<2)
                            {
                            alert("Please select atleast two option");
                            }
                        }
                        if(document.myform.question_type.value=="Single")
                        {
                             if(c<1)
                            {
                            alert("Please select Only One option");
                            }
                             if(c>1)
                            {
                            alert("Please do not select more than One options");
                            }
                        }

		if(document.myform.section.value =="-1")
	    {
	    	alert("Please select section");
	        document.myform.section.focus();
	        return false;
		}
		if(document.myform.question_type.value =="-1")
	    {
	    	alert("Please select type of question");
	        document.myform.question_type.focus();
	        return false;
		}
		if(document.myform.question.value=="")
                {
	    	alert("Please enter the Question");
	        document.myform.question.focus();
	        return false;
		}	    
		if(document.myform.option1.value=="")
                {
	      	alert("Please enter Option 1");
	       	document.myform.option1.focus();
	       	return false;
                }
	    if(document.myform.option2.value=="")
                {
	      	alert("Please Enter Option 2");
	       	document.myform.option2.focus();
	      	return false;
                }
	    if(document.myform.option3.value=="")
	    {
	      	alert("Enter Option 3");
	       	document.myform.option3.focus();
	       	return false;
	    }
	    if(document.myform.option4.value=="")
	    {
	      	alert("Enter Option 4");
	       	document.myform.option4.focus();
	     	return false;
	    }
	    var x;
	   	for(x=1;x<5;x++)
		{
			var s="checkbox"+i; 
	    	if(document.myform.s.checked==true)
	    	{
		    	document.myform.s.value="1";
	    	}
	    	else
	    	{
	    		document.myform.s.value="0";
		    }
		}
	}
        
</script>
</head>
<body  class="home blog skin-default gecko not-ie sidebar-none list-post">
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

	<h1 class="post-title">Create New Questions</h1>	
	
		<!-- Onclick goback to Main page i.e Main.jsp-->
<div>
<p>&nbsp;</p>
<div>
<p>Enter the question details<br />
<div id='contact-form-8'>
<form action="Question_Signup.jsp" method="post" name="myform" class='contact-form commentsblock' onsubmit="return check();">
	<input type="hidden" name="chapter_id" value=<%=chapter_id %>><input type="hidden" name="subject" value=<%=subject %>>
	<div>
		<label class='g8-name'>Question Id :&nbsp;<%=question_id%></label>
	</div>
	&nbsp;
	<input type="hidden" name="question_id" value="<%=question_id%>">
	<input type="hidden" name="option_id" value="<%=option_id%>">
	<input type="hidden" name="test_id" value="<%=session.getAttribute("Test_Id")%>">
	<div>
		<label class='g8-name'>Section<span>(required)</span></label>
		<select id='g8-name' class='name' name="section" ><option value="-1" selected="selected">Select Section
		<%for(int i=1;i<=section;i++)
		{
			out.println("<option value="+i+">"+i+"</option>");
		}
		%>
		</select>
	</div>
	&nbsp;
	<div>	
		<label class='g8-name'>Test Id :&nbsp;<%=session.getAttribute("Test_Id")%></label>
	</div>
	&nbsp;
	<div>
		<label class='g8-name'>Question<span>(required)</span></label>
		<textarea rows="3" cols="60" name="question" id="area" class='name'></textarea>
	</div>
	<div>
		<label for='g8-name' class='g8-name'>Type of Question<span>(Required)</span></label>
		<select name="question_type" id='g8-name' class="name">
			<option value="-1" selected="selected" id='g8-name' class="name">Please select type of question</option>
			<option value="Single" id='g8-name' class="name">Single Choice Question</option>
			<option value="Multiple" id='g8-name' class="name">Multi Choice Question</option>
		</select>
	</div>
	<div>
		<label for='g8-name' class='g8-name'>Option 1<span></span></label><input type="checkbox" name="checkbox1" value="0">&nbsp;<input type="text" id='g8-name' class='name' name="option1" maxlength="100">
		<label for='g8-name' class='g8-name'>Option 2<span></span></label><input type="checkbox" name="checkbox2" value="0">&nbsp;<input type="text" id='g8-name' class='name' name="option2" maxlength="100">
	
		<label for='g8-name' class='g8-name'>Option 3<span></span></label><input type="checkbox" name="checkbox3" value="0">&nbsp;<input type="text" id='g8-name' class='name' name="option3" maxlength="100">
		<label for='g8-name' class='g8-name'>Option 4<span></span></label><input type="checkbox" name="checkbox4" value="0">&nbsp;<input type="text" id='g8-name' class='name' name="option4" maxlength="100">
	</div>	&nbsp;&nbsp;
		<p class='contact-submit'>
			<input type="submit" name='t6' id='g8-name' class='name' value="Add" class='pushbutton-wide'/>	&nbsp;
			<input type="button" id='g8-name' class='name' value="Submit" class='pushbutton-wide' onclick="gonext()"/>	&nbsp;
			<input type="reset" id='g8-name' class='name' value="Reset" class='pushbutton-wide'/>
		</p>
	
</form>
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