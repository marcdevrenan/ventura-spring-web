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

<div class="container-fluid text-center">
    <div class="jumbotron">
        <h1>Welcome to VenturaHR</h1>
        <p>An innovative employment platform that seeks to optimize the acquisition of top talent.</p>
    </div>
</div>

<div class="container-fluid bg-3 text-center">
    <h2>Vision Document</h2><br>
    <div class="row">
        <div class="col-sm-4">
            <h4><b>Introduction</b></h4>
            <p class="text-justify">Old problems like the difficulty in measuring the return on investment (ROI) of
                stocks,
                recruitment inefficiency and poor training performance already have their solutions
                bespoke technologies. The mission of these companies is to lead to
                innovation to HR, showing that technology can reduce costs, increase efficiency and streamline the
                sector growth.</p>
        </div>
        <div class="col-sm-4">
            <h4><b>Current Scenario</b></h4>
            <p class="text-justify">VenturaSoft is an HRTech that works in the outplacement of IT professionals. Because
                of
                peculiarities of this market, the requirements for hiring have a dizzying dynamism, as
                the technologies and "stacks" adopted by companies are constantly evolving.
                The company needs to build a software solution, called VenturaHR, which
                cover all operational flows of its core activity.</p>
        </div>
        <div class="col-sm-4">
            <h4><b>Desired Solution</b></h4>
            <p class="text-justify">The VenturaHR software will feature a rich analysis through filtering
                candidate/requirement, to which a quantitative "graduation" system will be implemented for
                each requirement requested by the vacancy. In this way it is possible to graduate each candidate
                by the "intensity" of knowledge on a given subject and also separating the
                essential requirements of the desirable in each application.</p>
        </div>
    </div>
</div>
<br>

<c:import url="/WEB-INF/jsp/access/footer.jsp"/>

</body>
</html>
