<%@ page import="com.nbj.util.DatabaseUtil, java.sql.*" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Repair History</title>
    <style>
        body{
            margin:0;
            font-family:Segoe UI;
            background:linear-gradient(135deg,#1f1f1f,#3a3a3a);
            color:white;
            padding:30px;
        }
        .card{
            background:#2b2b2b;
            padding:25px;
            border-radius:18px;
            box-shadow:0 0 20px rgba(0,0,0,.4);
        }
        table{
            width:100%;
            border-collapse:collapse;
            margin-top:20px;
        }
        th,td{
            padding:12px;
            border-bottom:1px solid #444;
            text-align:center;
        }
        th{
            background:#ff2d2d;
        }
        .message {
            padding: 10px;
            margin: 10px 0;
            border-radius: 8px;
        }
        .success { background: #2e7d32; }
        .error { background: #c62828; }
    </style>
</head>
<body>

<div class="card">
    <h2>Repair History</h2>
    
    <% 
    String success = request.getParameter("success");
    if ("added".equals(success)) out.println("<p class='message success'>Repair added successfully!</p>");
    if ("deleted".equals(success)) out.println("<p class='message success'>Repair deleted.</p>");
    if ("status".equals(success)) out.println("<p class='message success'>Status updated.</p>");
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Tracking #</th>
            <th>Customer</th>
            <th>Item</th>
            <th>Date Received</th>
            <th>Estimated</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>

        <%
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM repairs ORDER BY id DESC")) {

            while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("tracking_number") %></td>
                <td><%= rs.getString("customer_name") %></td>
                <td><%= rs.getString("item") %></td>
                <td><%= rs.getString("date_received") %></td>
                <td><%= rs.getString("estimated_date") %></td>
                <td><%= rs.getString("status") %></td>
                <td>
                    <form action="updateStatus" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <select name="status" onchange="this.form.submit()">
                            <option value="Received" <%= "Received".equals(rs.getString("status")) ? "selected" : "" %>>Received</option>
                            <option value="In Progress" <%= "In Progress".equals(rs.getString("status")) ? "selected" : "" %>>In Progress</option>
                            <option value="Ready" <%= "Ready".equals(rs.getString("status")) ? "selected" : "" %>>Ready</option>
                            <option value="Completed" <%= "Completed".equals(rs.getString("status")) ? "selected" : "" %>>Completed</option>
                        </select>
                    </form>
                    <a href="deleteRepair?id=<%= rs.getInt("id") %>" 
                       onclick="return confirm('Delete this repair?')">Delete</a>
                </td>
            </tr>
        <%
            }
        } catch (Exception e) {
            out.println("<tr><td colspan='8'>Error loading data: " + e.getMessage() + "</td></tr>");
        }
        %>
    </table>
</div>

</body>
</html>
