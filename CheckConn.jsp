<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
Connection connection = null;
Statement helperStatement = null;
ResultSet rsHelper = null;
String helperString = "";
String helperMultipleString = "";

int helperRowsAffected = 0;
try {	
	 
	//System.setOut(new PrintStream(new FileOutputStream("output-sysout-omaha.txt")));
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//Production
	connection=DriverManager.getConnection("jdbc:sqlserver://k0xpyhrlsj.database.windows.net;databaseName=omahasogetirecruiting;user=omahasogeti@k0xpyhrlsj;password=Sogeti94");
	//Local} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	}
catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} 
%>
</body>
</html>