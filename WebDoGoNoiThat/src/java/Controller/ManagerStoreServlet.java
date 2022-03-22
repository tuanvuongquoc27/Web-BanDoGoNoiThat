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
import model.Customer;
import model.Request;
import model.Seller;
import model.Shop;
import model.User;

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
            /* TODO output your page here. You may use following sample code. */
            SellerDAO sld = new SellerDAO();
            OrderDAO od = new OrderDAO();
            ShopDAO sd = new ShopDAO();
            CustomerDAO csd = new CustomerDAO();
            UserDAO ud = new UserDAO();
            ProductDAO prd = new ProductDAO();
            RequestDAO rqd = new RequestDAO();

            String infor = request.getParameter("infor");

            if (infor != null) {
                if (infor.equals("delete")) {
                    int deleteId = Integer.parseInt(request.getParameter("shopId"));
//                  delete shop va thay doi role for user
                    rqd.deleteRequestId(deleteId);
                    prd.deleteProductByShopId(deleteId);
                    sd.deleteShop(deleteId);
                    sld.deleteSeller(deleteId);
                    ud.updateRole(deleteId, "isSeller", 0);
                    request.setAttribute("infor", "shop-information");
                    //get thong tin chuyen sang trang cho admin
                } else if (infor.equals("all")) {
                    request.setAttribute("infor", "shop-information");
                } else if (infor.equals("change")) {
                    request.setAttribute("infor", "change");
                    String id = request.getParameter("id");
                    User user = ud.getUserByUserId(Integer.parseInt(id));
                    if (user.isCustomer()&&!user.isSeller()||user.isAdmin()) {
                        Customer customer = csd.getCustomerById(Integer.parseInt(id));
                        request.setAttribute("acc", customer);
                    } else if (user.isSeller()&&user.isCustomer()) {
                        Seller seller = sld.getSellerById(Integer.parseInt(id));
                        request.setAttribute("acc", seller);
                    }
                    request.setAttribute("us", user);
                    request.getRequestDispatcher("managerStore.jsp").forward(request, response);
                }else if (infor.equals("up-shop")){
                    request.setAttribute("infor", "shop-update");
                    String id = request.getParameter("id");
                    Shop shop = sd.getShop(Integer.parseInt(id));
                    request.setAttribute("shop", shop);
                    request.getRequestDispatcher("managerStore.jsp").forward(request, response);
                }
            }

            int end = sd.count();
            end = ((int) end / 3) + 1;
            String start = request.getParameter("page");
            int begin;
            int last;
            if (start == null) {
                begin = 1;
                last = 3;
            } else {
                begin = Integer.parseInt(start);
                last = begin * 3;
                begin = last - 2;
            }
            ArrayList<Shop> shoplist = sd.getAll(begin, last);
            request.setAttribute("end", end);
            request.setAttribute("page", Integer.parseInt(start));

            ArrayList<Seller> sellerlist = sld.getAllSeller("select * from seller");
            ArrayList<Request> listrequest = rqd.getAllRequest();
            ArrayList<Customer> customerlist = csd.getAllCustomer();
            request.setAttribute("customerlist", customerlist);
            request.setAttribute("requestlist", listrequest);
            request.setAttribute("sellerlist", sellerlist);
            request.setAttribute("shoplist", shoplist);
            request.setAttribute("store", "information");

            request.getRequestDispatcher("managerStore.jsp").forward(request, response);
        }
    }

    public String convertGender(boolean gender) {
        if (gender) {
            return "nam";
        }
        return "nu";
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
