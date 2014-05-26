<!-- 
	Created By Mayank Gupta 
		Page Name:-	Teacher_MS_Assi_.jsp	-->
			
<!-- Add Assignment Questions Form Page -->

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
		else
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("SELECT Question_id FROM Assignment_Questions ORDER BY Question_Id DESC LIMIT 1");
			while(rs.next())
			{
				number=rs.getInt(1);
			}
				number+=1;
			session.setAttribute("Ques_Id", number);
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
	//function for set hidden unselected options or set visible to selected options 
	function select()
	{
		var v=document.myform.ques_type.value;
               
		if(v=="Text")
		{ 
                    
			document.getElementById("hide_file").style.visibility='visible';
			document.getElementById("type_single").style.visibility='hidden';
                        document.getElementById("type_multiple").style.visibility='hidden';
		}
		else if(v=="Multi")
		{	
			document.getElementById("hide_file").style.visibility='hidden';
			document.getElementById("type_multiple").style.visibility='visible';
                        document.getElementById("type_single").style.visibility='hidden';
		}
                else if(v=="Single")
                {
                        document.getElementById("hide_file").style.visibility='hidden';
			document.getElementById("type_single").style.visibility='visible';
                        document.getElementById("type_multiple").style.visibility='hidden';
                }
                else
                {
                        document.getElementById("hide_file").style.visibility='hidden';
			document.getElementById("type_single").style.visibility='hidden';
                        document.getElementById("type_multiple").style.visibility='hidden';
                }
	}
	//gonext
        function gonext()
	{
            var c=confirm("You want to submit your Assignment");
		if(c==true)
		{
			window.open("Display_Chap.jsp","_self");
			return true;
		}
		else
			return false;	
	}
	//Fucntion for check validation of forms
	function check()
	{
		
		if(document.myform.ques_type.value=="-1")
		{
			alert("Please select type of Question");
			return false;
		}
		if(document.myform.ques.value=="")
		{
			alert("Please enter the Question");
                        document.myform.ques.focus();
			return false;
		}	
		if(document.myform.ques_type.value=="Single")
		{
                       
                        if(document.myform.op1.value=="")
                        {
                            alert("Please Enter the Option 1");
                            document.myform.op1.focus();
                            return false;
                        }	
                        if(document.myform.op2.value=="")
                        {
                            alert("Please Enter the Option 2");
                            document.myform.op2.focus();
                            return false;
                        }	
                        if(document.myform.op3.value=="")
                        {
                            alert("Please Enter the Option 3");
                            document.myform.op3.focus();
                            return false;
                        }	
                        if(document.myform.op4.value=="")
                        {
			alert("Please Enter the Option");
                        document.myform.op3.focus();
			return false;
                        }
                }
                if(document.myform.ques_type.value=="Multi")
		{
                        var c=0;
                        if(document.myform.c1.checked==true)
                        {
                            c++;
                        }
                         if(document.myform.c2.checked==true)
                        {
                            c++;
                        }
                         if(document.myform.c3.checked==true)
                        {
                            c++;
                        }
                         if(document.myform.c4.checked==true)
                        {
                            c++;
                        }
                        if(c<2)
                        {
                            alert("Please select atleast two option");
                        }
                        if(document.myform.option1.value=="")
                        {
                            alert("Please Enter the Option 1");
                            document.myform.option1.focus();
                            return false;
                        }	
                        if(document.myform.option2.value=="")
                        {
                            alert("Please Enter the Option 2");
                             document.myform.option2.focus();
                            return false;
                        }	
                        if(document.myform.option3.value=="")
                        {
                            alert("Please Enter the Option 3");
                             document.myform.option3.focus();
                            return false;
                        }	
                        if(document.myform.option4.value=="")
                        {
			alert("Please Enter the Option");
                         document.myform.option5.focus();
			return false;
                        }
                }
		if(document.myform.ques_type.value=="Text")
		{
                       
			if(document.myform.ans.value=="")
			{
				alert("Please enter the answer");
                                document.myform.ans.focus();
				return false;	
			}
                        
		}	
		
	}

	//function for insert br tag when we press enter
	document.onkeydown = function(e) {
		var area = document.getElementById('area');
	    e = e || event; 
	    if (e.keyCode == 13) { // escape
	        document.getElementById('area').value+="<br>";
	        return true;
	    }}
</script>
</head>
<body class="home blog skin-default gecko not-ie sidebar-none list-post" onload="select();">
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

	<h1 class="post-title"><a href="www.easylearning.guru">Easylearning.guru Assignment Questions Page</a></h1>	
