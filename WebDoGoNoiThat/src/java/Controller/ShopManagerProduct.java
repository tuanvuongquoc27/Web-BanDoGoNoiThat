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
            OrderDAO od = new OrderDAO();
            CategoryDAO ctd = new CategoryDAO();
            ShopDAO sd = new ShopDAO();
            String productIddelete = request.getParameter("productIddelete");
            String productIdupdate = request.getParameter("productIdupdate");

            String update = request.getParameter("update");
            String shopId = request.getParameter("userId");
            int userId = Integer.parseInt(shopId);

            if (productIddelete != null && !productIddelete.equals("null")) {
                int productId = Integer.parseInt(productIddelete);
                prd.deleteProduct(productId);
                od.deleteOrderHasProductNotExist(userId);
                sd.updateQuantity(userId);
//                chú ý
                sd.updateProductSold(userId);
                request.setAttribute("update", "getAll");

                ArrayList<Product> productlist = prd.getProductbyShopId(userId);
                ArrayList<Order> orderlist = od.getAllOrderOneUser(userId);
                ArrayList<Category> categorylist = ctd.getAllCategory();
                request.setAttribute("categorylist", categorylist);
                request.setAttribute("productlist", productlist);
                request.setAttribute("orderlist", orderlist);
            } else if (productIdupdate != null) {
                int productId = Integer.parseInt(productIdupdate);
                Product product = prd.getProduct(productId);
                request.setAttribute("update", "update");
                request.setAttribute("product", product);
            } else if (update.equals("insert")) {
                request.setAttribute("update", "insert");
            } else if (update.equals("getAll")) {
                request.setAttribute("update", update);
                ArrayList<Order> orderlist = od.getAllOrderOneUser(userId);
                ArrayList<Category> categorylist = ctd.getAllCategory();

                int end = prd.count();
                end = ((int) end / 3) + 1;
                String start = request.getParameter("page");
                int begin;
                int last;
                if (start == null) {
                    begin = 1;
                    last = 10;
                } else {
                    begin = Integer.parseInt(start);
                    last = begin * 10;
                    begin = last - 9;
                }
                ArrayList<Product> list = prd.getAllCategory(begin, last, shopId , "shopId");
                request.setAttribute("end", end);
                request.setAttribute("page", Integer.parseInt(start));
                request.setAttribute("categorylist", categorylist);
                request.setAttribute("productlist", list);
                request.setAttribute("orderlist", orderlist);
            }else if (update.equals("update")) {
                
            }
            Shop shop = sd.getShop(userId);
            request.setAttribute("shop", shop);
            request.getRequestDispatcher("myShop.jsp").forward(request, response);
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

        String productIdstring = request.getParameter("input-id");
        String productName = request.getParameter("input-name");
        String productDescript = request.getParameter("input-descript");
        String productImg = request.getParameter("input-img");
        int productQuantity = Integer.parseInt(request.getParameter("input-quantity"));
        int productOldPrice = Integer.parseInt(request.getParameter("input-price"));
        //String productNewPrice = request.getParameter("input-name");
        String productBrand = request.getParameter("input-brand");
        String productOrigin = request.getParameter("input-origin");
        String productType = request.getParameter("input-type");

        ShopDAO sd = new ShopDAO();
        OrderDAO od = new OrderDAO();
        CategoryDAO ctd = new CategoryDAO();
        ProductDAO prd = new ProductDAO();
        int shopId = Integer.parseInt(request.getParameter("input-shopId"));
        String update = request.getParameter("update");
        if (update.equals("insert-new")) {
            int check = prd.checkProduct(productName, productDescript,
                    productImg, shopId, productBrand,
                    productOrigin, convertType(productType));
            if (check == 0) {
                prd.insertProduct(productName, productDescript,
                        productImg, shopId, productQuantity, 0, productOldPrice, productBrand,
                        productOrigin, convertType(productType));
                sd.updateQuantity(shopId);
            } else {

                Product product = prd.getProduct(check);
                request.setAttribute("update", "update");
                request.setAttribute("product", product);
                Shop shop = sd.getShop(shopId);
                request.setAttribute("shop", shop);
                request.getRequestDispatcher("myShop.jsp").forward(request, response);
            }

        } else {
            int productId = Integer.parseInt(productIdstring);
            Product product = prd.getProduct(productId);
            prd.updateProduct(productId, productName, productDescript, productImg, productQuantity, product.getProductQuantitySold(),
                    product.getProductOldPrice(), productOldPrice, productBrand, productOrigin, convertType(productType));
            sd.updateQuantity(shopId);
        }

        Shop shop = sd.getShop(shopId);
        ArrayList<Product> productlist = prd.getProductbyShopId(shopId);
        ArrayList<Category> categorylist = ctd.getAllCategory();

        request.setAttribute("shop", shop);
        request.setAttribute("categorylist", categorylist);
        request.setAttribute("productlist", productlist);
        request.setAttribute("update", "getAll");
        request.getRequestDispatcher("myShop.jsp").forward(request, response);
    }

    public int convertType(String type) {
        CategoryDAO ctd = new CategoryDAO();
        Category c = ctd.getCategoryByName(type);
        return c.getCategoryId();
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
