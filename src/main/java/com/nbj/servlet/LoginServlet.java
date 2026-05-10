package com.nbj.servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {

  String username = request.getParameter("username");
  String password = request.getParameter("password");

  try {
   Class.forName("com.mysql.cj.jdbc.Driver");

   Connection conn = DriverManager.getConnection(
   "jdbc:mysql://localhost:3306/nbj_repair","root","");

   PreparedStatement ps = conn.prepareStatement(
   "SELECT * FROM users WHERE username=? AND password=?");

   ps.setString(1, username);
   ps.setString(2, password);

   ResultSet rs = ps.executeQuery();

   if(rs.next()){
    String role = rs.getString("role");

    HttpSession session = request.getSession();
    session.setAttribute("username", username);

    if(role.equals("admin")){
     response.sendRedirect("adminDashboard.jsp");
    }else{
     response.sendRedirect("customerDashboard.jsp");
    }
   } else {
    response.sendRedirect("login.jsp?error=1");
   }

   conn.close();

  } catch(Exception e){
   e.printStackTrace();
   response.getWriter().println("ERROR: "+e.getMessage());
  }
 }
}