/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huypn.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hien
 */
public class DispatchServlet extends HttpServlet {
    private final String LOGIN_PAGE="login.html";
    private final String LOGIN_CONTROLLER="LoginServlet";
    private final String SHOW_SCREEN_USER="ShowScreenUserServlet";
    private final String MOVIE_CONTROLLER="MovieServlet";
    private final String SIGNUP_CONTROLLER="SignInServlet";
    private final String MOVIECREATE_CONTROLLER="MovieCreateServlet";
    private final String DETAIL_CONTROLLER="ShowDetailServlet";
    private final String DELETE_MOVIE_CONTROLLER="MovieDeleteServlet";
    private final String DETAIL_FOR_UPDATE_CONTROLLER="ShowDetailForUpdateServlet";
    private final String UPDATE_MOVIE_CONTROLLER="UpdateMovieServlet";
    private final String SCREEN_CONTROLLER="ScreenServlet";
    private final String CREATE_SCREEN_CONTROLLER="CreateScreenServlet";
    private final String SHOW_SEAT_CONTROLLER="ShowSeatServlet";
    private final String MANAGE_SEAT_CONTROLLER="ManageSeatServlet";
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
       String button = request.getParameter("btAction");
       String url=LOGIN_PAGE;
       try{
           if(button==null){
               
           }else if(button.equals("Login")){
               url=LOGIN_CONTROLLER;
           }
           else if(button.equals("Go to Manage Movie")){
               url=MOVIE_CONTROLLER;
           }
          else if(button.equals("Sign Up")){
               url=SIGNUP_CONTROLLER;
           }
          else if(button.equals("Add Movie")){
               url=MOVIECREATE_CONTROLLER;
           }
          else if(button.equals("Add Screen")){
               url=CREATE_SCREEN_CONTROLLER;
           }
          else if(button.equals("Play")){
               url=DETAIL_CONTROLLER;
           }
          else if(button.equals("Update")){
               url=DETAIL_FOR_UPDATE_CONTROLLER;
           }
          else if(button.equals("Buy ticket")){
               url=SHOW_SCREEN_USER;
           }
          else if(button.equals("Delete")){
               url=DELETE_MOVIE_CONTROLLER;
           }
          else if(button.equals("Save")){
               url=UPDATE_MOVIE_CONTROLLER;
           }
          else if(button.equals("Go to Manage Screen")){
               url=SCREEN_CONTROLLER;
           }
          else if(button.equals("Choose")){
               url=SHOW_SEAT_CONTROLLER;
           }
           else if(button.equals("Manage Seat")){
               url=MANAGE_SEAT_CONTROLLER;
           }
           
       }finally{
           RequestDispatcher rd=request.getRequestDispatcher(url);
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
