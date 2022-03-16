/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerDAO;
import DAO.SellerDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Seller;
import model.User;

/**
 *
 * @author Admin
 */
public class ForgotPassServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("input-username");
            String email = request.getParameter("input-email");
            String password = request.getParameter("input-password");
            String password_again = request.getParameter("input-password-again");
            UserDAO ud = new UserDAO();
            CustomerDAO ctd = new CustomerDAO();
            User user = ud.getUserByUserName(username);
            SellerDAO sld = new SellerDAO();
            //kieerm tra de cap nhat mat khau 
            if (email == null) {
                if(password.equals(password_again)){
                    ud.updatePassword(password, user.getUserId());
                    request.setAttribute("success", "Cập nhật thành công");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }else {
                    request.setAttribute("error", "Mật khẩu không khớp");
                    request.getRequestDispatcher("ForgotPass.jsp").forward(request, response);
                }
            // kiem tra de nhap mat khau moi    
            } else {
                Seller seller = sld.getSellerById(user.getUserId());
                Customer customer = ctd.getCustomerById(user.getUserId());
                out.println(seller.getEmail());
                out.println(username);
                out.println(user.getUserName());
                out.println(email);
                if(customer==null){
                    if(username.equals(user.getUserName()) && seller.getEmail().equals(email)){
                        request.setAttribute("message", "Cập nhật mật khẩu");
                        request.setAttribute("username", username);
                        request.getRequestDispatcher("ForgotPass.jsp").forward(request, response);
                    }
                        
                }else {
                    if(username.equals(user.getUserName()) && customer.getEmail().equals(email)){
                        request.setAttribute("message", "Cập nhật mật khẩu");
                        request.setAttribute("username", username);
                        request.getRequestDispatcher("ForgotPass.jsp").forward(request, response);
                    }
                }
                
                
            }

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