<div><a href="Main.jsp?f1=<%=session.getAttribute("subject")%>" target="_self">Back to Main Page</a>
<div>
<p>&nbsp;</p>
<div>
<p>Enter the Assignment Questions<br />
<div id='contact-form-8'>

<!-- Onsubmit Check the validation of form by call check() fucntion  if validation is true the goto Add_Questions.jsp Page-->
<form action="Add_Ass_Quistion.jsp" method="get" name="myform" class='contact-form commentsblock' onsubmit="return check();">
	<div><label class='g8-name'> Assignment Id :	<%=session.getAttribute("Assi_Id") %></label></div>&nbsp;
	<div><label class='g8-name'>Teacher Id :	<%=session.getAttribute("Teacher_Id") %></label></div>&nbsp;
	<div><label class='g8-name'>Question Id :	<%=session.getAttribute("Ques_Id") %></label></div>&nbsp;		
	<div>
		<label for='g8-name' class='g8-name'>Subject<span>(Required)</span></label>
		<input type='text' name='subject' id='g8-name' class='name' value="<%=session.getAttribute("subject")%>" readonly="readonly"/>
	</div>

	<div>
		<label for='g8-name' class='g8-name'>Type of Question<span>(Required)</span></label>
                <select name="ques_type" id='g8-name' class="name" onchange="select();">
                        <option value="Multi" class="name" >Multi Choice Question</option>
			<option value="Single" class="name" >Single Choice Question</option>
			<option value="Text" class="name" >Text</option>
		</select>
	</div>
	<div>
		<label for='g8-name' class='g8-name'>Question<span>(Required)</span></label>
		<textarea rows="5" cols="55" name="ques"  class='name' id="area"></textarea>
	</div>	
        
        <div id="type_single">
            <label for='g8-name' class='g8-name'>Option 1<span></span></label><input type="radio" name="r" value="a" checked="true">&nbsp; <input type="text" id='g8-name' class='name' name="op1" maxlength="100">
		<label for='g8-name' class='g8-name'>Option 2<span></span></label><input type="radio" name="r" value="b">&nbsp;<input type="text" id='g8-name' class='name' name="op2" maxlength="100">
	
		<label for='g8-name' class='g8-name'>Option 3<span></span></label><input type="radio" name="r" value="c">&nbsp;<input type="text" id='g8-name' class='name' name="op3" maxlength="100">
		<label for='g8-name' class='g8-name'>Option 4<span></span></label><input type="radio" name="r" value="d">&nbsp;<input type="text" id='g8-name' class='name' name="op4" maxlength="100">
		
                 <label for='g8-name' class='g8-name'>Explanation<span>(Optional)</span></label>
			<textarea name="exp2"  class='name' id="area"></textarea>
	</div>
        
        <div id="hide_file">
		<label for='g8-name' class='g8-name'>Answer<span>(Required)</span></label>
		<textarea name='ans'  class='name' id="area"></textarea>
                
                    <label for='g8-name' class='g8-name'>Explanation<span>(Optional)</span></label>
			<textarea name="exp1"  class='name' id="area"></textarea>
		
	</div>
        
	<div id="type_multiple">
            <label for='g8-name' class='g8-name'>Option 1<span></span></label><input type="checkbox" name="c1" value="1" >&nbsp; <input type="text" id='g8-name' class='name' name="option1" maxlength="100">
		<label for='g8-name' class='g8-name'>Option 2<span></span></label><input type="checkbox" name="c2" value="1" >&nbsp;<input type="text" id='g8-name' class='name' name="option2" maxlength="100">
	
		<label for='g8-name' class='g8-name'>Option 3<span></span></label><input type="checkbox" name="c3" value="1" >&nbsp;<input type="text" id='g8-name' class='name' name="option3" maxlength="100">
		<label for='g8-name' class='g8-name'>Option 4<span></span></label><input type="checkbox" name="c4" value="1">&nbsp;<input type="text" id='g8-name' class='name' name="option4" maxlength="100">
		
                 <label for='g8-name' class='g8-name'>Explanation<span>(Optional)</span></label>
			<textarea name="exp3"  class='name' id="area"></textarea>
	</div>
	
        <div>&nbsp;</div>
               
		<div class='contact-submit'>
			<input type='submit' value='Add' name="b1" class='pushbutton-wide' />
			<input type='button' value='Submit' name="b2" class='pushbutton-wide' onclick="return gonext();"/>
		</div>
        	</form>

	</div>
	
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
		//if exception occur then goto error.jsp page
		response.sendRedirect("error.jsp");
	}
%>