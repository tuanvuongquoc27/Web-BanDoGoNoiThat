/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerDAO;
import DAO.RequestDAO;
import DAO.SellerDAO;
import DAO.ShopDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.Request;
import model.Seller;
import model.User;

/**
 *
 * @author Admin
 */
public class ManagerRequest extends HttpServlet {

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
            ShopDAO sd = new ShopDAO();
            UserDAO ud = new UserDAO();
            CustomerDAO csd = new CustomerDAO();
            SellerDAO sld = new SellerDAO();
            RequestDAO rqd = new RequestDAO();
            
            String rquest = request.getParameter("rquest");
            
            int userId = Integer.parseInt(request.getParameter("userId"));
            
            
            if (rquest != null) {
                if (rquest.equals("accept")) {
                    ud.updateRole(userId, "isSeller",1);
                    sd.updateActice(userId, 1);
                    rqd.updateState(userId,1);
                    rqd.updateResponse(userId,"Đã chấp nhận");
                    sld.updateDate(userId, getDateNow());
                    sd.updateDate(userId, getDateNow());
                    ud.updateBalance(userId, -200000);
                    ud.updateBalance(1, 200000);
                    HttpSession session = request.getSession();
                    User user = ud.getUserByUserId(1);
                    session.removeAttribute("user");
                    session.setAttribute("user", user);
                    request.setAttribute("infor", "request");
                } else if (rquest.equals("delete")) {
                    sd.deleteShop(userId);
                    rqd.deleteRequestId(userId);
                    sld.deleteSeller(userId);
                }
            } else {// admin enter thông tin yêu cầu 
                request.setAttribute("infor", "request");
            }
            ArrayList<User> userlist = ud.getAllUser();
            ArrayList<Request> listrequest = rqd.getAllRequest();
            ArrayList<Customer> customerlist = csd.getAllCustomer();
            ArrayList<Seller> sellerlist = sld.getAllSeller("select * from seller as a, shop as b where a.sellerId = b.shopId and b.shopActive=1");
            
            request.setAttribute("seller", sellerlist);
            request.setAttribute("se",ud.getAllUser() );
            request.setAttribute("customerlist", customerlist);
            request.setAttribute("requestlist", listrequest);
            request.setAttribute("userlist", userlist);
            request.getRequestDispatcher("managerStore.jsp").forward(request, response);
        }
    }
    public String convertGender(boolean gender) {
        if (gender) {
            return "nam";
        }
        return "nữ";
    }
    
    public String getDateNow() {
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date date = new Date();
        return sdf.format(date);
        
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
