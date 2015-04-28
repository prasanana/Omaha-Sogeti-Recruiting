<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Omaha Unit Recruiting</title>
<link href="${pageContext.request.contextPath}/stylesheets/Login.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/stylesheets/Global.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class = "banner">
<font color="white"><h2>Omaha Unit Recruiting</h2></font>
</div>
<div class = "logo">
</div>
<section class="loginform cf">  
<form name="login" action="Login" method="post" accept-charset="utf-8">  
	<div id="error">
	<font color="red"><h3>${NoUser}</h3></font>
	</div>
    <div id="loginBox">
    <ul>  
        <li><label for="userName">User Name</label>  
        <input type="text" name="userName" id= "userName" placeholder="User Name" required></li>  
        <li><label for="password">Password</label>  
        <input type="password" name="password" id="password" placeholder="password" required></li>  
        <li>  
        <input type="submit" value="Login"></li>  
    </ul>  
    </div>
</form>  
</section>
</body>
</html>