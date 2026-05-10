<%
    if (session.getAttribute("username") == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add New Customer</title>
    <style>
        body{
            margin:0;
            font-family:Segoe UI;
            background:linear-gradient(135deg,#1f1f1f,#3a3a3a);
            color:white;
            display:flex;
            justify-content:center;
            align-items:center;
            min-height:100vh;
        }
        .card{
            background:#2b2b2b;
            padding:35px;
            border-radius:18px;
            width:380px;
            box-shadow:0 0 20px rgba(0,0,0,.4);
        }
        input, button{
            width:100%;
            padding:12px;
            margin:10px 0;
            border:none;
            border-radius:10px;
        }
        button{
            background:#ff2d2d;
            color:white;
            font-weight:bold;
            cursor:pointer;
        }
        .message {
            padding: 10px;
            margin: 10px 0;
            border-radius: 8px;
            text-align: center;
        }
        .success { background: #2e7d32; }
        .error { background: #c62828; }
    </style>
</head>
<body>

<div class="card">
    <h2>Create New Customer</h2>
    
    <% 
    String success = request.getParameter("success");
    String error = request.getParameter("error");
    
    if ("customer_added".equals(success)) out.println("<p class='message success'>Customer account created successfully!</p>");
    if ("invalid".equals(error)) out.println("<p class='message error'>Username and password cannot be empty.</p>");
    if ("db".equals(error)) out.println("<p class='message error'>Database error. Please try again.</p>");
    %>

    <form action="addCustomer" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        
        <button type="submit">Create Customer Account</button>
    </form>
    
    <br>
    <a href="adminDashboard.jsp" style="color:#ff2d2d; text-decoration:none;">← Back to Dashboard</a>
</div>

</body>
</html>
