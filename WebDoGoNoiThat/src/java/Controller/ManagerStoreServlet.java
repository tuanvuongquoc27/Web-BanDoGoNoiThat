/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerDAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DAO.RequestDAO;
import DAO.SellerDAO;
import DAO.ShopDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import model.Request;
import model.Seller;
import model.Shop;

/**
 *
 * @author Admin
 */
public class ManagerStoreServlet extends HttpServlet {

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
            SellerDAO sld = new SellerDAO();
            OrderDAO od = new OrderDAO();
            ShopDAO sd = new ShopDAO();
            CustomerDAO csd = new CustomerDAO();
            UserDAO ud = new UserDAO();
            ProductDAO prd = new ProductDAO();
            RequestDAO rqd = new RequestDAO();
            
            ArrayList<Request> listrequest = rqd.getAllRequest();
            request.setAttribute("reqeustlist", listrequest);
            String infor = request.getParameter("infor");
            if (infor == null) {
                ArrayList<Shop> shoplist = sd.getAllShop();
                ArrayList<Seller> sellerlist = sld.getAllSeller();
                
                request.setAttribute("sellerlist", sellerlist);
                request.setAttribute("shoplist", shoplist);
                
                request.getRequestDispatcher("managerStore.jsp").forward(request, response);
            }else{
                if(infor.equals("delete")){
                    int deleteId = Integer.parseInt(request.getParameter("shopId"));
                    Seller seller = sld.getSellerById(deleteId);
//                  delete shop va thay doi role for user
                    prd.deleteProductByShopId(deleteId);
                    sd.deleteShop(deleteId);
                    sld.deleteSeller(deleteId);
                    //csd.insertCustomer(seller.getSellerId(), seller.getSellerName(), seller.getSellerAddress(), seller.getSellerEmail(), seller.getSellerPhone());
                    ud.updateRole(deleteId, "customer");
                    //get thong tin chuyen sang trang cho admin
                    ArrayList<Shop> shoplist = sd.getAllShop();
                    ArrayList<Seller> sellerlist = sld.getAllSeller();
                    request.setAttribute("sellerlist", sellerlist);
                    request.setAttribute("shoplist", shoplist);
                    request.getRequestDispatcher("managerStore.jsp").forward(request, response);
                }else if (infor.equals("all")){
                    
                }
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