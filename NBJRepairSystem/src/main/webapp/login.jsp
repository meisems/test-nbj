
<!DOCTYPE html>
<html>
<head>
<title>NBJ Repair Center</title>
<style>
body{
margin:0;
font-family:Segoe UI;
background:linear-gradient(135deg,#1f1f1f,#3a3a3a);
color:white;
}
.container{
display:flex;
height:100vh;
}
.left{
flex:1;
padding:60px;
display:flex;
flex-direction:column;
justify-content:center;
background:#181818;
}
.left h1{
font-size:42px;
color:#ff2d2d;
margin-bottom:10px;
}
.left p{
color:#ddd;
line-height:1.8;
}
.right{
flex:1;
display:flex;
justify-content:center;
align-items:center;
}
.login-box{
background:#2b2b2b;
padding:40px;
width:340px;
border-radius:16px;
box-shadow:0 0 20px rgba(0,0,0,.5);
}
input{
width:100%;
padding:12px;
margin:10px 0;
border:none;
border-radius:8px;
}
button{
width:100%;
padding:12px;
background:#ff2d2d;
border:none;
color:white;
font-weight:bold;
border-radius:8px;
cursor:pointer;
}
button:hover{
background:#d80000;
}
</style>
</head>
<body>

<div class="container">

<div class="left">
<h1>NBJ Repair Center</h1>
<p>Refrigeration repair, aircon supply, installation, cleaning and repair.</p>
<p>Sta. Clara Congressional Road, Brgy. H2, Dasmarinas, Cavite</p>
<p>nbj.dasmacavite2@gmail.com</p>
<p>0916-553-9782</p>
</div>

<div class="right">
<div class="login-box">
<h2 align="center">Login</h2>

<form action="login" method="post">
<input type="text" name="username" placeholder="Username" required>
<input type="password" name="password" placeholder="Password" required>
<button type="submit">Login</button>
</form>

</div>
</div>

</div>

</body>
</html>
