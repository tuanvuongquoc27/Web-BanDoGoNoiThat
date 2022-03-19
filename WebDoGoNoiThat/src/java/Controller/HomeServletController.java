/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CategoryDAO;
import DAO.CustomerDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DAO.RequestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Customer;
import model.Order;
import model.Product;
import model.Request;
import model.User;

/**
 *
 * @author Admin
 */
public class HomeServletController extends HttpServlet {

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
            ProductDAO prd = new ProductDAO();
            CategoryDAO ctd = new CategoryDAO();
            RequestDAO rqd = new RequestDAO();
            CustomerDAO csd = new CustomerDAO();

            User user = (User) request.getSession().getAttribute("user");
            ArrayList<Order> orderlist = null;
            //trường hợp có đã đăng nhập
            if (user != null) {
                OrderDAO od = new OrderDAO();
                orderlist = od.getAllOrderOneUser(user.getUserId());// lấy ra all order của 1 khách nhưng sold=1 chưa thanh toán
                if (orderlist.isEmpty()) {//kiểm tra xem user có mua đồ ko 
                    orderlist = null;
                }
            } else {// trường hợp chưa đăng nhập -> chưa có order
                orderlist = null;
            }
            ArrayList<Request> requestlist = rqd.getAllRequest();// lấy ra tất cả yêu cầu 
            ArrayList<Customer> customerlist = csd.getAllCustomer();// lấy ra tất cả khách hàng
            ArrayList<Category> categorylist = ctd.getAllCategory();// lấy ra category

            int end = prd.count();
            end = ((int) end / 12) + 1;
            String start = request.getParameter("page");
            int begin;
            int last;
            if (start == null) {
                begin = 1;
                last = 12;
            } else {
                begin = Integer.parseInt(start);
                last = begin * 12;
                begin = last - 11;
            }
                ArrayList<Product> list = prd.getAll(begin, last);
                request.setAttribute("end", end);
                request.setAttribute("page", Integer.parseInt(start) );
                request.setAttribute("customerlist", customerlist);
                request.setAttribute("requestlist", requestlist);
                request.setAttribute("categorylist", categorylist);
                request.setAttribute("productlist", list);
                request.setAttribute("orderlist", orderlist);

                request.getRequestDispatcher("HomePage.jsp").forward(request, response);
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
