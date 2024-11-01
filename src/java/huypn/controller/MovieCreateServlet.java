/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huypn.controller;

import bachnph.Movie.MovieDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MovieCreateServlet", urlPatterns = {"/MovieCreateServlet"})
public class MovieCreateServlet extends HttpServlet {

 private final String MANAGEMOVIE_PAGE= "manageMovies.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean result;
        String url= MANAGEMOVIE_PAGE;
        try{
            String movieName = request.getParameter("movieName");
            String movieImage = request.getParameter("movieImage");
            String movieTitle = request.getParameter("movieTitle");
            String movieGenre = request.getParameter("movieGenre");
            String movieDuration = request.getParameter("movieDuration");
            String movieSynopsis = request.getParameter("movieSynopsis");
            MovieDAO dao= new MovieDAO();
            int intDuration = Integer.parseInt(movieDuration);
            
            result= dao.addMovie(movieName, movieTitle, movieImage, movieGenre, intDuration, movieSynopsis);
            if(result == false){
                url= "invalid.html";
            }else{
                url="DispatchServlet?btAction=Go to Manage Movie";
            }
        }catch(ClassNotFoundException ex){
            System.out.println("Class not found" + ex.getMessage());
        }catch(SQLException e){
            System.out.println("Sql Exception" +e.getMessage());
        }
        finally{
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
