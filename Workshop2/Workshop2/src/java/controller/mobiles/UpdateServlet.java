/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.mobiles;

import dal.MobileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Mobiles;
import model.Producer;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="UpdateServlet", urlPatterns={"/update"})
public class UpdateServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String priceStr = request.getParameter("price");
        String yearStr = request.getParameter("year");
        String description = request.getParameter("description");
        String producerStr = request.getParameter("producer");
        String quantityStr = request.getParameter("quantity");
        String saleStr = request.getParameter("sale");
        
        try {
            float price = Float.parseFloat(priceStr);
            int year = Integer.parseInt(yearStr);
            int quantity = Integer.parseInt(quantityStr);
            int producer = Integer.parseInt(producerStr);
            boolean sale = Boolean.parseBoolean(saleStr);
            MobileDAO mobDao = new MobileDAO();
            mobDao.updateMobile(description, price, name, year, image, quantity, sale, producer, id);
            response.sendRedirect("manager");
        } catch (IOException | NumberFormatException e) {
            System.out.println(e.getMessage());
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id = request.getParameter("id");

        try {
            MobileDAO mobDao = new MobileDAO();
            List<Producer> listP = mobDao.getAllProducer();
            
            request.setAttribute("listP", listP);
            Mobiles mob = mobDao.getMobileById(id);
            request.setAttribute("detail", mob);
            request.getRequestDispatcher("Edit.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
            System.out.println(e.getMessage());
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
