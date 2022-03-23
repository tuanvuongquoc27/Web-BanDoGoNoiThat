/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.User;

/**
 *
 * @author Admin
 */
public class SignUpServlet extends HttpServlet {

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
            UserDAO ud = new UserDAO();
            CustomerDAO ctd = new CustomerDAO();

            String username = request.getParameter("input-username");
            String password = request.getParameter("input-password");
            String email = request.getParameter("input-email");
            String password_again = request.getParameter("input-password-2");

            Customer customer = ctd.getCustomerByEmail(email);
            User user = ud.getUserByUserName(username);
            if (password.length() <= 7) {
                request.setAttribute("error", "Mật khẩu phải lớn hơn 8 kí tự");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            } else if (!password.equals(password_again)) {
                request.setAttribute("error", "Mật khẩu không trùng khớp");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            } else if (user != null) {
                request.setAttribute("error", "Tài khoản đã tồn tại");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            } else if (customer != null) {
                request.setAttribute("error", "Email đã tồn tại");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            } else {
                ud.insertUserRoleCustomer(username, password);

                User newuser = ud.getUserByNameAndPass(username, password);
                ctd.insertCustomer(newuser.getUserId(), username, null, null, email, null, getDateNow(), null, null,1);
                request.setAttribute("success", "Tạo tài khoản thành công");
                if(request.getParameter("input-admin")!=null){
                    request.getRequestDispatcher("ManagerStoreServlet?infor=all&page=1").forward(request, response);
                    
                }else{
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
                
            }

            //thêm mới user với isCustomer = 1
        }
    }

    public String getDateNow() {
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date date = new Date();
        return sdf.format(date);

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
