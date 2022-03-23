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
import DAO.RequestDAO;
import DAO.SellerDAO;
import DAO.ShopDAO;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.User;

/**
 *
 * @author Admin
 */
public class UpdateInforAccount extends HttpServlet {

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
            CustomerDAO csd = new CustomerDAO();
            SellerDAO sld = new SellerDAO();
            UserDAO ud = new UserDAO();
            ShopDAO sd = new ShopDAO();
            ProductDAO prd = new ProductDAO();
            RequestDAO rqd = new RequestDAO();
            BillDAO bld = new BillDAO();
            OrderDAO ord = new OrderDAO();

            String up = request.getParameter("up");
            int id = Integer.parseInt(request.getParameter("id"));
            if (up.equals("deleteaccount")) {
                rqd.deleteRequestId(id);
                ord.deleteOrder(id, "customerId");
                bld.deleteBillById(id);
                prd.deleteProductByShopId(id);
                sd.deleteShop(id);
                sld.deleteSeller(id);
                csd.deleteCustomer(id);
                ud.deleteUser(id);
                request.getRequestDispatcher("ManagerStoreServlet?infor=all&page=1").forward(request, response);
            } else if (up.equals("deleteseller")) {
                rqd.deleteRequestId(id);
                ord.deleteOrder(id, "customerId");
                bld.deleteBillById(id);
                prd.deleteProductByShopId(id);
                sd.deleteShop(id);
                sld.deleteSeller(id);
                ud.updateRole(id, "isSeller", 0);
                request.getRequestDispatcher("ManagerStoreServlet?infor=all&page=1").forward(request, response);
            } else if (up.equals("deletecustomer")) {
                rqd.deleteRequestId(id);
                ord.deleteOrder(id, "customerId");
                bld.deleteBillById(id);
                prd.deleteProductByShopId(id);
                sd.deleteShop(id);
                sld.deleteSeller(id);
                csd.deleteCustomer(id);
                ud.updateRole(id, "isCustomer", 0);
                ud.updateActice(id, 0);
                request.getRequestDispatcher("ManagerStoreServlet?infor=all&page=1").forward(request, response);
            } else if (up.equals("change")) {
                request.getRequestDispatcher("ManagerStoreServlet?infor=change&id=" + id).forward(request, response);
            } else if (up.equals("update-shop")) {
                request.getRequestDispatcher("ManagerStoreServlet?infor=up-shop&id=" + id).forward(request, response);
            }else if (up.equals("unlock")){
                User user = ud.getUserByUserId(id);
                ud.updateActice(id, 1);
                if(user.isCustomer()&&!user.isSeller()){
                    csd.updateActive(id,1);
//                    csd.insertCustomer(user.getUserId(), user.getUserName(), null , null, null, null, getDateNow(), null, null, 1);
                }else if( user.isCustomer()&&user.isSeller()){
                    sld.updateActive(id, 1);
                    sd.updateActice(id, 1);
                    csd.updateActive(id,1);
                }else if (!(user.isAdmin()&&user.isCustomer()&&user.isSeller())){
                    ud.updateRole(id, "isCustomer", 1);
                }
                request.getRequestDispatcher("ManagerStoreServlet?infor=all&page=1&id=" + id).forward(request, response);
            }else if (up.equals("lock")){
                ud.updateActice(id, 0);
                User user = ud.getUserByUserId(id);
                if(user.isCustomer()&&!user.isSeller()){
                    csd.updateActive(id,0);
                    ud.updateRole(id, "isCustomer", 0);
                }else if( user.isCustomer()&&user.isSeller()){
                    sld.updateActive(id,0);
                    csd.updateActive(id,0);
                }
                request.getRequestDispatcher("ManagerStoreServlet?infor=all&page=1&id=" + id).forward(request, response);
            }

        }
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        SellerDAO sld = new SellerDAO();
        CustomerDAO csd = new CustomerDAO();

        String name = request.getParameter("input-name");
        String email = request.getParameter("input-email");
        String address = request.getParameter("input-address");
        String addressship = request.getParameter("input-address-ship");
        String image = request.getParameter("input-img");
        String phone = request.getParameter("input-phone");
        String gender = request.getParameter("input-gender");
        String DOB = request.getParameter("input-DOB");
        String role = request.getParameter("role");
        UserDAO ud = new UserDAO();
        PrintWriter out = response.getWriter();

        int userId = Integer.parseInt(request.getParameter("userId"));
        out.println(role);
        out.println(userId);
        if (role.equals("admin")) {
            ud.updateImg(userId, image);
            csd.updateCustomer(userId, name, address, addressship, email, phone, gender, convertDate(DOB),1);
            sld.updateSeller(userId, name, address, email, phone, gender, convertDate(DOB),1);
        } else if (role.equals("customer")) {
            ud.updateImg(userId, image);
            csd.updateCustomer(userId, name, address, addressship, email, phone, gender, convertDate(DOB),1);
            request.setAttribute("acc", csd.getCustomerById(userId));
        } else if (role.equals("seller")) {
            ud.updateImg(userId, image);
            sld.updateSeller(userId, name, address, email, phone, gender, convertDate(DOB),1);
        }
        request.getRequestDispatcher("ManagerStoreServlet?infor=all&page=1").forward(request, response);
    }

    public String convertDate(String dateconvert) {
        String[] date = dateconvert.split("-");
        return date[1] + "/" + date[2] + "/" + date[0];
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
