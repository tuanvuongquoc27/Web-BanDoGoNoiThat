package Controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class ShopServletController extends HttpServlet {

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
            OrderDAO od = new OrderDAO();
            ProductDAO prd = new ProductDAO();
            CategoryDAO ctd = new CategoryDAO();
            
            
            String idstring = request.getParameter("shopId");
            String userIdstring = request.getParameter("userId");
            if (idstring != null) {
                int shopId = Integer.parseInt(idstring);
                ArrayList<Product> productlist = prd.getProductbyShopId(shopId);
                Shop shop = sd.getShop(shopId);
                request.setAttribute("shop", shop);
                request.setAttribute("productlist", productlist);
                request.getRequestDispatcher("shoppage.jsp").forward(request, response);
            }else if (idstring == null){
                int userId = Integer.parseInt(userIdstring);
                Shop shop =  sd.getShop(userId);
                ArrayList<Order> orderlist = od.getAllOrderOneUser(userId);
                ArrayList<Order> orderall = od.getAllOrderRecord();
                ArrayList<Category> categorylist = ctd.getAllCategory();
                request.setAttribute("shop", shop);
                request.setAttribute("categorylist", categorylist);
                
                request.setAttribute("orderlist", orderlist);
                request.setAttribute("orderlistall", orderall);
                request.setAttribute("update", "getAll");
                
                int end = prd.countProductShop(userId);
                end = ((int) end / 10) + 1;
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
                ArrayList<Product> list = prd.getAllCategory(begin, last, userIdstring);
                request.setAttribute("productlist", list);
                request.setAttribute("end", end);
                request.setAttribute("page", Integer.parseInt(start));
                request.getRequestDispatcher("myShop.jsp").forward(request, response);
            }   
            
            
                
            

            //out.println(shop.getShopDate());
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
