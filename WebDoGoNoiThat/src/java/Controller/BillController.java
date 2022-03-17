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
        PrintWriter out = response.getWriter();
        String address = request.getParameter("address");
        //int total = Integer.parseInt(request.getParameter("totalmoney"));
        String userIdstring = request.getParameter("userId");
        int userId = Integer.parseInt(userIdstring);
        String type = request.getParameter("option-pay");
        OrderDAO ord = new OrderDAO();
        ProductDAO prd = new ProductDAO();
        BillDAO bld = new BillDAO();
        UserDAO ud = new UserDAO();
        ShopDAO sd = new ShopDAO();
        OrderDAO od = new OrderDAO();
        CustomerDAO csd = new CustomerDAO();
        PayDAO pd = new PayDAO();

        ArrayList<Payment> paylist = pd.getAllPay();
        request.setAttribute("paylist", paylist);

        String pay = request.getParameter("pay");
        if (pay.equals("continue")) {
            String[] list = request.getParameterValues("product");
            if (list == null) {
                request.setAttribute("mess", "Vui lòng chọn sản phẩm để thanh toán");
                ArrayList<Order> orderlist = od.getAllOrder(userId);
                request.setAttribute("orderlist", orderlist);
                request.setAttribute("pay", "continue");
                request.getRequestDispatcher("myCart.jsp").forward(request, response);
            } else {
                int[] productlist = new int[list.length];
                for (int i = 0; i < list.length; i++) {
                    productlist[i] = Integer.parseInt(list[i]);
//                        Product product = prd.getProduct(productlist[i]);
//                        Order order = od.getOneOrder(productlist[i],Integer.parseInt(userIdstring) );
                    if (od.checkOrder(productlist[i]) != null) {
                        od.updateOneOrderSold(productlist[i], userId, 1, 0);
//                            if(order.getProductQuantity()<product.getProductQuantity()){
//                                request.setAttribute("mess","Số lượng sản phẩm "+product.getProductId()+" không đủ hãy thử lại sau");
//                                break;
//                            }
                    }
                }
                // trường hợp lấy ra order có bill chưa thanh toán
                Bill bill = bld.getBillEmpty(userId);
                ArrayList<Order> orderlist = od.getAllOrderHasBillNotPay(userId, bill.getBillId());
                request.setAttribute("orderlist", orderlist);
                request.setAttribute("pay", "pay");
                request.getRequestDispatcher("myCart.jsp").forward(request, response);
            }

        } else {
            if (type.equals("type1")) {
                int total = Integer.parseInt(request.getParameter("totalmoney"));
                User user = ud.getUserByUserId(userId);
                ArrayList<Order> odlist = ord.getAllOrderSoldout(userId);
                for (int i = 0; i < odlist.size(); i++) {
                    Product pro = prd.getProduct(odlist.get(i).getProductId());
                    if (pro.getProductQuantity() != 0) {
                        Customer customer = csd.getCustomerById(userId);
                        if (user.getUserBanlance() < total) {
                            request.setAttribute("mess", "Số dư ko đủ");
                            Bill bill = bld.getBillEmpty(userId);
                            ArrayList<Order> orderlist = od.getAllOrderHasBillNotPay(userId, bill.getBillId());
                            request.setAttribute("orderlist", orderlist);
                            request.getRequestDispatcher("myCart.jsp").forward(request, response);
                        } else if (customer.getAddressShip() == null || customer.getAddress() == null) {
                            request.setAttribute("mess", "Vui lòng cập nhật địa chỉ");
                            Bill bill = bld.getBillEmpty(userId);
                            ArrayList<Order> orderlist = od.getAllOrderHasBillNotPay(userId, bill.getBillId());
                            request.setAttribute("orderlist", orderlist);
                            request.getRequestDispatcher("myCart.jsp").forward(request, response);
                        } else {
//                            prd.updateQuantity(odlist.get(i).getProductQuantity(), pro.getProductId());
//                            sd.updateProductSold(pro.getShopId());
//                            ord.updateOrderSold(userId, 1);
//                            bld.updateBill(odlist.get(0).getBillId(), total, getDateNow(), 1);
//                            ud.updateBalance(userId, -total);
//                            ud.updateBalance(pro.getShopId(), total);
                            UpdateProductSold(odlist.get(i).getProductQuantity(), pro.getProductId(), 
                                   userId ,pro.getShopId() , total, odlist.get(0).getBillId());
                            HttpSession session = request.getSession();
                            out.println(user.getUserId());
                            session.removeAttribute("user");
                            user = ud.getUserByUserId(userId);
                            session.setAttribute("user", user);
                            request.setAttribute("mess", "Thanh toán thành công, Kiện hàng sẽ được chuyển đến " + customer.getAddressShip());
                            request.getRequestDispatcher("myCart.jsp").forward(request, response);
                        }
                    } else {
                        request.setAttribute("mess", "Sản phẩm đã hết " + pro.getProductName());
                        Bill bill = bld.getBillEmpty(userId);
                        ArrayList<Order> orderlist = od.getAllOrderHasBillNotPay(userId, bill.getBillId());
                        request.getRequestDispatcher("myCart.jsp").forward(request, response);
                    }
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

    public void UpdateProductSold(int quantityOrder,int productId,int userId,int shopId,int total ,int billId) {
        OrderDAO ord = new OrderDAO();
        ProductDAO prd = new ProductDAO();
        BillDAO bld = new BillDAO();
        UserDAO ud = new UserDAO();
        ShopDAO sd = new ShopDAO();
        
        
        prd.updateQuantity(quantityOrder, productId);
//        sd.updateProductSold(shopId);
        ord.updateOrderSold(userId, 1);
        bld.updateBill(billId, total, getDateNow(), 1);
        ud.updateBalance(userId, -total);
        ud.updateBalance(shopId, total);
        sd.updateQuantity(shopId);
        sd.updateQuantitySold(shopId);
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
