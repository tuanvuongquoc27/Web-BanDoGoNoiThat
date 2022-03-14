/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CategoryDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DAO.ShopDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Order;
import model.Product;
import model.Shop;

/**
 *
 * @author Admin
 */
public class ShopManagerProduct extends HttpServlet {

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
            String productIddelete = request.getParameter("productIddelete");
            String productIdupdate = request.getParameter("productIdupdate");
            
            String update = request.getParameter("update"); 
            
            if(productIddelete!=null){
                int productId=Integer.parseInt(productIddelete);
                prd.deleteProduct(productId);
                request.setAttribute("update", "getAll");
                String shopId = request.getParameter("userId");
                int userId = Integer.parseInt(shopId);
                ShopDAO sd = new ShopDAO();
                OrderDAO od = new OrderDAO();
                CategoryDAO ctd = new CategoryDAO();
                Shop shop =  sd.getShop(userId);
                ArrayList<Product> productlist = prd.getProductbyShopId(userId);
                ArrayList<Order> orderlist = od.getAllOrder(userId);
                ArrayList<Category> categorylist = ctd.getAllCategory();
                request.setAttribute("shop", shop);
                request.setAttribute("categorylist", categorylist);
                request.setAttribute("productlist", productlist);
                request.setAttribute("orderlist", orderlist);
                request.getRequestDispatcher("myShop.jsp").forward(request, response);
            }
            if(productIdupdate!=null) {
                String shopId = request.getParameter("userId");
                int productId = Integer.parseInt(productIdupdate);
                Product product = prd.getProduct(productId);
                request.setAttribute("update", "update");
                request.setAttribute("product", product);
                request.getRequestDispatcher("myShop.jsp").forward(request, response);
            }
            if(update.equals("insert")){
                request.setAttribute("update", update);
                request.getRequestDispatcher("myShop.jsp").forward(request, response);
            }
            if(update.equals("getAll")){
                String shopId = request.getParameter("userId");
                request.setAttribute("update", update);
                int userId = Integer.parseInt(shopId);
                ShopDAO sd = new ShopDAO();
                OrderDAO od = new OrderDAO();
                CategoryDAO ctd = new CategoryDAO();
                Shop shop =  sd.getShop(userId);
                ArrayList<Product> productlist = prd.getProductbyShopId(userId);
                ArrayList<Order> orderlist = od.getAllOrder(userId);
                ArrayList<Category> categorylist = ctd.getAllCategory();
                request.setAttribute("shop", shop);
                request.setAttribute("categorylist", categorylist);
                request.setAttribute("productlist", productlist);
                request.setAttribute("orderlist", orderlist);
                request.getRequestDispatcher("myShop.jsp").forward(request, response);
                request.getRequestDispatcher("myShop.jsp").forward(request, response);
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
//                String productName= request.getParameter("");
//                String productDescript = request.getParameter("");
//                String productImg = request.getParameter("");
//                String productQuantity = request.getParameter("");
//                String productOldPrice = request.getParameter("");
//                String productNewPrice = request.getParameter("");
//                String productBrand = request.getParameter("");
//                String productOrigin = request.getParameter("");
//                String productType = request.getParameter("");
//                int productId=Integer.parseInt("");
//                prd.updateProduct(productId, productIdupdate, productIdupdate, 
//                                  productIdupdate, productId, productId, productId, 
//                                  productIdupdate, productIdupdate, productId);
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
