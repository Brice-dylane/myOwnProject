<%@ page import="operations.TypeOperation" %>
<%@ page import="java.util.List" %>
<%@ page import="entites.Type" %><%--
  Created by IntelliJ IDEA.
  User: Brice Dylane
  Date: 07/10/2020
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Type</title>

    <!-- Favicons -->
    <link href="images/logo2.PNG" rel="icon">


    <!-- Bootstrap core CSS -->
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--external css-->
    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">

</head>

<body>
<section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>

        <!--logo start-->
        <a href="Login" class="logo"><img src="images/logo_myown.png" style="width: 150px; height: 40px;"></a>
        <!--logo end-->


        <div class="nav notify-row" id="top_menu">
            <!--  notification start -->
            <ul class="nav top-menu">



                <!-- notification dropdown start-->
                <li id="header_notification_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="fa fa-bell-o"></i>
                        <span class="badge bg-warning">7</span>
                    </a>
                    <ul class="dropdown-menu extended notification">
                        <div class="notify-arrow notify-arrow-yellow"></div>
                        <li>
                            <p class="yellow">Vous avez 7 notifications</p>
                        </li>
                        <li>
                            <a href="#">
                                <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                Stock de Castel critique.
                                <span class="small italic">4 mins.</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- notification dropdown end -->


            </ul>


            <!--  notification end -->
        </div>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="Login">Déconnection</a></li>
            </ul>
        </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
        <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">
                <p class="centered"><a href="#"><img src="images/logo2.PNG" class="img-circle" width="80"></a></p>
                <h5 class="centered">Francoise</h5>
                <li class="mt">
                    <a href="Dashboard">
                        <i class="fa fa-dashboard"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a class="active" href="javascript:;">
                        <i class="fa fa-beer"></i>
                        <span>Stock</span>
                    </a>
                    <ul class="sub">
                        <li><a href="Produit">Produits</a></li>
                        <li><a href="Categorie">Catégories</a></li>
                        <li class="active"><a href="Type">Types</a></li>
                        <li><a href="Magasin">Stock Magasin</a></li>
                        <li><a href="Commande">Commande</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="Ventes">
                        <i class="fa fa-bar-chart-o"></i>
                        <span>Ventes</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="Achats">
                        <i class="fa fa-shopping-cart"></i>
                        <span>Achats</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="Depenses">
                        <i class="fa fa-sort-amount-desc"></i>
                        <span>Dépenses</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="Inventaires">
                        <i class="fa fa-pencil-square-o"></i>
                        <span>Inventaires</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="Employe">
                        <i class="fa fa-user"></i>
                        <span>Employés</span>
                    </a>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-4">
                    <div class="text-center" data-toggle="modal" data-target="#exampleModalCenter" style="border: 1px darkgreen dashed; width: 200px; margin-top: 4%; margin-left: 4%;">
                        <h1>+</h1><h4>Nouveau type</h4>
                    </div>
                </div>
            </div>
            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel">
                        <table class="table table-striped table-advance table-hover">
                            <h4><i class="fa fa-angle-right"></i> Liste des Types</h4>
                            <hr>
                            <thead>
                            <tr>
                                <th> Nom</th>
                                <th>Nombre de bouteille</th>
                                <th>Description</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>

                            <%
                                TypeOperation typeOperation = new TypeOperation();
                                List<Type> list = typeOperation.entiteList();
                                for (Type t:list){
                            %>
                            <tr>
                                <td><% out.println(t.getNom()); %></td>
                                <td><% out.println(t.getNbr_bouteille()); %></td>
                                <td><% out.println(t.getDescription()); %></td>
                                <td>
                                    <form method="post" action="Type">
                                        <input type="text" value="delete" name="envent" style="display: none;">
                                        <input type="text" value="<% out.println(t.getId()); %>" name="id" style="display: none;">
                                        <button class="btn btn-primary btn-xs" type="button" data-toggle="modal" data-target="#infocategorie"><i class="fa fa-pencil"></i></button>
                                        <button type="submit" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                                    </form>

                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                    <!-- /content-panel -->
                </div>
                <!-- /col-md-12 -->
            </div>
        </section>
    </section>

    <!--------Creer une Catégorie Start--------->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="exampleModalCenterTitle">Ajouter un type</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" action="Type">
                    <div class="modal-body">
                        <input type="text" value="insert" name="envent" style="display: none;">
                        <div class="form-group">
                            <label for="name" class="col-form-label">Nom:</label>
                            <input type="text" class="form-control" name="nom" id="name" required>
                        </div>
                        <div class="form-group">
                            <label for="qteBouteille" class="col-form-label">Quantité de bouteille:</label>
                            <input type="number" class="form-control" name="qteBouteille" id="qteBouteille" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea class="form-control" name="description" id="description" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                        <button type="submit" class="btn btn-primary">Ajouter</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--------Creer une Catégorie End--------->


    <!--------Info Catégorie Start--------->
    <div class="modal fade" id="infocategorie" tabindex="-1" role="dialog" aria-labelledby="ModalCategorieTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="ModalCategorieTitle">Type Infos</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form>
                    <div class="modal-body">
                        <input type="text" value="update" name="event" style="display: none;">
                        <div class="form-group">
                            <label for="iname" class="col-form-label">Nom:</label>
                            <input type="text" class="form-control" name="inom" id="iname">
                        </div>
                        <div class="form-group">
                            <label for="iqteBouteille" class="col-form-label">Quantité de bouteille:</label>
                            <input type="number" class="form-control" name="iqteBouteille" id="iqteBouteille">
                        </div>
                        <div class="form-group">
                            <label for="idescription">Description</label>
                            <textarea class="form-control" name="idescription" id="idescription" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                        <button type="submit" class="btn btn-primary">Modifier</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--------Info Catégorie End--------->


    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
        <div class="text-center">
            <p>
                &copy; Copyrights <strong>Brice Nemadjeu</strong>. All Rights Reserved
            </p>
            <a href="index.html#" class="go-top">
                <i class="fa fa-angle-up"></i>
            </a>
        </div>
    </footer>
    <!--footer end-->
</section>
<!-- js placed at the end of the document so the pages load faster -->
<script src="lib/jquery/jquery.min.js"></script>
<script src="lib/bootstrap/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="lib/jquery.scrollTo.min.js"></script>
<script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
<!--common script for all pages-->
<script src="lib/common-scripts.js"></script>
</body>
</html>
