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
import model.Category;
import model.Customer;
import model.Order;
import model.Product;
import model.Request;

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
            String userIdstring = request.getParameter("userId");
            ArrayList<Order> orderlist = null;
           
            //trường hợp có đã đăng nhập
            if(userIdstring!=null ){
                int userId = Integer.parseInt(userIdstring);
                OrderDAO od = new OrderDAO();
                orderlist = od.getAllOrder(userId);
                if(orderlist.isEmpty()){
                    orderlist=null;
                }
            }else{
                orderlist = (ArrayList<Order>) request.getAttribute("orderlist");
            }
            ArrayList<Request> requestlist = rqd.getAllRequest();
            ArrayList<Customer> customerlist = csd.getAllCustomer();
            ArrayList<Category> categorylist = ctd.getAllCategory();
            ArrayList<Product> list = prd.getAllProduct();
            
            request.setAttribute("customerlist", customerlist);
            request.setAttribute("requestlist", requestlist);
            request.setAttribute("categorylist", categorylist);
            request.setAttribute("list", list);
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
