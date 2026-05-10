package com.nbj.servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateStatus")
public class UpdateStatusServlet extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {

  String id = request.getParameter("id");
  String status = request.getParameter("status");

  try {
   Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/nbj_repair","root","");

   PreparedStatement ps = conn.prepareStatement(
    "UPDATE repairs SET status=? WHERE id=?");

   ps.setString(1, status);
   ps.setString(2, id);

   ps.executeUpdate();

   response.sendRedirect("history.jsp");

  } catch(Exception e) {
   e.printStackTrace();
  }
 }
}