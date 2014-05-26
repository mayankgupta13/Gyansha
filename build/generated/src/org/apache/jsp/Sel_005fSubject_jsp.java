package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Sel_005fSubject_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!-- \r\n");
      out.write("\tCreated By Mayank Gupta \r\n");
      out.write("\t\t\tTeacher_MS_Sel_Subject.jsp\t-->\r\n");
      out.write("\t\t\t\r\n");
      out.write("<!-- Selection of subject by teacher -->\r\n");
      com.MyConnection c = null;
      synchronized (session) {
        c = (com.MyConnection) _jspx_page_context.getAttribute("c", PageContext.SESSION_SCOPE);
        if (c == null){
          c = new com.MyConnection();
          _jspx_page_context.setAttribute("c", c, PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
try{ 
      out.write("\r\n");
      out.write("\r\n");
      out.write("    \r\n");
			//if no teacher login then goto Login.jsp page
		if(session.getAttribute("Teacher_Id")==null)
		{
			response.sendRedirect("Login.jsp");
		}
		else
		{
			
			Connection con = c.getConnection();
			Statement st=con.createStatement();
			int T_Id=(Integer)session.getAttribute("Teacher_Id");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("\r\n");
      out.write("<html lang=\"en-US\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\" />\r\n");
      out.write("<title>Easylearning.guru</title>\r\n");
      out.write("<link rel=\"canonical\" href=\"http://www.easylearning.guru/\" />\r\n");
      out.write("<link rel='stylesheet' id='jetpack-subscriptions-css'  href='css/subscriptions.css' type='text/css' media='all' />\r\n");
      out.write("<link rel='stylesheet' id='jetpack-widgets-css'  href='css/widgets.css' type='text/css' media='all' />\r\n");
      out.write("<link rel='stylesheet' id='themify-shortcodes-css'  href='css/shortcodes.css' type='text/css' media='all' />\r\n");
      out.write("<link rel='stylesheet' id='theme-style-css'  href='css/style1.css' type='text/css' media='all' />\r\n");
      out.write("<link rel='stylesheet' id='themify-media-queries-css'  href='css/media-queries.css' type='text/css' media='all' />\r\n");
      out.write("<link rel='stylesheet' id='google-fonts-css'  href='css/css.css' type='text/css' media='all' />\r\n");
      out.write("<link rel='stylesheet' id='pretty-photo-css'  href='css/lightbox.css' type='text/css' media='all' />\r\n");
      out.write("<link rel='stylesheet' id='themify-builder-style-css'  href='css/themify-builder-style.css' type='text/css' media='all' />\r\n");
      out.write("<link rel='stylesheet' id='sharedaddy-css'  href='css/sharing.css' type='text/css' media='all' />\r\n");
      out.write("<script type='text/javascript' src='js/jquery1.js'></script>\r\n");
      out.write("<script type='text/javascript' src='js/jquery-migrate.min.js'></script>\r\n");
      out.write("<meta name=\"generator\" content=\"WordPress 3.8.3\" />\r\n");
      out.write("<link rel='shortlink' href='http://easylearning.guru' />\r\n");
      out.write("\r\n");
      out.write("<!-- Open Graph Tags -->\r\n");
      out.write("<meta property=\"og:site_name\" content=\"easylearning.guru\" />\r\n");
      out.write("<meta property=\"og:url\" content=\"http://www.easylearning.guru\" />\r\n");
      out.write("<!-- End Open Graph Tags -->\r\n");
      out.write("<link rel=\"shortcut icon\" href=\"img/favicon.ico\" type=\"image/x-icon\"/>\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("\t\t//function for checking whether the teacher select subject or not \r\n");
      out.write("\tfunction check1() {\r\n");
      out.write("\t\tvar c=document.myform.subject.value;\r\n");
      out.write("                alert(c);\r\n");
      out.write("\t\tif(document.myform.subject.value==-1)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\talert(\"Please select subject first\");\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t//if teacher select subject then goto Main.jsp Page\r\n");
      out.write("\t\t\t\twindow.open(\"Main.jsp?f1=\"+c,\"_self\");\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"home blog skin-default gecko not-ie sidebar-none list-post\">\r\n");
      out.write("<div id=\"pagewrap\">\r\n");
      out.write("\t<div id=\"headerwrap\">\r\n");
      out.write("    \t\t<header id=\"header\" class=\"pagewidth\">        \r\n");
      out.write("\t\t\t<hgroup>\r\n");
      out.write("\t\t\t\t<h1><a href=\"easylearning.guru\" title=\"Easylearning.guru\"><img src=\"img/logo.png\" alt=\"Logo\"><!--Your logo here--></a></h1>\t\r\n");
      out.write("\t\t\t\t<h2 id=\"site-description\">Easylearning.guru.</h2>\r\n");
      out.write("\t\t\t</hgroup>\r\n");
      out.write("\t\r\n");
      out.write("            <nav id=\"main-nav-wrap\">\r\n");
      out.write("                <a id=\"menu-icon\" class=\"mobile-button\"></a>\r\n");
      out.write("\t\t\t</nav>\r\n");
      out.write("            <!-- /main-nav-wrap -->\r\n");
      out.write("\t\t\t<div id=\"social-wrap\">\t\r\n");
      out.write("\t\t\t\t<div class=\"social-widget\">\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<!-- /.social-widget -->\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<!-- /social-wrap -->\r\n");
      out.write("\t\r\n");
      out.write("\t\t</header>\r\n");
      out.write("\t\t<!-- /#header -->      \t\t\t\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- /#headerwrap -->\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"body\" class=\"clearfix\">\t\t\r\n");
      out.write("<!-- layout -->\r\n");
      out.write("<div id=\"layout\" class=\"pagewidth clearfix\">\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- content -->\r\n");
      out.write("\t<div id=\"content\">\r\n");
      out.write("\t<!--/welcome message -->\r\n");
      out.write("\r\n");
      out.write("\t<h1 class=\"post-title\">Welcome ");
      out.print(session.getAttribute("Teacher_Name") );
      out.write("</h1>\t\r\n");
      out.write("<p>&nbsp;</p>\r\n");
      out.write("<div>\r\n");
      out.write("<p>Main Page<br />&nbsp;\r\n");
      out.write("</p></div>\r\n");
      out.write("<div id='contact-form-8'>\r\n");
      out.write("<form action=\"\" method=\"get\" name=\"myform\" class='contact-form commentsblock'  onsubmit=\"return check();\">\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- Onselect call check1 function if it return true then goto main page i.e Main.jsp -->\r\n");
      out.write("\t<select class='g8-name'  name=\"subject\" >\r\n");
      out.write("            <option value=\"-1\" selected=\"selected\" onclick=\"return check1();\" >Select Section</option>\r\n");
      out.write("           \r\n");
      out.write("            \r\n");
      out.write("\t");

		ResultSet rs=st.executeQuery("select * from subjects where Teacher_Id="+T_Id);
		while(rs.next())
		{
                    
                  out.println("<option onclick='return check1()' value="+rs.getString(3)+" >"+rs.getString(3)+"</option>");
		}
	
      out.write("\r\n");
      out.write("            \r\n");
      out.write("\t</select>\t\r\n");
      out.write("\t<div><a href=\"Create_Chapter.jsp\" class='g8-name' onclick=\"return check1()\">Create Chapters</a></div>&nbsp;\r\n");
      out.write("\t<div><a href=\"Display_Chap.jsp\" class='g8-name' onclick=\"return check1()\">View Chapter</a></div>&nbsp;\r\n");
      out.write("\t<div><a href=\"Display_Assi.jsp\" class='g8-name' onclick=\"return check1()\">View Assignments</a></div>&nbsp;\r\n");
      out.write("\t<div><a href=\"Display_Sol.jsp\" class='g8-name' onclick=\"return check1()\">View Solutions</a></div>&nbsp;\r\n");
      out.write("\t<div><a href=\"Display_Test.jsp\" class='g8-name' onclick=\"return check1()\">View Test</a></div>&nbsp;\r\n");
      out.write("\t<div><a href=\"Logout.jsp\" class='g8-name'>Logout</a></div>&nbsp;\r\n");
      out.write("\t</article>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t<!-- /body -->\r\n");
      out.write("\t\t<!-- slider -->\r\n");
      out.write("\t\t\r\n");
      out.write("<link rel='stylesheet' id='grunion.css-css'  href='css/grunion.css' type='text/css' media='all' />\r\n");
      out.write("<script type='text/javascript' src='js/devicepx-jetpack.js'></script>\r\n");
      out.write("<script type='text/javascript' src='js/jquery.slider.js'></script>\r\n");
      out.write("<script type='text/javascript'>\r\n");
      out.write("/* <![CDATA[ */\r\n");
      out.write("var themifyScript = {\"lightbox\":{\"lightboxSelector\":\".lightbox\",\"lightboxOn\":true,\"lightboxContentImages\":false,\"lightboxContentImagesSelector\":\".post-content a[href$=jpg],.page-content a[href$=jpg],.post-content a[href$=gif],.page-content a[href$=gif],.post-content a[href$=png],.page-content a[href$=png],.post-content a[href$=JPG],.page-content a[href$=JPG],.post-content a[href$=GIF],.page-content a[href$=GIF],.post-content a[href$=PNG],.page-content a[href$=PNG],.post-content a[href$=jpeg],.page-content a[href$=jpeg],.post-content a[href$=JPEG],.page-content a[href$=JPEG]\",\"theme\":\"pp_default\",\"social_tools\":false,\"allow_resize\":true,\"show_title\":false,\"overlay_gallery\":false,\"screenWidthNoLightbox\":600,\"deeplinking\":false,\"contentImagesAreas\":\".post, .type-page, .type-highlight, .type-slider\",\"gallerySelector\":\".gallery-icon > a[href$=jpg],.gallery-icon > a[href$=gif],.gallery-icon > a[href$=png],.gallery-icon > a[href$=JPG],.gallery-icon > a[href$=GIF],.gallery-icon > a[href$=PNG],.gallery-icon > a[href$=jpeg],.gallery-icon > a[href$=JPEG]\",\"lightboxGalleryOn\":true},\"lightboxContext\":\"#pagewrap\",\"fixedHeader\":\"1\"};\r\n");
      out.write("/* ]]> */\r\n");
      out.write("</script>\r\n");
      out.write("<script type='text/javascript' src='js/themify.script.js'></script>\r\n");
      out.write("<script type='text/javascript' src='js/themify.gallery.js'></script>\r\n");
      out.write("<script type='text/javascript' src='js/lightbox.js'></script>\r\n");
      out.write("<script type='text/javascript' src='js/carousel.min.js'></script>\r\n");
      out.write("<script type='text/javascript' src='js/themify.builder.module.plugins.js'></script>\r\n");
      out.write("<script type='text/javascript' src='js/themify.builder.script.js'></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
		}
}
	catch(Exception e)
	{
		System.out.println(e);
		//if exception occur goto error.jsp page
		response.sendRedirect("error.jsp");	
	}

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
