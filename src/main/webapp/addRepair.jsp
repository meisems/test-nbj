
<!DOCTYPE html>
<html>
<head>
<title>Add Repair</title>
<style>
body{
margin:0;
font-family:Segoe UI;
background:linear-gradient(135deg,#1f1f1f,#3a3a3a);
color:white;
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}
.card{
background:#2b2b2b;
padding:35px;
border-radius:18px;
width:400px;
box-shadow:0 0 20px rgba(0,0,0,.4);
}
input,button{
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
}
</style>
</head>

<body>

<div class="card">
<h2>Add Repair</h2>

<form action="addRepair" method="post">
<input type="text" name="customerName" placeholder="Customer Name" required>
<input type="text" name="username" placeholder="Customer Username" required>
<input type="text" name="item" placeholder="Item" required>
<input type="date" name="dateReceived" required>
<input type="date" name="estimatedDate" required>

<button>Save Repair</button>
</form>

</div>

</body>
</html>

