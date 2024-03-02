package controller.cart;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CartController", urlPatterns = {"/cartcontrol"})
public class CartController extends HttpServlet {
    private final String addCartController = "addcart";
    private final String viewCartController = "viewcart";
    private final String removeCartController = "RemoveCartController";
    private final String updateCartController = "UpdateCartController";
    private final String saveCartController = "SaveCartController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = viewCartController, action;
        try {
            action = request.getParameter("action");
            switch (action) {
                case "addCart":
                    url = addCartController;
                    break;
                case "viewCart":
                    url = viewCartController;
                    break;
                case "Remove":
                    url = removeCartController;
                    break;
                case "Update":
                    url = updateCartController;
                    break;
                case "Save":
                    url = saveCartController;
                    break;
                default:
                    break;
            }
        }catch(Exception ex){
            log("CartController has error: " +ex.getMessage());
        }finally{
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
