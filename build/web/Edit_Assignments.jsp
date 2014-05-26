<%-- 
    Document   : Edit_Assignments
    Created on : May 20, 2014, 9:41:00 AM
    Author     : Administrator
--%>



<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
   <%@page import="java.util.*" %>
    <%@page import="java.util.TimeZone" %>
    <jsp:useBean id="c" class="com.MyConnection" scope="session"></jsp:useBean>
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
		int chapter_id=Integer.parseInt(request.getParameter("f3"));
		String question=null,question_type=null,explanation="";
		int question_id=Integer.parseInt(request.getParameter("f1"));
		int assignment_id=Integer.parseInt(request.getParameter("f2"));
		
		Connection con = c.getConnection();
		Statement st=con.createStatement();
		Statement st1=con.createStatement();
		ResultSet rs=st.executeQuery("SELECT Assignment_Question,Question_Type,explanation from Assignment_Questions where Question_Id="+question_id);
		while(rs.next())
		{
			question=rs.getString("Assignment_Question");
			question_type=rs.getString("Question_Type");
                        explanation=rs.getString("explanation");
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
         
       
//if user click on cancel button then goto Question_Display.jsp 

	//function for onclick on cancel button togo Display Questions page i.e Question_Display.jsp
	function back3()
	{
            
               
               
		window.open("View_Assignment.jsp?f1=<%=assignment_id%>&f2=<%=chapter_id%>","_self");
	}
    

	//function to delete particular question which teacher want to delete goto Delete_Assignment.jsp 
       function back2()
	{
           
               
                var c=confirm('Are you sure to delete question ?');
                if(c==true)
                {
                    window.open("Delete_Assignment_Question.jsp?f1=<%=assignment_id%>&f2=<%=question_id %>&f3=<%=chapter_id%>","_self");
                    return true;
                }
                else
                    return false;
		
	}

 
      /*  function check()
        {
             if(document.myform.question.value=="")
                        {
                            alert("Please enter question");
                            document.myform.question.focus();
                            return false;
                        }
            if(document.myform.question_type.value=="Multi")
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
			alert("Please Enter the Option 4");
                         document.myform.option5.focus();
			return false;
                        }
                        
              }*/
        
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
<form action="Update_Assignment.jsp?f1=<%=assignment_id %>&f2=<%=chapter_id%>" method='post' name="myform" class='contact-form commentsblock' onsubmit="return check();">
	<div>
		<label class='g8-name'>Question<span>(required)</span></label>
		<textarea rows="3" cols="70" name="question" id='g8-name' class='name'><%=question%></textarea>
	</div>
	<input type="hidden" name="question_id" value="<%=question_id%>">
        </div>
	<div>
		<label for='g8-name' class='g8-name'>Type of Question<span>(Required)</span></label>
		<select name="question_type" id='g8-name' class="name">
			<%if(question_type.equals("Single")){%>
				<option value="Single" id='g8-name' class="name" selected="selected">Single Choice Question</option>
				
			<%}%>
			<%if(question_type.equals("Multi")){%>
				
				<option value="Multi" id='g8-name' class="name" selected="selected">Multiple Choice Question</option>
			<%}%>
			
		</select>
	</div>
&nbsp;
			
	<%	//int i is user here for set auto increment values into options 
		ResultSet rs1=st1.executeQuery("select Option_Id,Options,Correct_Ans from Assignment_Options where Questions_Id="+question_id);
		while(rs1.next())
                {
                    %>
                    <input type="hidden" name="option_id<%=i%>" value="<%=rs1.getInt("Option_Id")%>" id='g8-name' class='name'/>
                    <div>
                     <label class='g8-name'>Option <%=i %><span></span></label>
                    </div>
                    <div>
                    <%
                    if(question_type.equals("Multi"))
                    {
                    %>
		
                       
			<%
                        if(rs1.getBoolean("Correct_Ans")==true)
                            {%>
				<input type="checkbox" name="c<%=i%>" value="1" checked="checked"  id='g8-name' class='name'>
                   
                          <%
                            }
			else{
                          %>
				<input type="checkbox" name="c<%=i%>" value="1"  id='g8-name' class='name'>
                    
                                <%
                              }
                            }
                         else
                         {
                               if(rs1.getBoolean("Correct_Ans")==true)
                                 {
                                %>
                                <input type="radio" name="r" value="a<%=i %>" checked="true"  id='g8-name' class='name'>
                                
                                    <%
                                  }
                               else
                               {
                                  %>
				<input type="radio" name="r" value="a<%=i %>"   id='g8-name' class='name'>
                                
                                <% 
                               }
                            } %>			
			&nbsp; &nbsp;<input type="text" name="option<%=i%>" value="<%=rs1.getString(2)%>" maxlength="100"  id='g8-name' class='name'>
                         </div>
                       <%
                    
                    
                i++;}%>
                            
                &nbsp;
                <div>
                 <label for='g8-name' class='g8-name'>Explanation<span>(Optional)</span></label>
                </div>
            <div>
			<textarea name="explanation"  class='name' id="area" ><%=explanation %></textarea>
                    </div>
	&nbsp;
	<p class='contact-submit'>
		<input type="submit" name='b1' id='g8-name' class='name' value="Submit" />&nbsp;
             
		<input type="button" name='b3' id='g8-name' class='name' value="Cancel"  onclick="back3()"/>&nbsp;
                <input type="button" name='b7' value="Delete" onclick="back2();"/>&nbsp;
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
		out.println(e);
	}
%>