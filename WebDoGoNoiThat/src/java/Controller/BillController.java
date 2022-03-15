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
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author Admin
 */
public class BillController extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BillController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BillController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String address = request.getParameter("address");
            int total = Integer.parseInt(request.getParameter("totalmoney"));
            String type = request.getParameter("option-pay");
            OrderDAO ord = new OrderDAO();
            ProductDAO prd = new ProductDAO();
            BillDAO bld = new BillDAO();
            UserDAO ud = new UserDAO();
            ShopDAO sd = new ShopDAO();
            OrderDAO od = new OrderDAO();
            CustomerDAO csd = new CustomerDAO();

            int customerId = Integer.parseInt(request.getParameter("userId"));
            if (type.equals("type1")) {
                User user = ud.getUserByUserId(customerId);
                ArrayList<Order> odlist = ord.getAllOrder(customerId);
                for (int i = 0; i < odlist.size(); i++) {
                    Product pro = prd.getProduct(odlist.get(i).getProductId());
                    if (pro != null) {
                        Customer customer = csd.getCustomerById(customerId);
                        if (user.getUserBanlance() < total) {
                            request.setAttribute("mess", "Số dư ko đủ");
                            ArrayList<Order> orderlist = od.getAllOrder(customerId);
                            request.setAttribute("orderlist", orderlist);
                            request.getRequestDispatcher("myCart.jsp").forward(request, response);
                        } else if (customer.getCustomerAddress()==null){
                            request.setAttribute("mess", "Vui lòng cập nhật địa chỉ");
                            ArrayList<Order> orderlist = od.getAllOrder(customerId);
                            request.setAttribute("orderlist", orderlist);
                            request.getRequestDispatcher("myCart.jsp").forward(request, response);
                        } 
                        else {
                            prd.updateQuantity(odlist.get(i).getProductQuantity(), pro.getProductId());
                            sd.updateProductSold(pro.getShopId());
                            ord.updateOrderSold(customerId, 1);
                            bld.updateBill(odlist.get(0).getBillId(), total, getDateNow());
                            ud.updateBalance(customerId, -total);
                            ud.updateBalance(pro.getShopId(), total);
                            HttpSession session = request.getSession();
                            user = ud.getUserByUserId(pro.getShopId());
                            session.removeAttribute("user");
                            session.setAttribute("user", user);
                            request.setAttribute("mess", "Thanh toán thành công, Kiện hàng sẽ được chuyển đến "+customer.getCustomerAddress());
                        }

                    } else {
                        request.setAttribute("mess", "Sản phẩm đã hết");
                    }

                }

            }
            request.getRequestDispatcher("myCart.jsp").forward(request, response);
    }

    public String getDateNow() {
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date date = new Date();
        return sdf.format(date);
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
