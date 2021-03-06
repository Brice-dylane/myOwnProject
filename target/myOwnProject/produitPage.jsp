<%@ page import="operations.ProduitOperation" %>
<%@ page import="java.util.List" %>
<%@ page import="entites.Produit" %>
<%@ page import="operations.CategorieOperation" %>
<%@ page import="entites.Categorie" %>
<%@ page import="operations.TypeOperation" %>
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
<title>Produits</title>

<!-- Favicons -->
<link href="images/logo2.PNG" rel="icon">


<!-- Bootstrap core CSS -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--external css-->
<link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">
    <script src="lib/jquery/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#inlineRadio1").click(function () {
                $("#ristourne").val($(this).val());
            });
            $("#inlineRadio2").click(function () {
                $("#ristourne").val($(this).val());
            });
        });
    </script>
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
                        <li class="active"><a href="Produit">Produits</a></li>
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
                            <h1>+</h1><h4>Noveau Produit</h4>
                        </div>
                </div>
            </div>
        <div class="row mt">
            <div class="col-md-12">
                <div class="content-panel">
                    <table class="table table-striped table-advance table-hover">
                        <h4><i class="fa fa-angle-right"></i> Liste des produits</h4>
                        <hr>
                        <thead>
                        <tr>
                            <th>Nom</th>
                            <th class="hidden-phone">Catégorie</th>
                            <th>Type</th>
                            <th>Prix d'achat</th>
                            <th>Prix de vente</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            ProduitOperation o = new ProduitOperation();
                            List<Produit> list = o.entiteList();
                            for (Produit p:list){
                        %>
                        <tr>
                            <td><% out.println(p.getNom()); %></td>
                            <td><% out.println(p.getCategorie()); %></td>
                            <td><% out.println(p.getType()); %></td>
                            <td><% out.println(p.getPrix_achat()); %></td>
                            <td><% out.println(p.getPrix_vente()); %></td>
                            <td>
                                <form method="post" action="Produit">
                                <input type="text" value="delete" name="envent" style="display: none;">
                                <input type="text" value="<% out.println(p.getId()); %>" name="id" style="display: none;">
                                <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#infoProduit"><i class="fa fa-pencil"></i></button>
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

    <!--------Creer un produit Start--------->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="exampleModalCenterTitle">Ajouter un produit</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" action="Produit">
                    <div class="modal-body">
                        <input type="text" value="insert" name="envent" style="display: none;">
                            <div class="form-group">
                                <label for="name" class="col-form-label">Nom:</label>
                                <input type="text" class="form-control" name="nom" id="name" required>
                            </div>
                            <div class="form-group">
                                <label for="indexcat" class="col-form-label">catégorie:</label>
                                <select class="form-control" id="indexcat" onchange="getSelectValueCat()" required>
                                    <%
                                        CategorieOperation cat = new CategorieOperation();
                                        List<Categorie> listcat = cat.entiteList();
                                        for (Categorie c: listcat){
                                    %>
                                    <option value="<% out.println(c.getId()); %>"><% out.println(c.getNom()); %></option>
                                    <% } %>
                                </select>
                                <input type="text" name="categorie" id="categorie" style="display: none;">
                            </div>
                            <div class="form-group">
                                <label for="indextype">Type</label>
                                <select class="form-control" id="indextype"  onchange="getSelectValueTyp()" required>
                                    <%
                                        TypeOperation op = new TypeOperation();
                                        List<Type> tl = op.entiteList();
                                        for (Type t:tl){
                                    %>
                                    <option value="<% out.println(t.getId()); %>"><% out.println(t.getNom()); %></option>
                                    <% } %>
                                </select>
                                <input type="text" name="type" id="type" style="display: none;">
                            </div>
                        <div class="form-group">
                            <label for="pAchat" class="col-form-label">Prix d'achat:</label>
                            <input type="number" class="form-control" name="pAchat" id="pAchat" required>
                        </div>
                        <div class="form-group">
                            <label for="pVente" class="col-form-label">Prix de vente:</label>
                            <input type="number" class="form-control" name="pVente" id="pVente" required>
                        </div>
                        <div class="form-group">
                            <label>Ya-t-il des ristournes?</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Y">
                                <label class="form-check-label" for="inlineRadio1">Oui</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="N" checked>
                                <label class="form-check-label" for="inlineRadio2">Non</label>
                            </div>
                            <input type="text" name="ristourne" id="ristourne" value="N" style="display: none;">
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
    <!--------Creer un produit End--------->


    <!--------Info produit Start
    <div class="modal fade" id="infoProduit" tabindex="-1" role="dialog" aria-labelledby="ModalProduitTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="ModalProduitTitle">Infos du produit</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="iname" class="col-form-label">Nom:</label>
                            <input type="text" class="form-control" name="inom" id="iname" required>
                        </div>
                        <div class="form-group">
                            <label for="icategorie" class="col-form-label">catégorie:</label>
                            <select class="form-control" name="icategorie" id="icategorie" required>
                                <option>Jus</option>
                                <option>Bierre</option>
                                <option>Eau</option>
                                <option>Vin</option>
                                <option>Wisky</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="itype">Type</label>
                            <select class="form-control" name="itype" id="itype" required>
                                <option>Palette 6</option>
                                <option>Casier 12</option>
                                <option>Casier 15</option>
                                <option>Casier 24</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="ipAchat" class="col-form-label">Prix d'achat:</label>
                            <input type="number" class="form-control" name="ipAchat" id="ipAchat" required>
                        </div>
                        <div class="form-group">
                            <label for="ipVente" class="col-form-label">Prix de vente:</label>
                            <input type="number" class="form-control" name="ipVente" id="ipVente" required>
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
    --------Info produit End--------->


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
<script type="text/javascript">
        function getSelectValueCat()
        {
            var selectElmt = document.getElementById('indexcat');
            var valeur = selectElmt.options[selectElmt.selectedIndex].value;
            document.getElementById('categorie').value = valeur;
        }

        function getSelectValueTyp()
        {
            var selectElmt = document.getElementById('indextype');
            var valeur = selectElmt.options[selectElmt.selectedIndex].value;
            document.getElementById('type').value = valeur;
        }

</script>
</body>
</html>
