package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.util.List;
import bachnph.Movie.MovieDTO;

public final class manageMovies_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>Manage Movies</title>\r\n");
      out.write("    <style>\r\n");
      out.write("        body {\r\n");
      out.write("            font-family: Arial, sans-serif;\r\n");
      out.write("            max-width: 800px;\r\n");
      out.write("            margin: 0 auto;\r\n");
      out.write("        }\r\n");
      out.write("        h1 {\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            color: #333;\r\n");
      out.write("        }\r\n");
      out.write("        table {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            border-collapse: collapse;\r\n");
      out.write("            margin: 20px 0;\r\n");
      out.write("        }\r\n");
      out.write("        table, th, td {\r\n");
      out.write("            border: 1px solid #ddd;\r\n");
      out.write("            padding: 8px;\r\n");
      out.write("        }\r\n");
      out.write("        th {\r\n");
      out.write("            background-color: #f2f2f2;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("        }\r\n");
      out.write("        td {\r\n");
      out.write("            text-align: center;\r\n");
      out.write("        }\r\n");
      out.write("        form {\r\n");
      out.write("            display: flex;\r\n");
      out.write("            flex-direction: column;\r\n");
      out.write("            gap: 10px;\r\n");
      out.write("            margin: 20px 0;\r\n");
      out.write("        }\r\n");
      out.write("        label {\r\n");
      out.write("            font-weight: bold;\r\n");
      out.write("        }\r\n");
      out.write("        input[type=\"text\"], input[type=\"number\"], textarea {\r\n");
      out.write("            padding: 8px;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("        }\r\n");
      out.write("        button {\r\n");
      out.write("            padding: 10px;\r\n");
      out.write("            background-color: #4CAF50;\r\n");
      out.write("            color: white;\r\n");
      out.write("            border: none;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("        }\r\n");
      out.write("        button.delete {\r\n");
      out.write("            background-color: #d9534f;\r\n");
      out.write("        }\r\n");
      out.write("        button.update {\r\n");
      out.write("            background-color: #5bc0de;\r\n");
      out.write("        }\r\n");
      out.write("        button:hover {\r\n");
      out.write("            opacity: 0.9;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    <h1>Manage Movies</h1>\r\n");
      out.write("\r\n");
      out.write("    <!-- Form to Add Movie -->\r\n");
      out.write("    <form id=\"addMovieForm\" onsubmit=\"addMovie(event)\" action=\"DispatchServlet\">\r\n");
      out.write("        <h2>Add Movie</h2>\r\n");
      out.write("        <label for=\"movieTitle\">Title:</label>\r\n");
      out.write("        <input name=\"movieTitle\" type=\"text\" id=\"movieTitle\" required>\r\n");
      out.write("\r\n");
      out.write("        <label for=\"movieName\">Name:</label>\r\n");
      out.write("        <input name=\"movieName\" type=\"text\" id=\"movieDirector\" required>\r\n");
      out.write("\r\n");
      out.write("        <label for=\"movieGenre\">Genre:</label>\r\n");
      out.write("        <input name=\"movieGenre\" type=\"text\" id=\"movieGenre\" required>\r\n");
      out.write("\r\n");
      out.write("        <label for=\"movieDuration\">Duration (mins):</label>\r\n");
      out.write("        <input name=\"movieDuration\" type=\"number\" id=\"movieDuration\" min=\"0\" required>\r\n");
      out.write("\r\n");
      out.write("        <label for=\"movieDescription\">Description:</label>\r\n");
      out.write("        <textarea name=\"movieSynopsis\" id=\"movieDescription\" rows=\"3\"></textarea>\r\n");
      out.write("        \r\n");
      out.write("        <lable for=\"movieImage\">Poster:</label>\r\n");
      out.write("        <input name=\"movieImage\" type=\"String\" id=\"moviePoster\" required>\r\n");
      out.write("        \r\n");
      out.write("\r\n");
      out.write("        <button name=\"btAction\" type=\"submit\" value=\"Add Movie\"></button>\r\n");
      out.write("    </form>\r\n");
      out.write("\r\n");
      out.write("    <!-- Movie List -->\r\n");
      out.write("    <h2>Movie List</h2>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    <table id=\"movieTable\">\r\n");
      out.write("        <thead>                       \r\n");
      out.write("            <tr>\r\n");
      out.write("                <th>Title</th>\r\n");
      out.write("                <th>Name</th>\r\n");
      out.write("                <th>Genre</th>\r\n");
      out.write("                <th>Duration</th>\r\n");
      out.write("                <th>Description</th>\r\n");
      out.write("                <th>Poster</th>\r\n");
      out.write("            </tr>            \r\n");
      out.write("        </thead>\r\n");
      out.write("        <tbody>\r\n");
      out.write("            ");
 
                ArrayList<MovieDTO> movieList = (ArrayList<MovieDTO>)request.getAttribute("movieList");
                for(MovieDTO moviedto: movieList){   
            
      out.write("\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td>");
      out.print( moviedto.getMovieTitle() );
      out.write("</td>\r\n");
      out.write("                <td>");
      out.print( moviedto.getMovieName() );
      out.write("</td>\r\n");
      out.write("                <td>");
      out.print( moviedto.getMovieGenre() );
      out.write("</td>\r\n");
      out.write("                <td>");
      out.print( moviedto.getMovieDuration() );
      out.write("</td>\r\n");
      out.write("                <td>");
      out.print( moviedto.getMovieSynopsis() );
      out.write("</td>\r\n");
      out.write("                <td><img src=\"");
      out.print( moviedto.getMovieImage() );
      out.write("\" alt=\"Poster\" style=\"width:50px;height:50px;\"></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            ");
 } 
      out.write("\r\n");
      out.write("        </tbody>\r\n");
      out.write("    </table>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("</body>\r\n");
      out.write("</html>>\r\n");
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
