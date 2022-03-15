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
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.User;

/**
 *
 * @author Admin
 */
public class SignupSeller extends HttpServlet {

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
            out.println("<title>Servlet SignupSeller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupSeller at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        String shopName = request.getParameter("input-shopName");
        String shopAddress = request.getParameter("input-shopAddress");
        String shopPhone = request.getParameter("input-shopPhone");
        String shopEmail = request.getParameter("input-shopEmail");
        int userId = Integer.parseInt(request.getParameter("userId"));

        ShopDAO sd = new ShopDAO();
        UserDAO ud = new UserDAO();
        CustomerDAO csd = new CustomerDAO();
        SellerDAO sld = new SellerDAO();
        RequestDAO rqd = new RequestDAO();

        User user = ud.getUserByUserId(userId);

        if (user.getUserBanlance() < 200000) {
            request.setAttribute("mess", "Tài khoản không đủ tiền vui lòng nạp thêm tiền vào tài khoản");
            request.getRequestDispatcher("Seller.jsp").forward(request, response);
        } else {
            Customer customer = csd.getCustomerById(userId);
            sld.insertSeller(userId, customer.getCustomerName(), customer.getCustomerAddress(),
                    customer.getCustomerEmail(), customer.getCustomerPhone(),
                    customer.getCustomerData(), convertGender(customer.isCustomerGender()), customer.getCustomerDOB());
            sd.insertShop(userId, shopName, shopAddress, shopPhone, shopEmail, getDateNow());
            rqd.insertRequest(userId, "Yêu cầu mở cửa hàng");
            request.setAttribute("wait", "Vui lòng đợi phản hồi từ admin");
        }

        request.getRequestDispatcher("Seller.jsp").forward(request, response);
    }

    private boolean checkPhone(String shopPhone) {

        return false;
    }

    public String getDateNow() {
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date date = new Date();
        return sdf.format(date);
    }

    public String convertGender(boolean gender) {
        if (gender) {
            return "nam";
        }
        return "nữ";
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
