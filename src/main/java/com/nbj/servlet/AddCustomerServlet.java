package com.nbj.servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addCustomer")
public class AddCustomerServlet extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {

  String username = request.getParameter("username");
  String password = request.getParameter("password");

  try {
   Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/nbj_repair","root","");

   PreparedStatement ps = conn.prepareStatement(
    "INSERT INTO users(username,password,role) VALUES(?,?,?)");

   ps.setString(1, username);
   ps.setString(2, password);
   ps.setString(3, "customer");

   ps.executeUpdate();

   response.sendRedirect("adminDashboard.jsp");

  } catch(Exception e) {
   e.printStackTrace();
  }
 }
}