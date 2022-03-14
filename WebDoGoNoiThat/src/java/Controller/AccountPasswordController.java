/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Admin
 */
public class AccountPasswordController extends HttpServlet {

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
            request.setAttribute("account", "password");
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

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        UserDAO ud = new UserDAO();
        String mess = null;
        String oldpass = request.getParameter("old-pass");
        String newpass = request.getParameter("new-pass");
        String newpassagain = request.getParameter("new-pass-again");
        int userId = Integer.parseInt(request.getParameter("userId"));
        User user = ud.getUserByUserId(userId);

        if (!oldpass.equals(user.getPassword())) {
            mess = "Mật khẩu cũ không đúng";
        } else {
            if (!newpass.equals(newpassagain)) {
                mess = "Mật khẩu không trùng khớp";
            } else {
                ud.updatePassword(newpass, userId);
                HttpSession session = request.getSession();
                user = ud.getUserByUserId(userId);
                session.removeAttribute("user");
                session.setAttribute("user", user);
                mess = "Đổi mật khẩu thành công";
            }
        }
        request.setAttribute("account", "password");
        request.setAttribute("mess", mess);
        request.getRequestDispatcher("myAccount.jsp").forward(request, response);
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
