<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Life Span Analysis</title>
<link href="${pageContext.request.contextPath}/stylesheets/bootstrap.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/stylesheets/font-awesome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/stylesheets/style.css" rel="stylesheet"/>
</head>
<body onload = "drawChart()">
<div id="wrapper">
        <div id="page-wrapper" class="page-wrapper-cls">
            <div id="page-inner">
            
			<div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Candidate Life Span by Stages</h1>
                    </div>
                </div>
                  <div id="ex0"></div>     
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
    <footer >
        Sogeti Omaha
    </footer>
    <!-- /. FOOTER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<script src="${pageContext.request.contextPath}/javascript/jquery-2.1.3.min.js"></script>
<script src="${pageContext.request.contextPath}/javascript/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/javascript/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/javascript/custom.js"></script>
<script src="${pageContext.request.contextPath}/javascript/CandidateStageLifeSpan.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1','packages':['corechart']}]}"></script>
</body>
</html>