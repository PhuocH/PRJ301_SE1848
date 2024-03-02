package controller.cart;

import dal.MobileDAO;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;
import model.Mobiles;

@WebServlet(name = "AddCartController", urlPatterns = {"/addcart"})
public class AddCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = null;
        String message, mobileId;
        Mobiles selectMobile = null;
        CartItem item = null;
        HashMap<String, CartItem> itemsInCart = null;
        try {
            MobileDAO mobDao = new MobileDAO();
            HttpSession shoppingCart = request.getSession();
            itemsInCart = (HashMap<String, CartItem>) shoppingCart.getAttribute("Cart");
            mobileId = request.getParameter("id");
            selectMobile = mobDao.getMobileById(mobileId);
            if (itemsInCart == null) {
                itemsInCart = new HashMap<String, CartItem>();
                shoppingCart.setAttribute("Cart", itemsInCart);
            }
            item = itemsInCart.get(selectMobile.getMobileId());
            if (item == null) {
                item = new CartItem(selectMobile.getMobileId(), selectMobile.getMobileName(), 1, selectMobile.getPrice());
                itemsInCart.put(item.getItemId(), item);
                message = "The book " + item.getItemName() + " has been added to cart successfully.";
            }else{
                item.setQuantity(item.getQuantity() + 1);
                message = "The cart has been updated successfully.";
            }
            request.setAttribute("Message", "<h4>" + message + "</h4>");
            request.getRequestDispatcher("home").forward(request, response);
        } catch (Exception ex) {
            log("AddCartController has error: " + ex.getMessage());
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
