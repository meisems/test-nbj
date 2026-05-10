package com.nbj.servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addRepair")
public class AddRepairServlet extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {

  String customerName = request.getParameter("customerName");
  String username = request.getParameter("username");
  String item = request.getParameter("item");
  String dateReceived = request.getParameter("dateReceived");
  String estimatedDate = request.getParameter("estimatedDate");

  String tracking = "NBJ" + System.currentTimeMillis();

  try {
   Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/nbj_repair","root","");

   PreparedStatement ps = conn.prepareStatement(
   "INSERT INTO repairs(tracking_number,customer_name,username,item,date_received,estimated_date,status) VALUES(?,?,?,?,?,?,?)");

   ps.setString(1, tracking);
   ps.setString(2, customerName);
   ps.setString(3, username);
   ps.setString(4, item);
   ps.setString(5, dateReceived);
   ps.setString(6, estimatedDate);
   ps.setString(7, "Received");

   ps.executeUpdate();

   response.sendRedirect("history.jsp");

  } catch(Exception e) {
   e.printStackTrace();
  }
 }
}