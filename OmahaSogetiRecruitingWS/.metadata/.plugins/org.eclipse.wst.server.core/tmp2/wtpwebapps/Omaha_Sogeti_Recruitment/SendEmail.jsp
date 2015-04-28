<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send Email</title>
<link href="${pageContext.request.contextPath}/stylesheets/bootstrap.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/stylesheets/font-awesome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/stylesheets/style.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/stylesheets/SendEmail.css" rel="stylesheet"/>
</head>
<body onload = "fnOnload()">
<div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a  class="navbar-brand" href="#">Sogeti Omaha 
                </a>
            </div>

            <div class="notifications-wrapper">
<ul class="nav">
               
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user-plus"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user-plus"></i> My Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="fa fa-sign-out"></i> Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
            </div>
        </nav>
        <!-- /. NAV TOP  -->
        <nav  class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <div class="user-img-div">
                            <img src="${pageContext.request.contextPath}/images/user.jpg" class="img-circle" />

                           
                        </div>

                    </li>
                     <li>
                        <a  href="#"> <strong> Cassie Alexender </strong></a>
                    </li>

                    <li>
                        <a   href="https://public.tableausoftware.com/profile/prasanna7470#!/vizhome/SalesMeetingRecruitingPipelineworkbook/SalesMeetingRecruitingPipeline" target="_blank">
                        <i class="fa fa-bar-chart "></i>Pipeline Reports</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/CandidateByStage"><i class="fa fa-cubes "></i>Candidates by Stage</a>
                        
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/UpdateCandidateStage"><i class="fa fa-level-up "></i>Update Candidate Stage </a>
                        
                    </li>
                   
                     
                     <li>
                        <a href="${pageContext.request.contextPath}/FilterCandidates"><i class="fa fa-filter "></i>Filter Candidates by Skills</a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/AddCandidate"><i class="fa fa-plus "></i>Add Candidate</a>
                    </li>
                    
                     <li>
                        <a href="${pageContext.request.contextPath}/ModifyCandidateDetails"><i class="fa fa-plus "></i>Modify Candidate</a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/SendEmail"><i class="fa fa-share "></i>Bulk Email - Sogeti Pass</a>
                    </li>
                   
                </ul>
            </div>

        </nav>
        <!-- /. SIDEBAR MENU (navbar-side) -->
        <div id="page-wrapper" class="page-wrapper-cls">
            <div id="page-inner">
            
				<div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Email Candidates </h1>
                    </div>
                </div>  
       <form name = "sendEmailForm" action=SendEmail method="post">
       <div id = "rejectEmailCandidatesDiv">
       <input type="text" id="sendEmailSearch" placeholder="Sogeti Pass Candidate Search">
       <table id = "sendEmailCandidatesTable" id = "sendEmailCandidatesTable">
       <thead>
    <tr>
      <th>Select Recipients</th>
    </tr>
	</thead>
	
	<tbody>
	<c:forEach var="sogetiPassCandidates" items="${sogetiPassCandidates}">
	<c:set var="sogetiPassCandidatesParts" value="${fn:split(sogetiPassCandidates, '|')}" />
	<tr class = "searchRejectCandidates">
	<td>
	<input type="checkbox" name="candidateEmail" value="${sogetiPassCandidatesParts[1]}"> ${sogetiPassCandidatesParts[0]}
	</td>
	</tr>
	</c:forEach>
	</tbody>

       </table>
       	</div>
    <div id = "sendEmailDiv">
    	<div id = "subjectDiv">
    		<label>Subject:  </label>
    		<input type = "text" style="width: 400px" id = "subject" name = "subject" value = "Thank you for your interest in Sogeti USA LLC"/>
    	</div>
    	<label>Message:  </label>
    	<div id = "emailBodyDiv">
    	
<textarea rows="10" cols="150" name = "emailBody" id = "emailBody">Hello
We are writing to follow up regarding the status of potential employment with Sogeti USA.

We enjoyed exploring your qualifications and experience with regards to our current opportunities, and would like to thank you for your interest in our organization.

Although you possess good skills, we have decided to move forward with other candidates with experience better matching the current job requirements and business needs.

If anything should change, or if other opportunities more aligned with your background open up, we will have your resume on file for consideration.Thank you again for your time and interest in Sogeti USA, a subsidiary of the Capgemini Group. We wish you all the best in your future endeavors.

Regards
Cassie Alexander</textarea>
    	</div>
    	
    	
    </div>
       	
       		
       </form>  
       <button onclick="fnSendEmail()">Email</button>                 
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
<script src="${pageContext.request.contextPath}/javascript/SendEmail.js"></script>
</body>
</html>