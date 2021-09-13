<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

<h1>Company</h1>
<div class="container">
    <h2>Welcome ${user.corporateName}</h2>

    <a href="/create" class="btn btn-info" role="button">Post Job</a>

    <c:if test="${not empty jobs}">
        <h3>Jobs posted: ${jobs.size()}</h3>

        <table class="table table-striped">
            <thead>
            <tr>
                <th>Id</th>
                <th>Role</th>
                <th>City</th>
                <th>Contract Plan</th>
                <th>Description</th>
                <th>Profile</th>
                <th>Rate</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="job" items="${jobs}" varStatus="id">
                <c:forEach var="requirement" items="${job.requirementList}" varStatus="id">
                    <tr>
                        <c:choose>
                            <c:when test="${id.index == '0'}">
                                <td>${job.id}</td>
                                <td>${job.role}</td>
                                <td>${job.city}</td>
                                <td>${job.contractPlan}</td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                        <td>${requirement.description}</td>
                        <td>${requirement.profile}</td>
                        <td>${requirement.rate}</td>
                    </tr>
                </c:forEach>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty jobs}">
        <h3>There are no job offers posted!</h3>
    </c:if>
</div>

<c:import url="/WEB-INF/jsp/access/footer.jsp"/>

</body>
</html>
