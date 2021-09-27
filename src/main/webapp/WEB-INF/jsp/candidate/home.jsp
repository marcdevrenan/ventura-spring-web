<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>VenturaHR</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<c:import url="/WEB-INF/jsp/access/navbar.jsp"/>

<div class="container">
    <div class="page-header">
        <h2>Ventura System</h2>
        <p>Welcome ${user.firstName}</p>
    </div>
    <h3>Job Filter</h3>
    <p>Type something in the input field to search the table for roles, cities, contract plan and more:</p>
    <input class="form-control" id="myInput" type="text" placeholder="Search...">
    <br>

    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade in">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>${message}</strong>
        </div>
    </c:if>

    <c:if test="${not empty jobs}">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Role</th>
                <th>City</th>
                <th>Contract Plan</th>
                <th>Description</th>
                <th>Profile</th>
                <th>Grade</th>
            </tr>
            </thead>
            <tbody id="myTable">
            <c:forEach var="job" items="${jobs}" varStatus="id">
                <c:forEach var="requirement" items="${job.requirementList}" varStatus="id">
                    <tr>
                        <c:choose>
                            <c:when test="${id.index == '0'}">
                                <td>${job.role}</td>
                                <td>${job.city}</td>
                                <td>${job.contractPlan}</td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                                <td></td>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                        <td>${requirement.description}</td>
                        <td>${requirement.profile}</td>
                        <td>
                            <div class="form-group">
                                <select class="form-control" name="profile">
                                    <option>Your Rating</option>
                                    <option value="5">Excellent</option>
                                    <option value="4">Very Good</option>
                                    <option value="3">Good</option>
                                    <option value="2">Moderate</option>
                                    <option value="1">Bad</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <c:set var="contains" value="false"/>
                        <c:forEach var="item" items="${applications}">
                            <c:if test="${item.jobId eq job.id}">
                                <c:set var="contains" value="true"/>
                            </c:if>
                        </c:forEach>
                        <form action="/candidateJob/applyJob" method="post" modelAttribute="candidateJob">
                            <input name="email" type="hidden" value="${user.email}"/>
                            <input name="candidateId" type="hidden" value="${user.id}"/>
                            <input name="jobId" type="hidden" value="${job.id}"/>
                            <input name="role" type="hidden" value="${job.role}"/>
                            <input name="city" type="hidden" value="${job.city}"/>
                            <c:if test="${contains eq false}">
                                <button type="submit" class="btn btn-success btn-block">Apply</button>
                            </c:if>
                            <c:if test="${contains eq true}">
                                <button type="submit" class="btn btn-secondary btn-block" disabled>Applied</button>
                            </c:if>

                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty jobs}">
        <h3>There are no job offers posted!</h3>
    </c:if>
</div>

<script>
    $(document).ready(function () {
        $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>

</body>
</html>

