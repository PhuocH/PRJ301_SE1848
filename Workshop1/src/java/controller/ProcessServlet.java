/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ProcessServlet", urlPatterns = {"/process"})
public class ProcessServlet extends HttpServlet {

    private final String loginPage = "login.jsp";
    private final String logoutServlet = "logout";

    private final String addCarServlet = "addcar";

    private final String updateCarPage = "updatecar.jsp";
    private final String updateCarServlet = "update";

    private final String deleteCarPage = "deletecar.jsp";
    private final String deleteCarServlet = "delete";

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
        String actionButton = request.getParameter("btnAction");
        String actionURL = request.getParameter("action");
        String url = loginPage;
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            /* TODO output your page here. You may use following sample code. */
            if (session.getAttribute("account") == null) {
                url = loginPage;
            } else {
                if (actionURL != null) {
                    switch (actionURL) {
                        case "add":
                            url = addCarServlet;
                            break;
                        case "update":
                            url = updateCarPage;
                            break;
                        case "delete":
                            url = deleteCarPage;
                            break;
                        case "logout":
                            url = logoutServlet;
                    }
                } else {
                    switch (actionButton) {
                        case "Create":
                            url = addCarServlet;
                            break;
                        case "Save":
                            url = updateCarServlet;
                            break;
                        case "Delete":
                            url = deleteCarServlet;
                            break;
                    }
                }
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
            out.close();
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
