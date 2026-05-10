package com.nbj.servlet;

import com.nbj.DatabaseUtil;
import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateStatus")
public class UpdateStatusServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String status = request.getParameter("status");

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "UPDATE repairs SET status=? WHERE id=?")) {

            ps.setString(1, status);
            ps.setString(2, id);
            ps.executeUpdate();

            response.sendRedirect("history.jsp?success=status");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("history.jsp?error=status");
        }
    }
}
