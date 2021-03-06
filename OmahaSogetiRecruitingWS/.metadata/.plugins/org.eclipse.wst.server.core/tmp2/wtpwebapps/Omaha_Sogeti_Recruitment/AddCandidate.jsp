<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Candidate</title>
<link href="${pageContext.request.contextPath}/stylesheets/bootstrap.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/stylesheets/font-awesome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/stylesheets/style.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/stylesheets/jquery-ui.css" rel="stylesheet"/>
</head>
<body onload = "AddCandidateOnLoad()">
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
            <form name = "addCandidateForm" action="AddCandidate" method="post">
            <input type = "hidden" id = "hiddenSkills" name = "hiddenSkills" value = "${fn:escapeXml(skillSet)}"/>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                        <div class="panel-heading">
                           CANDIDATE INFORMATION
                        </div>
                        <div class="panel-body">
  <div class="form-group">
    <label for="AddCandidateFirstName">First Name</label>
    <input type="text" class="form-control" id="AddCandidateFirstName" name = "AddCandidateFirstName" placeholder="Enter Candidate's First Name" required/>
  </div>
  <div class="form-group">
    <label for="AddCandidateLastName">Last Name</label>
    <input type="text" class="form-control" id="AddCandidateLastName" name = "AddCandidateLastName" placeholder="Enter Candidate's Last Name" required/>
  </div>
  <div class="form-group">
    <label for="AddCandidateLinkedIn">LinkedIn</label>
    <input type="text" class="form-control" id="AddCandidateLinkedIn" name = "AddCandidateLinkedIn" placeholder="Enter Candidate's LinkedIn Profile" />
  </div>
  <div class="form-group">
    <label for="AddCandidateEmail">Email</label>
    <input type="email" class="form-control" id="AddCandidateEmail" name = "AddCandidateEmail" placeholder="Enter Candidate's Email" required/>
  </div>
  <div class="form-group">
    <label for="AddCandidatePhone">Phone Number</label>
    <input type="text" class="form-control" id="AddCandidatePhone" name = "AddCandidatePhone" placeholder="Enter Candidate's Phone Number" required/>
  </div>
  <div class="form-group">
    <label for="AddCandidateSKill">Skills</label>
    <input type="text" class="form-control" id="AddCandidateSKill" name = "AddCandidateSKill" placeholder="Enter Candidate's Skills"/>
  </div>
  <div class="form-group">
    <label for="AddCandidateSalary">Salary Expectation</label>
    <input type="text" class="form-control" id="AddCandidateSalary" name = "AddCandidateSalary" placeholder="Enter Candidate's Salary Expectation"/>
  </div>
  <div class="form-group">
    <label for="AddCandidateComments">Comments</label>
  <textarea class="form-control" rows="3" placeholder="Enter your comments about this candidate" id = "AddCandidateComments" name = "AddCandidateComments"></textarea>
  </div>
                            </div>
                            </div>
                    </div>
                   <div class="col-md-6">
                        <div class="panel panel-default">
                        <div class="panel-heading">
                           OTHER INFORMATION
                        </div>
                        <div class="panel-body">
                         <div class="form-group">
    						<label for="AddCandidateMethod">Method</label>
    						
  							<select class="form-control" id = "AddCandidateMethod" name = "AddCandidateMethod">
                                                <c:forEach items="${addCandidateMethods}" var="addCandidateMethods">
					          <option value="${addCandidateMethods.key}">${addCandidateMethods.value}</option>
					        </c:forEach>
                           </select>
  						</div>
  						<div class="form-group" id = "referrer">
    						<label for="AddCandidateMethodReferal">Refered By</label>
  							<input type="text" class="form-control" id="AddCandidateMethodReferal" name = "AddCandidateMethodReferal" placeholder="Sogeti Employee who referred this candidate" />
  						</div>
  						<div class="form-group">
    						<label for="AddCandidateLevel">Level</label>
  							<select class="form-control" id = "AddCandidateLevel" name = "AddCandidateLevel">
                                                <c:forEach items="${addCandidateLevels}" var="addCandidateLevels">
					          <option value="${addCandidateLevels}">${addCandidateLevels}</option>
					        </c:forEach>
                           </select>
  						</div>
  						<div class="form-group">
    						<label for="AddCandidatePractice">Practice</label>
  							<select class="form-control" id = "AddCandidatePractice" name = "AddCandidatePractice">
                                                <c:forEach items="${addCandidatePractices}" var="addCandidatePractices">
					          <option value="${addCandidatePractices.key}">${addCandidatePractices.value}</option>
					        </c:forEach>
                           </select>
  						</div>
  						<div class="form-group">
    						<label for="AddCandidateStage">Stage</label>
  							<select class="form-control" id = "AddCandidateStage" name = "AddCandidateStage">
                                                <c:forEach items="${addCandidateStages}" var="addCandidateStages">
					          <option value="${addCandidateStages.key}">${addCandidateStages.value}</option>
					        </c:forEach>
                           </select>
  						</div>
                        </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                    <input type = "submit" id = "addCandidateSubmit" value = "Submit" />
                    </div>
                   </form>
                </div>
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
<script src="${pageContext.request.contextPath}/javascript/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/javascript/AddCandidate.js"></script>
</body>
</html>