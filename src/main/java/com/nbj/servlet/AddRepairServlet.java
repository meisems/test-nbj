package com.nbj.servlet;

import com.nbj.DatabaseUtil;
import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
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

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "INSERT INTO repairs(tracking_number, customer_name, username, item, " +
                     "date_received, estimated_date, status) VALUES(?,?,?,?,?,?,?)")) {

            ps.setString(1, tracking);
            ps.setString(2, customerName);
            ps.setString(3, username);
            ps.setString(4, item);
            ps.setString(5, dateReceived);
            ps.setString(6, estimatedDate);
            ps.setString(7, "Received");

            ps.executeUpdate();
            response.sendRedirect("history.jsp?success=added");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("history.jsp?error=1");
        }
    }
}
