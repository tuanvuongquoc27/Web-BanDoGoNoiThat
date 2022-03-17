/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerDAO;
import DAO.RequestDAO;
import DAO.SellerDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Request;
import model.Seller;

/**
 *
 * @author Admin
 */
public class AccountFileController extends HttpServlet {

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
            UserDAO ud = new UserDAO();
            SellerDAO sld = new SellerDAO();
            CustomerDAO csd = new CustomerDAO();
            RequestDAO rqd = new RequestDAO();
            
            int userId = Integer.parseInt(request.getParameter("userId"));
            String role = request.getParameter("role");
            
            
            
            if(role.equals("customer")||role.equals("admin")){
                Customer customer = csd.getCustomerById(userId);
                out.println(customer);
                request.setAttribute("acc", customer);
            } else if(role.equals("seller")) {
                Seller seller = sld.getSellerById(userId);
                request.setAttribute("acc", seller);
            }
            ArrayList<Request> listrequest = rqd.getAllRequest();
            ArrayList<Customer> customerlist = csd.getAllCustomer();
            
            request.setAttribute("customerlist", customerlist);
            request.setAttribute("requestlist", listrequest);
            request.setAttribute("account", "file");
            request.getRequestDispatcher("myAccount.jsp").forward(request, response);
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
