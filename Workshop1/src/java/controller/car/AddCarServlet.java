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
@WebServlet(name = "AddCarServlet", urlPatterns = {"/addcar"})
public class AddCarServlet extends HttpServlet {

    private final String carlistServlet = "carlist";
    private final String loginPage = "login.jsp";
    private final String addPage = "addcar.jsp";

    /**
     * \
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String idRaw = request.getParameter("txtCarID");
        String carName = request.getParameter("txtCarName");
        String manufacturner = request.getParameter("txtManufacturner");
        String priceRaw = request.getParameter("txtPrice");
        String releasedYearRaw = request.getParameter("txtReleasedYear");
        String url = loginPage;

        int id, releasedYear;
        float price;

        CarDAO carDao = new CarDAO();
        User user = (User) session.getAttribute("account");
        try {
            if (session.getAttribute("account") != null && user.isIsAdmin()) {
                id = Integer.parseInt(idRaw);
                price = Float.parseFloat(priceRaw);
                releasedYear = Integer.parseInt(releasedYearRaw);

                if (!carName.isEmpty() || !manufacturner.isEmpty() || price > 0 || releasedYear > 1800) {
                    Cars cNew = new Cars(id, carName, manufacturner, price, releasedYear);
                    carDao.addACar(cNew);
                    url = carlistServlet;
                }
            } else {
                url = loginPage;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            response.sendRedirect(url);
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
        String url = addPage;
        try {
            CarDAO carDao = new CarDAO();
            List<Cars> list = carDao.getAllCar();
            int countCarID = 1 + carDao.countListCar(list);
            request.setAttribute("countCarID", countCarID);
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
