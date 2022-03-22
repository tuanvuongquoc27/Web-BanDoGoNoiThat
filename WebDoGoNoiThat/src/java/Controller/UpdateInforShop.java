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
import model.Product;
import model.Shop;

/**
 *
 * @author Admin
 */
public class UpdateInforShop extends HttpServlet {

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
            ShopDAO sd = new ShopDAO();
            CategoryDAO ctd = new CategoryDAO();
            ProductDAO prd = new ProductDAO();
            int shopId = Integer.parseInt(request.getParameter("userId"));
            request.setAttribute("shop", sd.getShop(shopId));
            request.setAttribute("update", "updateshop");
            ArrayList<Product> productlist = prd.getProductbyShopId(shopId);
            ArrayList<Category> categorylist = ctd.getAllCategory();
            
            request.setAttribute("categorylist", categorylist);
            request.setAttribute("productlist", productlist);
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
        String shopid = request.getParameter("input-shopId");
        String name = request.getParameter("input-name");
        String address = request.getParameter("input-address");
        String phone = request.getParameter("input-phone");
        String email = request.getParameter("input-email");
        

        ShopDAO sd = new ShopDAO();
        OrderDAO od = new OrderDAO();
        CategoryDAO ctd = new CategoryDAO();
        ProductDAO prd = new ProductDAO();
        
        sd.updateShop(shopid,name, address, email, phone);
        Shop shop = sd.getShop(Integer.parseInt(shopid));
        ArrayList<Product> productlist = prd.getProductbyShopId(Integer.parseInt(shopid));
        ArrayList<Category> categorylist = ctd.getAllCategory();
        if(request.getParameter("place")!=null){
            request.getRequestDispatcher("ManagerStoreServlet?page=1&infor=all").forward(request, response);
        }
        request.setAttribute("shop", shop);
        request.setAttribute("categorylist", categorylist);
        request.setAttribute("productlist", productlist);
        request.setAttribute("update", "getAll");
        request.getRequestDispatcher("myShop.jsp").forward(request, response);
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
