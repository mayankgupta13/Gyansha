package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Add_005fAssignment_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\t\tPage Name:-\tTeacher_MS_Add_Assignment.jsp\t-->\r\n");
      out.write("\t\t\t\r\n");
      out.write("<!-- Add New Assignment SQL database command to store Assignment Data into the database-->\r\n");
      out.write(" \r\n");
      out.write(" ");
try{ 
		if(session.getAttribute("Teacher_Id")==null)
		{
			response.sendRedirect("Login.jsp"); //if user not login goto Login.jsp Page
		}
		else
		{
 
      out.write("\r\n");
      out.write(" \r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Add Assignment</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Final_Teacher","root","");
	int teacher_id=(Integer)session.getAttribute("Teacher_Id");
	int chapter_id=(Integer)session.getAttribute("chapter");
	int assignment_id=(Integer)session.getAttribute("Assi_Id");
	String file=(String)session.getAttribute("file");
	PreparedStatement ps=con.prepareStatement("insert into Chapter_Assignment values(?,?,?)");
	ps.setString(1, null);
	ps.setInt(2, teacher_id);
	ps.setInt(3, chapter_id);
	ps.executeUpdate();
	
	if(file.equals("File"))
	{
		String file_name=(String)session.getAttribute("File_Name");
	
		PreparedStatement ps1=con.prepareStatement("insert into Create_Assignment(Assignment_Id,File_Name,Assignment_Type) values(?,?,?)");
		ps1.setInt(1, assignment_id);
		ps1.setString(2, file_name);
		ps1.setString(3, file);
		ps1.executeUpdate();
		
      out.write("\r\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\talert(\"Add Assignment Successful\");\r\n");
      out.write("\t\t\t//if user select file then goto Main.jsp page after upload file and save into the database \r\n");
      out.write("\t\t\twindow.open(\"Display_Assi.jsp?f1=");
      out.print(session.getAttribute("subject"));
      out.write("\",\"_self\");\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t");

	}
	if(file.equals("Enter"))
	{
		PreparedStatement ps1=con.prepareStatement("insert into Create_Assignment(Assignment_Id,File_Name,Assignment_Type) values(?,?,?)");
		ps1.setInt(1, assignment_id);
		ps1.setString(2, "Entered");
		ps1.setString(3, "Enter");
		ps1.executeUpdate();
		
      out.write("\r\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t//if user select file then goto Main.jsp page after upload file and save into the database \r\n");
      out.write("\t\t\twindow.open(\"Assi_Questions.jsp\",\"_parent\");\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t");

	}

      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
	}
	}
	catch(Exception e)
	{
		System.out.println(e);
		//if Exception occur then goto error.jsp page
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
