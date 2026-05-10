
<%
if(session.getAttribute("username")==null){
response.sendRedirect("login.jsp");
}
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
max-width:600px;
margin:auto;
text-align:center;
box-shadow:0 0 20px rgba(0,0,0,.4);
}
</style>
</head>

<body>

<div class="card">
<h2>My Repair Status</h2>
<p>Your repair information will appear here.</p>
<a href="logout" style="color:#ff2d2d;">Logout</a>
</div>

</body>
</html>

