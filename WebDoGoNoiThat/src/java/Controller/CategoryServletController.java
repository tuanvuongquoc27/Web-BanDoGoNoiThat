/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class CategoryServletController extends HttpServlet {

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
            CategoryDAO ctd = new CategoryDAO();
            ProductDAO prd = new ProductDAO();

            String cateID = request.getParameter("categoryId");
            int categoryId = Integer.parseInt(cateID);
            ArrayList<Category> categorylist = ctd.getAllCategory();
            request.setAttribute("categorylist", categorylist);
            int end = 0;
            if (categoryId == 0) {
                end = prd.count();
            } else {
                end = prd.countCategory(categoryId);
            }

            end = ((int) end / 12) + 1;
            String start = request.getParameter("page");
            int begin;
            int last;
            if (start == null) {
                begin = 1;
                last = 12;
            } else {
                begin = Integer.parseInt(start);
                last = begin * 12;
                begin = last - 11;
            }
            if (categoryId == 0) {
                ArrayList<Product> list = prd.getAll(begin, last);
                request.setAttribute("productlist", list);
                request.setAttribute("end", end);
            } else {
                ArrayList<Product> list = prd.getAllCategoryType(begin, last, cateID, "productType");
                request.setAttribute("productlist", list);
                request.setAttribute("end", end);
            }
            request.setAttribute("cateid", categoryId);
            request.setAttribute("pageing", "cate");
            request.setAttribute("page", Integer.parseInt(start));
            request.getRequestDispatcher("HomePage.jsp").forward(request, response);

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
