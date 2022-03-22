/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BillDAO;
import DAO.CustomerDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Bill;
import model.Order;
import model.Product;

/**
 *
 * @author Admin
 */
public class AddProductToCart extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            ProductDAO prd = new ProductDAO();
            BillDAO bd = new BillDAO();
            OrderDAO od = new OrderDAO();
            CustomerDAO csd = new CustomerDAO();
            
            String quantityString = request.getParameter("quantity_input");
            String userIdstring = request.getParameter("userId");
            String productIdstring = request.getParameter("productId");
            String addressship = request.getParameter("addressship");
            
            
            int userId = Integer.parseInt(userIdstring);
            int quantity = Integer.parseInt(quantityString);
            int productId = Integer.parseInt(productIdstring);
            
            Bill bill = bd.getBillEmpty(userId);
            Product product = prd.getProduct(productId);

            if (bill == null || (bill != null && bill.getBillDate() != null)) {
                bd.insertBill(userId);
            }
            bill = bd.getBillEmpty(userId);
            Order oldorder = od.getOrderSold(userId, productId);// lấy ra thăng order trc có cùng id
            if (oldorder == null) {
                od.insertOrder(userId, bill.getBillId(), productId, product.getProductNewPrice(), quantity, 0,prd.getProduct(productId).getShopId());
            } else {// thêm số lượng
                od.updateOrder(productId, quantity, 0);
                
            }
            od.setPrice();
            csd.updateAddress(addressship,userId);
            request.getRequestDispatcher("HomeServletController?page=1").forward(request, response);

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
