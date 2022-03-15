/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.OrderDAO;
import DAO.RequestDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Request;
import model.User;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

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
            
            String username = request.getParameter("input-username");
            String password = request.getParameter("input-password");
            User user = ud.getUserByUserName(username);
            if(ud.getUser(username, password)!= null){
                OrderDAO od = new OrderDAO();
                if(!od.getAllOrder(ud.getUser(username, password).getUserId()).isEmpty()){
                    request.setAttribute("orderlist", od.getAllOrder(ud.getUser(username, password).getUserId()));
                }else{
                    request.setAttribute("orderlist", null);
                }
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                if(user.getRole().equals("admin")){
                    request.getRequestDispatcher("ManagerStoreServlet").forward(request, response);
                }else{
                    request.getRequestDispatcher("HomeServletController").forward(request, response);
                }
                
                
                
            }else if (user!=null){
                request.setAttribute("error", "Tài khoản hoặc mật khẩu sai");
            }else {
                request.setAttribute("error", "Tài khoản không tồn tại");
            }
            //request.getRequestDispatcher("Login.jsp").forward(request, response);
            
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
