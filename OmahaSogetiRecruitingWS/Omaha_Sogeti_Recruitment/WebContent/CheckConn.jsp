<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Connection</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
Connection connection = null;
Statement helperStatement = null;
ResultSet rsHelper = null;
String helperString = "";
String helperMultipleString = "";
String error = "null";

int helperRowsAffected = 0;
try {	
	 
	//System.setOut(new PrintStream(new FileOutputStream("output-sysout-omaha.txt")));
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//Production
	connection=DriverManager.getConnection("jdbc:sqlserver://k0xpyhrlsj.database.windows.net;databaseName=omahasogetirecruiting;user=omahasogeti@k0xpyhrlsj;password=Sogeti94");
	//Local} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	helperStatement = connection.createStatement();
	}
catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			error = e.getMessage();
		}
 catch (SQLException e) {
	// TODO Auto-generated catch block
	 error = e.getMessage();
} finally{
			try {
					if(helperStatement!=null){
						helperStatement.close();	
					}
					if(connection!=null){
						connection.close();	
					}
					if(rsHelper!=null){
						rsHelper.close();	
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}		
		}
%>
<%=connection%>
<%=error %>
</body>
</html>