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

<div class="container text-center">
    <div class="page-header">
        <h2>Create your Ventura Account</h2>
        <h4>to continue to VenturaHR</h4>
    </div>

    <form action="/user/create" method="post">
        <div class="form-group">
            <label>Role:</label>
            <label class="radio-inline">
                <input type="radio" value="A" name="type" checked>Admin
            </label>
            <label class="radio-inline">
                <input type="radio" value="C" name="type">Candidate
            </label>
            <label class="radio-inline">
                <input type="radio" value="E" name="type">Company
            </label>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <input type="email" class="form-control" style="width:555px" placeholder="example@test.com"
                       name="email">
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control" style="width:555px" placeholder="password" name="password">
            </div>
        </div>
        <br>

        <div class="row">
            <div class="col-sm-4">
                <input type="text" class="form-control" style="width:360px" placeholder="First Name" name="firstName">
            </div>
            <div class="col-sm-4">
                <input type="text" class="form-control" style="width:360px" placeholder="(XX)XXXXX-XXXX"
                       name="phoneNumber">
            </div>
            <div class="col-sm-4">
                <input type="text" class="form-control" style="width:360px" placeholder="CPF: XXX.XXX.XXX-XX"
                       name="cpf">
            </div>
        </div>
        <br>

        <div class="row">
            <div class="col-sm-4">
                <input type="text" class="form-control" style="width:360px" placeholder="Last Name" name="lastName">
            </div>
            <div class="col-sm-4">
                <input type="text" class="form-control" style="width:360px" placeholder="Corporate Name"
                       name="corporateName">
            </div>
            <div class="col-sm-4">
                <input type="text" class="form-control" style="width:360px" placeholder="CNPJ: XX.XXX.XXX/XXXX-XX"
                       name="cnpj">
            </div>
        </div>
        <br>

        <div class="row">
            <div class="col-sm-12">
                <button type="submit" class="btn btn-success">Submit</button>
            </div>
        </div>
    </form>
</div>
<br>

<c:import url="/WEB-INF/jsp/access/footer.jsp"/>

</body>
</html>