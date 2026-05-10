package com.nbj.servlet;

import com.nbj.util.DatabaseUtil;
import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "SELECT * FROM users WHERE username=? AND password=?")) {

            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String role = rs.getString("role");

                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("role", role);

                    if ("admin".equals(role)) {
                        response.sendRedirect("adminDashboard.jsp");
                    } else {
                        response.sendRedirect("customerDashboard.jsp");
                    }
                } else {
                    response.sendRedirect("login.jsp?error=1");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("ERROR: " + e.getMessage());
        }
    }
}
