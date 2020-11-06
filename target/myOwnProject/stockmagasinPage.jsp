<%@ page import="operations.CategorieOperation" %>
<%@ page import="java.util.List" %>
<%@ page import="entites.Categorie" %>
<%@ page import="operations.TypeOperation" %>
<%@ page import="entites.Type" %>
<%@ page import="entites.Magasin" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
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
    <title>Magasin</title>

    <!-- Favicons -->
    <link href="images/logo2.PNG" rel="icon">


    <!-- Bootstrap core CSS -->
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="lib/bootstrap-datepicker/css/datepicker.css" />
    <!--external css-->
    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="lib/advanced-datatable/css/DT_bootstrap.css" />

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
                        <li><a href="Type">Types</a></li>
                        <li class="active"><a href="Magasin">Stock Magasin</a></li>
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
            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel">
                        <div class="adv-table">
                            <table class="table table-striped table-advance table-hover table-bordered" cellpadding="0" cellspacing="0" border="0" id="hidden-table-info">
                                    <div class="row">
                                        <form method="post" action="Magasin">
                                            <div class="col-md-3">
                                                <input type="text" value="recherche" name="envent" style="display: none;">
                                                <h4><i class="fa fa-angle-right"></i> Produit en stock magasin</h4>
                                            </div>
                                            <div class="col-md-2">
                                                <select class="form-control" onchange="getSelectValueCat()" id="categorie">
                                                    <option value="0">--Sélectionner--</option>
                                                    <%
                                                        CategorieOperation categorieOperation = new CategorieOperation();
                                                        List<Categorie> list_cat = categorieOperation.entiteList();
                                                        for (Categorie c:list_cat){
                                                    %>
                                                    <option value="<%out.println(c.getId());%>"><%out.println(c.getNom());%></option>
                                                    <% } %>
                                                </select>
                                                <input type="text" value="0" name="categorie" id="idCat" style="display: none;">
                                                <span class="help-block">Trier par catégorie</span>
                                            </div>

                                            <div class="col-lg-2">
                                                <select class="form-control" onchange="getSelectValueType()" id="typee">
                                                    <option value="0">--Sélectionner--</option>
                                                    <%
                                                        TypeOperation typeOperation = new TypeOperation();
                                                        List<Type> typeList = typeOperation.entiteList();
                                                        for (Type t:typeList){
                                                    %>
                                                    <option value="<%out.println(t.getId());%>"><%out.println(t.getNom());%></option>
                                                    <% } %>
                                                </select>
                                                <input type="text" value="0" name="type" id="idType" style="display: none;">
                                                <span class="help-block">Trier par Type</span>
                                            </div>

                                            <div class="col-lg-2">
                                                <select class="form-control" onchange="getSelectValueEtat()" id="eta">
                                                    <option value="">--Sélectionner--</option>
                                                    <option value="e">Entrée</option>
                                                    <option value="s">Sortie</option>
                                                </select>
                                                <input type="text" value="" name="etat" id="etat" style="display: none;">
                                                <span class="help-block">Trier par Etat</span>
                                            </div>

                                            <div class="col-md-3">
                                                <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> Chercher</button>
                                            </div>
                                        </form>
                                    </div>
                                <hr>
                                <thead>
                                <tr>
                                    <th>Produit</th>
                                    <th>Catégorie</th>
                                    <th>Type</th>
                                    <th>Quantité</th>
                                    <th>Prix d'achat</th>
                                    <th>Prix de vente</th>
                                    <th>Date</th>
                                    <th>Etat</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Magasin> magasinList = (List<Magasin>) request.getAttribute("proMagasin");
                                    for (Magasin m:magasinList){
                                %>
                                <tr>
                                    <td><%out.println(m.getNomPro());%></td>
                                    <td><%out.println(m.getNomCat());%></td>
                                    <td><%out.println(m.getNomType());%></td>
                                    <td><%out.println(m.getQte());%></td>
                                    <td><%out.println(m.getPrixAchat());%></td>
                                    <td><%out.println(m.getPrixVente());%></td>
                                    <td>
                                        <%
                                            DateTimeFormatter format = DateTimeFormatter.ofPattern("dd MMMM yyyy");
                                            out.print(m.getDate().format(format));
                                        %>
                                    </td>
                                    <%
                                        if (m.getEtat().equals("Entrée")){
                                    %>
                                    <td><button type="button" class="btn btn-primary btn-xs"><i class="fa fa-level-down "></i></button> <%out.println(m.getEtat());%></td>
                                    <% } else { %>
                                    <td><button type="button" class="btn btn-danger btn-xs"><i class="fa fa-level-up "></i></button> <%out.println(m.getEtat());%></td>
                                    <% } %>
                                </tr>
                                <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- /content-panel -->
                </div>
                <!-- /col-md-12 -->
            </div>
        </section>
    </section>


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

<script type="text/javascript" src="lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="lib/jquery.scrollTo.min.js"></script>
<script src="lib/jquery.nicescroll.js" type="text/javascript"></script>

<script type="text/javascript" language="javascript" src="lib/advanced-datatable/js/jquery.js"></script>
<script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="lib/jquery.scrollTo.min.js"></script>
<script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript" src="lib/advanced-datatable/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="lib/advanced-datatable/js/DT_bootstrap.js"></script>

<!--common script for all pages-->
<script src="lib/common-scripts.js"></script>
<script src="lib/jquery-ui-1.9.2.custom.min.js"></script>
<script type="text/javascript" src="lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="lib/bootstrap-daterangepicker/date.js"></script>
<script type="text/javascript" src="lib/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="lib/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
<script src="lib/advanced-form-components.js"></script>

<script type="text/javascript">

    function getSelectValueType()
    {
        var selectElmt = document.getElementById('typee');
        var value = selectElmt.options[selectElmt.selectedIndex].value;
        document.getElementById('idType').value = value;
    }

    function getSelectValueCat()
    {
        var selectElmt = document.getElementById('categorie');
        var value = selectElmt.options[selectElmt.selectedIndex].value;
        document.getElementById('idCat').value = value;
    }

    function getSelectValueEtat() {
        var selectElmt = document.getElementById('eta');
        var value = selectElmt.options[selectElmt.selectedIndex].value;
        document.getElementById('etat').value = value;
    }
</script>

<script type="text/javascript">
    $(document).ready(function() {
        /*
         * Insert a 'details' column to the table
         */
        var nCloneTh = document.createElement('th');
        var nCloneTd = document.createElement('td');


        $('#hidden-table-info thead tr').each(function() {
            this.insertBefore(nCloneTh, this.childNodes[0]);
        });

        $('#hidden-table-info tbody tr').each(function() {
            this.insertBefore(nCloneTd.cloneNode(true), this.childNodes[0]);
        });

        /*
         * Initialse DataTables, with no sorting on the 'details' column
         */
        var oTable = $('#hidden-table-info').dataTable({
            "aoColumnDefs": [{
                "bSortable": false,
                "aTargets": [0]
            }],
            "aaSorting": [
                [1, 'asc']
            ]
        });
    });
</script>
</body>
</html>
