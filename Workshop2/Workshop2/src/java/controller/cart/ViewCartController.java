package controller.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;
import util.CartUtil;

@WebServlet(name = "ViewCartController", urlPatterns = {"/viewcart"})
public class ViewCartController extends HttpServlet {

    private final String viewCartPage = "Cart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = viewCartPage;
        List<CartItem> itemInCart = null;
        HashMap<String, CartItem> cart = null;
        Cookie cookieCart = null;
        try {
            CartUtil cartUtils = new CartUtil();
            HttpSession sessionCart = request.getSession();
            cart = (HashMap<String, CartItem>) sessionCart.getAttribute("Cart");
            if (cart == null) {
                cookieCart = cartUtils.getCookieByName(request, "Cart");
                if (cookieCart != null) {
                    cart = cartUtils.getCartFromCookie(cookieCart);
                    if (cart != null) {
                        itemInCart = new ArrayList<CartItem>(cart.values());
                        sessionCart.setAttribute("Cart", cart);
                    }
                }
            } else {
                itemInCart = new ArrayList<CartItem>(cart.values());
            }
            request.setAttribute("Cart", itemInCart);
        } catch (Exception ex) {
            log("ViewCartController has error: " + ex.getMessage());
        } finally {
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
