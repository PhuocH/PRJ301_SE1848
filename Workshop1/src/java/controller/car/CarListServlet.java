/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.car;

import dal.CarDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cars;
import model.User;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CarListServlet", urlPatterns = {"/carlist"})
public class CarListServlet extends HttpServlet {

    private final String carListPage = "carlist.jsp";
    private final String carlistUserPage = "carlistuser.jsp";

    private final String loginPage = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = carListPage;
        PrintWriter out = response.getWriter();
        String actionURL = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        try {
            if (user != null) {
                CarDAO carDao = new CarDAO();
                List<Cars> list = carDao.getAllCar();
                request.setAttribute("carList", list);
                if (user.isIsAdmin()) {
                    url = carListPage;
                } else {
                    url = carlistUserPage;
                }
                if (user.isIsAdmin() && actionURL.equalsIgnoreCase("viewUser")) {
                    url = carlistUserPage;
                }
            } else {
                url = loginPage;
            }

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
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
