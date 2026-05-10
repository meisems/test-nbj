<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Repairs</title>
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
            max-width:800px;
            margin:auto;
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
        th{ background:#ff2d2d; }
    </style>
</head>
<body>

<div class="card">
    <h2>Welcome, <%= username %>!</h2>
    <h3>Your Repair Status</h3>

    <table>
        <tr>
            <th>Tracking #</th>
            <th>Item</th>
            <th>Date Received</th>
            <th>Estimated Completion</th>
            <th>Status</th>
        </tr>

        <%
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                 "SELECT * FROM repairs WHERE username = ? ORDER BY id DESC")) {
            
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getString("tracking_number") %></td>
                <td><%= rs.getString("item") %></td>
                <td><%= rs.getString("date_received") %></td>
                <td><%= rs.getString("estimated_date") %></td>
                <td><strong><%= rs.getString("status") %></strong></td>
            </tr>
        <%
                }
            }
        } catch (Exception e) {
            out.println("<tr><td colspan='5'>Error loading repairs.</td></tr>");
        }
        %>
    </table>

    <br>
    <a href="logout" style="color:#ff2d2d;">Logout</a>
</div>

</body>
</html>
