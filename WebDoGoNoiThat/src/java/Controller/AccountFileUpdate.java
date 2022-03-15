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
import javax.servlet.http.HttpSession;
import model.Customer;
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
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("input-name");
        String email = request.getParameter("input-email");
        String address = request.getParameter("input-address");
        String phone = request.getParameter("input-phone");
        String gender = request.getParameter("input-gender");
        String DOB = request.getParameter("input-DOB");
        String role = request.getParameter("role");
        UserDAO ud = new UserDAO();
        
        int userId = Integer.parseInt(request.getParameter("userId"));
        if (role.equals("customer")) {
            CustomerDAO csd = new CustomerDAO();
            csd.updateCustomer(userId, name, address, email, phone, gender, convertDate(DOB));
            request.setAttribute("customer", csd.getCustomerById(userId));
        } else {
            SellerDAO sld = new SellerDAO();
            sld.updateSeller(userId, name, address, email, phone, gender, convertDate(DOB));
            request.setAttribute("seller", sld.getSellerById(userId));
        }
        HttpSession session = request.getSession();
        User user = ud.getUserByUserId(userId);
        session.removeAttribute("user");
        session.setAttribute("user", user);
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
