/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CustomerDAO;
import DAO.SellerDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Seller;
import model.User;

/**
 *
 * @author Admin
 */
public class InforUserController extends HttpServlet {

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
            CustomerDAO csd = new CustomerDAO();
            UserDAO ud = new UserDAO();
            
            
            ArrayList<Customer> customerlist = csd.getAllCustomer();
            ArrayList<Seller> sellerlist = sld.getAllSeller("select * from seller as a, shop as b where a.sellerId = b.shopId and b.shopActive=1");
            ArrayList<User> userlist = ud.getAllUser();
            String infor = request.getParameter("infor");
            if(infor.equals("seller")){
                request.setAttribute("list",sellerlist);
                request.setAttribute("userlist", ud.getAllUser());
                request.setAttribute("ship", "no");
                request.setAttribute("infor", "infor-seller-customer");
            }
            else if (infor.equals("signupaccount")){
                request.setAttribute("infor", "signup");
            }else if (infor.equals("account")){
                request.setAttribute("account",userlist);
                request.setAttribute("infor", "account");
            }else{
                request.setAttribute("userlist", ud.getAllUser());
                request.setAttribute("list",customerlist);
                request.setAttribute("ship", "yes");
                request.setAttribute("infor", "infor-seller-customer");
            }
            
            
            request.getRequestDispatcher("managerStore.jsp").forward(request, response);
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
