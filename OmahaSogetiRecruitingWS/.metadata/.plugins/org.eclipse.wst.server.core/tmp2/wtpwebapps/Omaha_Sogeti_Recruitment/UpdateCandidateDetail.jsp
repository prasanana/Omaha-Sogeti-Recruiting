<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Candidate Details</title>
<link href="${pageContext.request.contextPath}/stylesheets/bootstrap.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/stylesheets/font-awesome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/stylesheets/style.css" rel="stylesheet"/>
</head>
<body onload = "UpdateCandidateOnLoad()">
<div id="wrapper">
        <div id="page-wrapper" class="page-wrapper-cls">
            <div id="page-inner">
            
			<div class="row">
                   <form name = "updateCandidateForm" action="UpdateCandidateDetail" method="post">
                   <input type = "hidden" id = "hiddenCandidateId" name = "hiddenCandidateId" value = <%= request.getParameter("candidateID") %>/>
            <input type = "hidden" id = "hiddenSkills" name = "hiddenSkills" value = "${fn:escapeXml(skillSets)}"/>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                        <div class="panel-heading">
                           CANDIDATE INFORMATION
                        </div>
                        <div class="panel-body">
  <div class="form-group">
    <label for="updateCandidateFirstName">First Name</label>
    <input type="text" class="form-control" id="updateCandidateFirstName" name = "updateCandidateFirstName" value = "${firstName}" required/>
  </div>
  <div class="form-group">
    <label for="updateCandidateLastName">Last Name</label>
    <input type="text" class="form-control" id="updateCandidateLastName" name = "updateCandidateLastName" value = "${lastName}" required/>
  </div>
  <div class="form-group">
    <label for="updateCandidateLinkedIn">LinkedIn</label>
    <input type="text" class="form-control" id="updateCandidateLinkedIn" name = "updateCandidateLinkedIn" value = "${linkedIn}" />
  </div>
  <div class="form-group">
    <label for="updateCandidateEmail">Email</label>
    <input type="email" class="form-control" id="updateCandidateEmail" name = "updateCandidateEmail" value = "${email}" required/>
  </div>
  <div class="form-group">
    <label for="updateCandidatePhone">Phone Number</label>
    <input type="text" class="form-control" id="updateCandidatePhone" name = "updateCandidatePhone" value = "${phoneNo}" required/>
  </div>
  <div class="form-group">
    <label for="updateCandidateSKill">Skills</label>
    <input type="text" class="form-control" id="updateCandidateSKill" name = "updateCandidateSKill" value = "${skillSet}" />
  </div>
  <div class="form-group">
    <label for="updateCandidateSalary">Salary Expectation</label>
    <input type="text" class="form-control" id="updateCandidateSalary" name = "updateCandidateSalary" value = "${salary}"/>
  </div>
  <div class="form-group">
    <label for="updateCandidateComments">Comments</label>
  <textarea class="form-control" rows="3" id = "updateCandidateComments" name = "updateCandidateComments" >${comments}</textarea>
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
    						<label for="updateCandidateMethod">Method</label>
    						
  							<select class="form-control" id = "updateCandidateMethod" name = "updateCandidateMethod" >
  							<option value="${methodId}" selected>${methodValue}</option>
                                                <c:forEach items="${methodList}" var="updateCandidateMethods">
                                                <c:if test="${updateCandidateMethods.value != methodValue}">
					          <option value="${updateCandidateMethods.key}">${updateCandidateMethods.value}</option>
					          </c:if>
					        </c:forEach>
                           </select>
  						</div>
  						<div class="form-group" id = "referrer">
    						<label for="updateCandidateMethodReferal">Refered By</label>
  							<input type="text" class="form-control" id="updateCandidateMethodReferal" name = "updateCandidateMethodReferal" value = "${referrer}"/>
  						</div>
  						<div class="form-group">
    						<label for="updateCandidateLevel">Level</label>
  							<select class="form-control" id = "updateCandidateLevel" name = "updateCandidateLevel">
  							<option value="${level}" selected>${level}</option>
                                                <c:forEach items="${levelList}" var="updateCandidateLevels">
                                                <c:if test="${updateCandidateLevels != level}">
					          <option value="${updateCandidateLevels}">${updateCandidateLevels}</option>
					          </c:if>
					        </c:forEach>
                           </select>
  						</div>
  						<div class="form-group">
  						<c:set var="practice" value="${practice}" />
    						<label for="updateCandidatePractice">Practice ${practice.value}</label>
  							<select class="form-control" id = "updateCandidatePractice" name = "updateCandidatePractice">
  							<option value="${practiceId}" selected>${practiceValue}</option>
                                                <c:forEach items="${practiceList}" var="updateCandidatePractices">
                                                <c:if test="${updateCandidatePractices.value != practiceValue}">
					          <option value="${updateCandidatePractices.key}">${updateCandidatePractices.value}</option>
					          </c:if>
					        </c:forEach>
                           </select>
  						</div>
  						</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                       
                    <input type = "submit" id = "updateCandidateSubmit" value = "Submit" />
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
<script src="${pageContext.request.contextPath}/javascript/UpdateCandidateDetail.js"></script>
</body>
</html>