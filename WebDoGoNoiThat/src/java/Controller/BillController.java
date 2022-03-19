/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BillDAO;
import DAO.CustomerDAO;
import DAO.OrderDAO;
import DAO.PayDAO;
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
import model.Bill;
import model.Customer;
import model.Order;
import model.Payment;
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

        //int total = Integer.parseInt(request.getParameter("totalmoney"));
        User user = (User) request.getSession().getAttribute("user");

        String type = request.getParameter("option-pay");
        OrderDAO ord = new OrderDAO();
        ProductDAO prd = new ProductDAO();
        BillDAO bld = new BillDAO();
        UserDAO ud = new UserDAO();
        ShopDAO sd = new ShopDAO();
        OrderDAO od = new OrderDAO();
        CustomerDAO csd = new CustomerDAO();
        PayDAO pd = new PayDAO();
        
        int quantitynew =Integer.parseInt(request.getParameter("quantitynew"));
        od.updateQuantityOneOrder(quantitynew, quantitynew, quantitynew);
        
        ArrayList<Payment> paylist = pd.getAllPay();
        request.setAttribute("paylist", paylist);

        String pay = request.getParameter("pay");
        if (pay.equals("continue")) {
            String[] list = request.getParameterValues("product");
            if (list == null) {// ko chọn hàng yêu cầu ng  dùng chọn để thanh toán
                request.setAttribute("mess", "Vui lòng chọn sản phẩm để thanh toán");
                ArrayList<Order> orderlist = od.getAllOrderOneUser(user.getUserId());
                request.setAttribute("orderlist", orderlist);
                request.setAttribute("pay", "continue");
                request.getRequestDispatcher("myCart.jsp").forward(request, response);
            } else {// đã chọn hàng
                int[] productlist = new int[list.length];
                for (int i = 0; i < list.length; i++) {// kiểm tra xem có tồn tại sản phẩm đó ko 
                    productlist[i] = Integer.parseInt(list[i]);
                    Product product = prd.getProduct(productlist[i]);
//                        Order order = od.getOneOrder(productlist[i],user.getUserId() );
                    if (od.checkOrder(productlist[i]) != null) {
                        od.updateOneOrderSold(productlist[i], user.getUserId(), 1, 0);
                    }
                }
                // trường hợp lấy ra order có bill chưa thanh toán
                Bill bill = bld.getBillEmpty(user.getUserId());
                ArrayList<Order> orderlist = od.getAllOrderHasBillNotPay(user.getUserId(), bill.getBillId());
                request.setAttribute("orderlist", orderlist);
                request.setAttribute("pay", "pay");
                request.getRequestDispatcher("myCart.jsp").forward(request, response);
            }

        } else {
            if (type.equals("type1")) {
                int total = Integer.parseInt(request.getParameter("totalmoney"));
                ArrayList<Order> odlist = ord.getAllOrderSoldout(user.getUserId());
                Customer customer = csd.getCustomerById(user.getUserId());
                Bill bill = bld.getBillEmpty(user.getUserId());
                if (user.getUserBanlance() < total) {
                    request.setAttribute("mess", "Số dư ko đủ");
                    ArrayList<Order> orderlist = od.getAllOrderHasBillNotPay(user.getUserId(), bill.getBillId());
                    request.setAttribute("orderlist", orderlist);
                    request.getRequestDispatcher("myCart.jsp").forward(request, response);
                } else {
                    for (int i = 0; i < odlist.size(); i++) {
                        Product pro = prd.getProduct(odlist.get(i).getProductId());
                        if (pro.getProductQuantity() != 0) {
                            prd.updateQuantity(odlist.get(i).getProductQuantity(), pro.getProductId());
                            
                            sd.updateQuantity(pro.getShopId());
                            sd.updateQuantitySold(pro.getShopId());
                            ArrayList<Order> listo = ord.getAllOrderAll();
                            prd.updateQuantityProductSold(listo.get(i).getProductId());
                            ud.updateBalance(pro.getShopId(), odlist.get(i).getProductTotal());

                        } else {
                            request.setAttribute("mess", "Sản phẩm đã hết" + pro.getProductName());
                            ArrayList<Order> orderlist = od.getAllOrderHasBillNotPay(user.getUserId(), bill.getBillId());
                            request.getRequestDispatcher("myCart.jsp").forward(request, response);
                        }
                    }
                    ud.updateBalance(user.getUserId(), -(total-20000));
                    bld.updateBill(bill.getBillId(), total, getDateNow(), 1);
                    HttpSession session = request.getSession();
                    session.removeAttribute("user");
                    user = ud.getUserByUserId(user.getUserId());
                    session.setAttribute("user", user);
                    request.setAttribute("mess", "Thanh toán thành công, Kiện hàng sẽ được chuyển đến " + customer.getAddressShip());
                    request.getRequestDispatcher("myCart.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("mess", "Kiện hàng sẽ được giao trong thời gian sớm nhật");
                request.getRequestDispatcher("myCart.jsp").forward(request, response);
            }

        }

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
