package com.nbj.servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/deleteRepair")
public class DeleteRepairServlet extends HttpServlet {
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {

  String id = request.getParameter("id");

  try {
   Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/nbj_repair","root","");

   PreparedStatement ps = conn.prepareStatement(
    "DELETE FROM repairs WHERE id=?");

   ps.setString(1, id);
   ps.executeUpdate();

   response.sendRedirect("history.jsp");

  } catch(Exception e) {
   e.printStackTrace();
  }
 }
}