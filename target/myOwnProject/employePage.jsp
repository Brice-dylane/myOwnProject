<%@ page import="operations.EmployeOperation" %>
<%@ page import="java.util.List" %>
<%@ page import="entites.Employe" %><%--
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
<title>Employé</title>

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
                    <a href="javascript:;">
                        <i class="fa fa-beer"></i>
                        <span>Stock</span>
                    </a>
                    <ul class="sub">
                        <li><a href="Produit">Produits</a></li>
                        <li><a href="Categorie">Catégories</a></li>
                        <li><a href="Type">Types</a></li>
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
                    <a class="active" href="Employe">
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
                        <h1>+</h1><h4>Nouveau Employé</h4>
                    </div>
                </div>
            </div>
            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel">
                        <table class="table table-striped table-advance table-hover">
                            <h4><i class="fa fa-angle-right"></i> Liste des Employés</h4>
                            <hr>
                            <thead>
                            <tr>
                                <th>Nom</th>
                                <th>Prénom</th>
                                <th>Sexe</th>
                                <th>Téléphone</th>
                                <th>Numéro de CNI</th>
                                <th>Poste</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                EmployeOperation op = new EmployeOperation();
                                List<Employe> list = op.entiteList();
                                for (Employe e:list){
                            %>
                            <tr>
                                <td><% out.println(e.getNom()); %></td>
                                <td><% out.println(e.getPrenom()); %></td>
                                <td><% out.println(e.getSexe()); %></td>
                                <td><% out.println(e.getTelephone()); %></td>
                                <td><% out.println(e.getCni()); %></td>
                                <td><% out.println(e.getPoste()); %></td>
                                <td>
                                    <form method="post" action="Employe">
                                        <input type="text" value="delete" name="envent" style="display: none;">
                                        <input type="text" value="<% out.println(e.getId()); %>" name="id" style="display: none;">
                                    <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#infoEmploye"><i class="fa fa-pencil"></i></button>
                                    <button type="submit" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                                    </form>
                                </td>
                            </tr>
                            <% } %>
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
                    <h2 class="modal-title" id="exampleModalCenterTitle">Ajouter un Employés</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" action="Employe">
                    <div class="modal-body">
                        <input type="text" value="insert" name="envent" style="display: none;">
                        <div class="form-group">
                            <label for="name" class="col-form-label">Nom:</label>
                            <input type="text" class="form-control" name="name" id="name" required>
                        </div>
                        <div class="form-group">
                            <label for="prenom" class="col-form-label">Prénom:</label>
                            <input type="text" class="form-control" name="prenom" id="prenom" required>
                        </div>
                        <div class="form-group">
                            <label for="sexe" class="col-form-label">Sexe:</label>
                            <select class="form-control" name="sexe" id="sexe" required>
                                <option>Masculin</option>
                                <option>Feminin</option>
                                <option>Autre</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="poste" class="col-form-label">Poste:</label>
                            <select class="form-control" name="poste" id="poste" required>
                                <option>Gerant(e)</option>
                                <option>Caissier(e)</option>
                                <option>Serveur(se)</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="telephone" class="col-form-label">Numéro de téléphone:</label>
                            <input type="number" class="form-control" name="telephone" id="telephone" required>
                        </div>
                        <div class="form-group">
                            <label for="cni" class="col-form-label">Numéro de CNI:</label>
                            <input type="text" class="form-control" name="cni" id="cni" required>
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


    <!--------Info Catégorie Start
    <div class="modal fade" id="infoEmploye" tabindex="-1" role="dialog" aria-labelledby="ModalEmployeTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="ModalEmployeTitle">Infos de l'employé</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="iname" class="col-form-label">Nom:</label>
                            <input type="text" class="form-control" name="iname" id="iname" required>
                        </div>
                        <div class="form-group">
                            <label for="iprenom" class="col-form-label">Prénom:</label>
                            <input type="text" class="form-control" name="iprenom" id="iprenom" required>
                        </div>
                        <div class="form-group">
                            <label for="isexe" class="col-form-label">Sexe:</label>
                            <select class="form-control" name="isexe" id="isexe" required>
                                <option>Masculin</option>
                                <option>Feminin</option>
                                <option>Autre</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="iposte" class="col-form-label">Poste:</label>
                            <select class="form-control" name="iposte" id="iposte" required>
                                <option>Gérant(e)</option>
                                <option>Caissier(e)</option>
                                <option>Serveur(se)</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="itelephone" class="col-form-label">Numéro de téléphone:</label>
                            <input type="number" class="form-control" name="itelephone" id="itelephone" required>
                        </div>
                        <div class="form-group">
                            <label for="icni" class="col-form-label">Numéro de CNI:</label>
                            <input type="text" class="form-control" name="icni" id="icni" required>
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
    --------Info Catégorie End--------->


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
