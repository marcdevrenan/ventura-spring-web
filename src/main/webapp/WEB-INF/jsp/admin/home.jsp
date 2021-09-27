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
    <h3>System Filter</h3>
    <p>Type something in the input field to search the table for anything:</p>
    <input class="form-control" id="myInput" type="text" placeholder="Search...">
    <br>

    <c:if test="${not empty users}">
        <h3>Users registered: ${users.size()}</h3>

        <table class="table table-striped">
            <thead>
            <tr>
                <th>Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>CPF</th>
                <th>Corporate Name</th>
                <th>CNPJ</th>
                <th>Type</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${users}" varStatus="id">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.phoneNumber}</td>
                    <td>${user.email}</td>
                    <td>${user.cpf}</td>
                    <td>${user.corporateName}</td>
                    <td>${user.cnpj}</td>
                    <td>${user.type}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty users}">
        <h3>There are no user registered!</h3>
    </c:if>
</div>

<br>

<div class="container">
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

<c:import url="/WEB-INF/jsp/access/footer.jsp"/>

</body>
</html>

