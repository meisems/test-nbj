<%
    if (session.getAttribute("username") == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body{
            margin:0;
            font-family:Segoe UI;
            background:linear-gradient(135deg,#1f1f1f,#3a3a3a);
            color:white;
        }
        .nav{
            background:#181818;
            padding:15px 30px;
            display:flex;
            justify-content:space-between;
            align-items:center;
        }
        .nav h2{
            color:#ff2d2d;
        }
        .nav a{
            color:white;
            text-decoration:none;
            margin-left:20px;
        }
        .container{
            display:flex;
            justify-content:center;
            align-items:center;
            height:80vh;
        }
        .card{
            background:#2b2b2b;
            padding:40px;
            border-radius:18px;
            width:400px;
            text-align:center;
            box-shadow:0 0 20px rgba(0,0,0,.4);
        }
        .btn{
            display:block;
            margin:15px 0;
            padding:12px;
            background:#ff2d2d;
            color:white;
            text-decoration:none;
            border-radius:10px;
        }
    </style>
</head>
<body>

<div class="nav">
    <h2>NBJ Repair Center - Admin</h2>
    <div>
        <span>Welcome, <%= session.getAttribute("username") %></span>
        <a href="logout">Logout</a>
    </div>
</div>

<div class="container">
    <div class="card">
        <h1>Admin Dashboard</h1>
        <a class="btn" href="addCustomer.jsp">Add New Customer</a>
        <a class="btn" href="addRepair.jsp">Add New Repair</a>
        <a class="btn" href="history.jsp">View All Repairs</a>
    </div>
</div>

</body>
</html>
