package com.example.watch_shop.Servlet;

import com.example.watch_shop.DAO.AccountDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateAccountServlet", value = "/UpdateAccountServlet")
public class UpdateAccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String btn_update = request.getParameter("update");
        String btn_change = request.getParameter("change");
        HttpSession session = request.getSession();
        int Acc_Id = Integer.parseInt(session.getAttribute("id").toString());
        if (btn_update != null){
            AccountDAO accountDAO = new AccountDAO();
            accountDAO.UpdateInform(name,phone,address,Acc_Id,"");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("account.jsp");
            requestDispatcher.forward(request, response);
        }else if(btn_change != null){
            String pass = request.getParameter("password");
            String re_pass = request.getParameter("re_password");
            if(pass.equals(re_pass)){
                AccountDAO accountDAO = new AccountDAO();
                accountDAO.UpdateInform("","","",Acc_Id,pass);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request, response);
            }else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("changepassword.jsp");
                requestDispatcher.forward(request, response);
            }

        }
    }
}
