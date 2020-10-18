<%--
  Created by IntelliJ IDEA.
  User: Brice Dylane
  Date: 07/10/2020
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="images/logo2.PNG"/>
    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="css/fontawesome/css/font-awesome.css">
    <link rel="stylesheet" href="css/style_login.css">
    <title>Login</title>
</head>
<body style="background-image: url('images/hero-2.png'); background-size: cover;">
<!-- Main Content -->
<div class="container-fluid">
    <div class="row main-content bg-success text-center">
        <div class="col-md-4 text-center company__info">
            <img src="images/logo_myown.png" class="img-fluid">
        </div>
        <div class="col-md-8 col-xs-12 col-sm-12 login_form ">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 text-center">
                        <h2>Connexion</h2>
                    </div>

                </div>
                <div class="row">
                    <form action="Dashboard" method="post" class="form-group">
                        <div class="row">
                            <input type="text" name="username" id="username" class="fa fa-user form__input" placeholder="login" autofocus>
                        </div>
                        <div class="row">

                            <input type="password" name="password" id="password" class="form__input" placeholder="mot de passe">
                        </div>
                        <div class="form-check form-check-inline">
                            <input type="checkbox" name="remember_me" id="remember_me" class="form-check-input">
                            <label for="remember_me" class="form-check-label">Se souvenir de moi!</label>
                        </div>
                        <div class="row">
                            <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> Connexion</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
