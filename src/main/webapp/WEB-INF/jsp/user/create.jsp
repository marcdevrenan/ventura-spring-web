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
    <h2>User Form</h2>
    <form action="/user/create" method="post">
        <div class="form-group">

            <div class="form-group">
                <label>Role:</label>
                <div class="radio">
                    <label><input type="radio" name="type" value="A">Admin</label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="type" value="C">Candidate</label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="type" value="E">Company</label>
                </div>
            </div>

            <label>First Name:</label>
            <input type="text" class="form-control" name="firstName">
        </div>

        <div class="form-group">
            <label>Last Name:</label>
            <input type="text" class="form-control" name="lastName">
        </div>

        <div class="form-group">
            <label>Phone Number:</label>
            <input type="text" class="form-control" placeholder="(XX)-XXXXX-XXXX" name="phoneNumber">
        </div>

        <div class="form-group">
            <label>CPF:</label>
            <input type="text" class="form-control" name="cpf">
        </div>

        <div class="form-group">
            <label>Corporate Name:</label>
            <input type="text" class="form-control" name="corporateName">
        </div>

        <div class="form-group">
            <label>CNPJ:</label>
            <input type="text" class="form-control" name="cnpj">
        </div>

        <div class="form-group">
            <label>Email:</label>
            <input type="email" class="form-control" placeholder="Enter email" name="email">
        </div>

        <div class="form-group">
            <label>Password:</label>
            <input type="password" class="form-control" placeholder="Enter password" name="password">
        </div>

        <button type="submit" class="btn btn-default">Submit</button>
    </form>
</div>

</body>
</html>
