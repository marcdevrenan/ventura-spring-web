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

<div class="container">
    <div class="page-header">
        <h2>Ventura Post Job</h2>
    </div>
    <form action="/company/postJob" method="post">
        <div class="form-group">
            <input type="hidden" name="userId" value=${user.id}>
        </div>

        <div class="form-group">
            <label>Role:</label>
            <input type="text" class="form-control" name="role" value="${job.role}">
        </div>

        <div class="form-group">
            <label>City:</label>
            <input type="text" class="form-control" name="city" value="${job.city}">
        </div>

        <div class="form-group">
            <label>Contract Plan:</label>
            <input type="text" class="form-control" name="contractPlan" value="${job.contractPlan}">
        </div>
        <button type="submit" class="btn btn-default">Next</button>
    </form>

    <c:if test="${not empty job}">
        <form action="/company/postRequirement" method="post">
            <div class="panel panel-default">
                <div class="panel-heading"><b>Job Requirements:</b></div>
                <div class="panel-body">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Description</th>
                            <th>Profile</th>
                            <th>Rate</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="requirement" items="${requirements}" varStatus="id">
                            <tr>
                                <td>${requirement.description}</td>
                                <td>${requirement.profile}</td>
                                <td>${requirement.rate}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div id="requirementList"></div>

                    <div class="col-sm-3 nopadding">
                        <div class="form-group">
                            <input type="text" class="form-control" name="description"
                                   value="${requirement.description}">
                        </div>
                    </div>

                    <div class="col-sm-3 nopadding">
                        <div class="form-group">
                            <select class="form-control" name="profile">
                                <option>Profile</option>
                                <option value="5">Mandatory</option>
                                <option value="4">Very Relevant</option>
                                <option value="3">Relevant</option>
                                <option value="2">Specific</option>
                                <option value="1">Desirable</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-sm-3 nopadding">
                        <div class="form-group">
                            <div class="input-group">
                                <select class="form-control" name="rate">
                                    <option>Rate</option>
                                    <option value="5">5</option>
                                    <option value="4">4</option>
                                    <option value="3">3</option>
                                    <option value="2">2</option>
                                    <option value="1">1</option>
                                </select>
                                <div class="input-group-btn">
                                    <button class="btn btn-success" type="submit"><span class="glyphicon glyphicon-plus"
                                                                                        aria-hidden="true"></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="clear"></div>
                </div>
            </div>
        </form>
        <form action="/company/post" method="post">
            <button type="submit" class="btn btn-default">Post</button>
        </form>
    </c:if>
</div>

<c:import url="/WEB-INF/jsp/access/footer.jsp"/>

</body>
</html>
