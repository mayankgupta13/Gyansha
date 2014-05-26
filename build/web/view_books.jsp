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
                    <table align="center" cellspacing="5" cellpadding="5" width="110%" border="1" >
                        <tr>
                            <th>S.No.</th><th>Chapter Name</th><th>Book Name</th>  <th>Book Description</th><th>Book Type</th> <th>View</th>  <th>Delete</th>
                        </tr>
                         <%
            try
            {
                      int n=1;
                      String   path=getServletContext().getRealPath("/")+"\\file\\";
                        int teacher_id=(Integer)session.getAttribute("Teacher_Id");
                        Connection con=c.getConnection();
                        PreparedStatement ps1=con.prepareStatement("SELECT Book_Id,Book_Name,Description,Book_Type,Name_Url,Chapter_Name from New_Chapter as C join books as B on B.Chapter_Id=C.Chapter_Id where B.Teacher_Id="+teacher_id);
                        ResultSet rs=ps1.executeQuery();
			while(rs.next())
			{
			%>
                        <tr>
                            <td><%=n%></td>
                            <td><%=rs.getString("Chapter_Name")%></td>
                            <td><%=rs.getString("Book_Name")%></td>
                            <td><%=rs.getString("Description")%></td>
                            <td><%=rs.getString("Book_Type")%></td>
                            
                            
                            <%
                          if(rs.getString("Book_Type").equals("File"))
                          {
                              %>
                            <td><a href="view_teacher_book.jsp?file_name=<%=rs.getString("Name_Url") %>" >View</a></td>
                             <%
                          }
                        else
                          {
                              %>
                              <td><a href="<%=rs.getString("Name_Url")%>" target="_blank">View</a></td>
                            <% 
                          }
                            %>
                            <td><a href="delete_book.jsp?book_id=<%=rs.getString("Book_Id")%>&f2=<%=rs.getString("Name_Url")%>" onclick="return next();">Delete</a></td>
                            
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
     System.out.println(e+"Error in upload_book.jsp");
	response.sendRedirect("error.jsp");
}
%>
</html>
