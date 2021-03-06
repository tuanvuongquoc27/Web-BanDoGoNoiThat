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
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Order;
import model.Product;
import model.Shop;
import model.User;

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
            String userIdstring;
            if(request.getParameter("mess")!=null){
                userIdstring = request.getParameter("shopid");
            }else{
                userIdstring = request.getParameter("userId");
            }
            String update = request.getParameter("update");
            int userId = Integer.parseInt(userIdstring);

            if (productIddelete != null && !productIddelete.equals("null")) {
                int productId = Integer.parseInt(productIddelete);
                prd.deleteProduct(productId);
                od.deleteOrderHasProductNotExist(userId);
                sd.updateQuantity(userId);
//                ch?? ??
                sd.updateProductSold(userId);
                request.setAttribute("update", "getAll");
                
                ArrayList<Order> orderlist = od.getAllOrderOneUser(userId);
                ArrayList<Category> categorylist = ctd.getAllCategory();
                request.setAttribute("categorylist", categorylist);
                request.setAttribute("orderlist", orderlist);
                
                ArrayList<Product> list = prd.getProductbyShopId(userId);
                request.setAttribute("categorylist", categorylist);
                request.setAttribute("productlist", list);
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

                
                ArrayList<Product> list = prd.getProductbyShopId(userId);
                request.setAttribute("categorylist", categorylist);
                request.setAttribute("productlist", list);
                request.setAttribute("orderlist", orderlist);
            } else if (update.equals("update")) {

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
        ShopDAO sd = new ShopDAO();
        OrderDAO od = new OrderDAO();
        CategoryDAO ctd = new CategoryDAO();
        ProductDAO prd = new ProductDAO();
        UserDAO ud = new UserDAO();
        //User user = (User) request.getSession().getAttribute("user");
        String shopid = request.getParameter("input-shopId");
        User user = ud.getUserByUserId(Integer.parseInt(shopid));
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

        String update = request.getParameter("update");
        if (update.equals("insert-new")) {
            int productEntryPrice = Integer.parseInt(request.getParameter("input-pricein"));
            if (productQuantity * productEntryPrice > user.getUserBanlance()) {
                Product product = new Product(0, productName, productDescript, productImg, user.getUserId(),
                        productQuantity, 0, productEntryPrice, productOldPrice,
                        productOldPrice, productBrand, productOrigin, convertType(productType));
                request.setAttribute("error", "T??i kho???n c???a b???n kh??ng ????? ????? nh???p lo???i h??ng n??y");
                request.setAttribute("update", "insert");
                request.setAttribute("product", product);
                Shop shop = sd.getShop(user.getUserId());
                request.setAttribute("shop", shop);
                request.getRequestDispatcher("myShop.jsp").forward(request, response);
                return;
            }

            int check = prd.checkProduct(productName, productDescript,
                    productImg, user.getUserId(), productBrand,
                    productOrigin, convertType(productType));
            if (check == 0) {
                prd.insertProduct(productName, productDescript,
                        productImg, user.getUserId(), productQuantity,0, productEntryPrice*productQuantity , productOldPrice, productBrand,
                        productOrigin, convertType(productType));
                sd.updateQuantity(user.getUserId());
                ud.updateBalance(user.getUserId(), -productEntryPrice*productQuantity);
                if(request.getParameter("mess")!=null){
                    
                }else{
                    HttpSession session = request.getSession();
                    session.removeAttribute("user");
                    User u = ud.getUserByUserId(user.getUserId());
                    session.setAttribute("user", u);
                }
                
            } else {
                Product product = prd.getProduct(check);
                request.setAttribute("update", "update");
                request.setAttribute("product", product);
                Shop shop = sd.getShop(user.getUserId());
                request.setAttribute("shop", shop);
                request.getRequestDispatcher("myShop.jsp").forward(request, response);
            }

        } else {
            int productId = Integer.parseInt(productIdstring);
            Product product = prd.getProduct(productId);
            prd.updateProduct(productId, productName, productDescript, productImg, productQuantity, product.getProductQuantitySold(),
                    product.getProductOldPrice(), productOldPrice, productBrand, productOrigin, convertType(productType));
            sd.updateQuantity(user.getUserId());
        }
        
        Shop shop = sd.getShop(user.getUserId());
        ArrayList<Product> productlist = prd.getProductbyShopId(user.getUserId());
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
