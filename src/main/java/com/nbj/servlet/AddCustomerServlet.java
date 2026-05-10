package com.nbj.servlet;

import com.nbj.DatabaseUtil;
import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addCustomer")
public class AddCustomerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Basic validation
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            response.sendRedirect("adminDashboard.jsp?error=invalid");
            return;
        }

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "INSERT INTO users(username, password, role) VALUES(?, ?, ?)")) {

            ps.setString(1, username.trim());
            ps.setString(2, password); // TODO: Hash password in production
            ps.setString(3, "customer");

            ps.executeUpdate();
            response.sendRedirect("adminDashboard.jsp?success=customer_added");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminDashboard.jsp?error=db");
        }
    }
}
