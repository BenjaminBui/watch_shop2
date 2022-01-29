package com.example.watch_shop.Servlet;

import com.example.watch_shop.DAO.CartDAO;
import com.example.watch_shop.DTO.CartDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "QuanityUpdateServlet", value = "/QuanityUpdateServlet")
public class QuanityUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Operator = " ";
        int opr = Integer.parseInt(request.getParameter("opr").toString());
        int ProductID = Integer.parseInt(request.getParameter("ProductID").toString());
        HttpSession session = request.getSession();
        CartDAO dao = new CartDAO();
        if (opr == 1) {
            Operator = "+";
        } else {
            Operator = "-";
        }
        try {
            dao.UpdateQuanity(ProductID, Integer.parseInt(session.getAttribute("id").toString()), Operator);
            response.sendRedirect("cart.jsp");
        } catch (SQLException e) {
            System.out.println(e);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       CartDAO cartDAO = new CartDAO();
       HttpSession session = request.getSession();
       try{
           cartDAO.Checkout(Integer.parseInt(session.getAttribute("id").toString()));
           RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
           requestDispatcher.forward(request, response);
       }catch (Exception e){
           System.out.println(e);
       }

    }
}
