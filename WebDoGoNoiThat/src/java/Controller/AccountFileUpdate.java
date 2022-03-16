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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.Request;
import model.Seller;
import model.User;

/**
 *
 * @author Admin
 */
public class AccountFileUpdate extends HttpServlet {

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
                request.setAttribute("acc", customer);
            } else if(role.equals("seller")) {
                Seller seller = sld.getSellerById(userId);
                request.setAttribute("acc", seller);
            }
            ArrayList<Request> listrequest = rqd.getAllRequest();
            ArrayList<Customer> customerlist = csd.getAllCustomer();
            
            request.setAttribute("customerlist", customerlist);
            request.setAttribute("requestlist", listrequest);
            request.setAttribute("account", "update");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        SellerDAO sld = new SellerDAO();
        CustomerDAO csd = new CustomerDAO();
        
        String name = request.getParameter("input-name");
        String email = request.getParameter("input-email");
        String address = request.getParameter("input-address");
        String addressship = request.getParameter("input-address-ship");
        String image = request.getParameter("input-img");
        String phone = request.getParameter("input-phone");
        String gender = request.getParameter("input-gender");
        String DOB = request.getParameter("input-DOB");
        String role = request.getParameter("role");
        UserDAO ud = new UserDAO();
        PrintWriter out = response.getWriter();
        
        
        int userId = Integer.parseInt(request.getParameter("userId"));
        out.println(role);
            out.println(userId);
        if (role.equals("admin")){
            ud.updateImg(userId,image);
            csd.updateCustomer(userId, name, address,addressship, email, phone, gender, convertDate(DOB));
            sld.updateSeller(userId, name, address, email, phone, gender, convertDate(DOB));
        } else if (role.equals("customer")) {
            ud.updateImg(userId,image);
            csd.updateCustomer(userId, name, address,addressship, email, phone, gender, convertDate(DOB));
            request.setAttribute("acc", csd.getCustomerById(userId));
        } else if (role.equals("seller")) {
            ud.updateImg(userId,image);
            sld.updateSeller(userId, name, address, email, phone, gender, convertDate(DOB));
        } 
        HttpSession session = request.getSession();
        User user = ud.getUserByUserId(userId);
        session.removeAttribute("user");
        session.setAttribute("user", user);
        if (role.equals("customer")||role.equals("admin")) {
            request.setAttribute("acc", csd.getCustomerById(userId));
        } else if (role.equals("seller")) {
            request.setAttribute("acc", sld.getSellerById(userId));
        } 
        
        request.setAttribute("account", "file");
        request.getRequestDispatcher("myAccount.jsp").forward(request, response);
    }

    public String convertDate(String dateconvert) {
        String[] date = dateconvert.split("-");
        return date[1] + "/" + date[2] + "/" + date[0];
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
