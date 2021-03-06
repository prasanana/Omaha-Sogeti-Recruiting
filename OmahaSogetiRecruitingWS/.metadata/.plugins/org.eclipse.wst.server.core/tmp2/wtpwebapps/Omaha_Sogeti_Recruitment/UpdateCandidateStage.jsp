<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Candidate Stage</title>
<link href="${pageContext.request.contextPath}/stylesheets/bootstrap.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/stylesheets/font-awesome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/stylesheets/style.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/stylesheets/UpdateCandidateStage.css" rel="stylesheet" type="text/css"/>
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
                        <h1 class="page-head-line">Update Candidate Stage </h1>
                    </div>
                </div>
            
<form name = "updateCandidateStageForm" class="updateCandidateStageForm" action="UpdateCandidateStage" method="post">
<input type="text" id="updateStageSearch" placeholder="Type to search">
<div class="updateStageTableDiv">
<table id="updateStageTable">
<thead>
    <tr>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Status</th>
      <th>Date Updated</th>
      <th>Comments</th>
    </tr>
</thead>

<tbody>
<c:forEach var="updateStage" items="${updateStage}">
<c:set var="updateStageParts" value="${fn:split(updateStage, '|')}" />
    <tr class = "UpdateStageData">
      <td>${updateStageParts[0]}</td>
      <td>${updateStageParts[1]}</td>
      <td>
      <select id = "stage_${updateStageParts[5]}" onchange = "fnStageChanged(this.id)">
 		<option value="${updateStageParts[2]}" selected>${updateStageParts[2]}</option>
   		<c:forEach items="${updateStageStages}" var="updateStageStagesEntry">
        <c:if test="${updateStageStagesEntry.value != updateStageParts[2]}">
            <option value="${updateStageStagesEntry.key}">${updateStageStagesEntry.value}</option>
        </c:if>
    	</c:forEach>
	 </select>
      </td>
      <td>${updateStageParts[3]}</td>
      <td><textarea rows="3" cols="50" id="comment_${updateStageParts[5]}" onchange = "fnCommentChanged(this.id)">${updateStageParts[4]}</textarea></td>
    </tr>
   </c:forEach>
</tbody>

</table>
</div>
<input type = "submit" value = "Update" />
<input type = "hidden" id = "updatedComments" name = "updatedComments" value="nothing" />
<input type = "hidden" id = "updatedStages" name = "updatedStages" value="nothing" />
</form>            
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
<script src="${pageContext.request.contextPath}/javascript/UpdateCandidateStage.js"></script>
</body>
</html>