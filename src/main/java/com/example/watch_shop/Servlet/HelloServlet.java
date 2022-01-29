package com.example.watch_shop.Servlet;

import com.example.watch_shop.DAO.AccountDAO;
import com.example.watch_shop.DAO.ProductDAO;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        session.setAttribute("id",0);
    }

    public void destroy() {
    }
}