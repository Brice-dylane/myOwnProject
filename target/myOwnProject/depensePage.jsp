<%@ page import="operations.DepenseOperation" %>
<%@ page import="java.util.List" %>
<%@ page import="entites.Depense" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %><%--
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
    <title>Dépenses</title>

    <!-- Favicons -->
    <link href="images/logo2.PNG" rel="icon">


    <!-- Bootstrap core CSS -->
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="lib/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="lib/bootstrap-timepicker/compiled/timepicker.css" />
    <link rel="stylesheet" type="text/css" href="lib/bootstrap-datetimepicker/datertimepicker.css" />
    <link rel="stylesheet" type="text/css" href="lib/bootstrap-daterangepicker/daterangepicker.css" />
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
                    <a class="active" href="Depenses">
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
                        <h1>+</h1><h4>Nouvelle dépense</h4>
                    </div>
                </div>
            </div>
            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel">
                        <div class="adv-table">
                            <table class="table table-striped table-advance table-hover table-bordered" cellpadding="0" cellspacing="0" border="0" id="hidden-table-info">

                                    <div class="row">
                                        <%
                                            String from = (String) request.getAttribute("dateFrom");
                                            String to = (String) request.getAttribute("dateTo");
                                        %>
                                        <form method="post" action="Depenses">
                                        <div class="col-md-3">
                                            <input type="text" value="recherche" name="envent" style="display: none;">
                                            <h4><i class="fa fa-angle-right"></i> Liste des dépenses</h4>
                                        </div>
                                        <div class="col-md-4">
                                            <%
                                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                                                String localDate = LocalDate.now().format(formatter);
                                            %>
                                            <div class="input-group input-large" data-date-viewmode="years" data-date="01-01-2020" data-date-format="dd-mm-yyyy">
                                                <span class="input-group-addon">du</span>
                                                <input type="text" class="form-control dpd1 default-date-picker" value="<%out.println(from);%>" name="from" required>
                                                <span class="input-group-addon">au</span>
                                                <input type="text" class="form-control dpd2 default-date-picker" value="<%out.println(to);%>" name="to" required>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i> Chercher</button>
                                        </div>
                                        </form>
                                    </div>

                                <hr>
                                <thead>
                                <tr>
                                    <th>Libellé</th>
                                    <th>Montant</th>
                                    <th>Description</th>
                                    <th>Date</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Depense> list = (List<Depense>) request.getAttribute("defaultList");
                                    int total = 0;
                                    for (Depense d:list){
                                %>
                                <tr>
                                    <td><% out.println(d.getTitre()); %></td>
                                    <td><% out.println(d.getPrix()); %> Fcfa</td>
                                    <td><% out.println(d.getDescription()); %></td>
                                    <td>
                                        <%
                                            DateTimeFormatter format = DateTimeFormatter.ofPattern("dd MMMM yyyy");
                                            out.println(d.getCreer_le().format(format));
                                        %></td>
                                    <td>
                                        <form method="post" action="Depenses">
                                            <input type="text" value="delete" name="envent" style="display: none;">
                                            <input type="text" value="<% out.println(d.getId()); %>" name="id" style="display: none;">
                                       <!-- <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#infoCom"><i class="fa fa-pencil"></i></button>-->
                                        <button type="submit" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                                        </form>
                                    </td>
                                </tr>
                                <% total = total + d.getPrix(); } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- /content-panel -->
                </div>
                <!-- /col-md-12 -->
            </div>
            <div class="row mt">
                <div class="col-md-3 col-sm-3 mb text-center">
                    <h1><i class="fa fa-sort-amount-desc"></i></h1>
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <h5>Total des dépenses</h5>
                        </div>
                        <div class="col-sm-12 col-xs-12">
                            <h3><%out.println(total);%> FCFA</h3>
                        </div>
                    </div>
                    <!-- /grey-panel -->
                </div>
            </div>
        </section>
    </section>

    <!--------Creer un produit Start--------->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="exampleModalCenterTitle">Ajouter une dépense</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" action="Depenses">
                    <div class="modal-body">
                        <input type="text" value="insert" name="envent" style="display: none;">
                        <div class="form-group">
                            <label for="titre" class="col-form-label">Libellé:</label>
                            <input type="text" class="form-control" name="titre" id="titre" required>
                        </div>
                        <div class="form-group">
                            <label for="prix" class="col-form-label">Montant:</label>
                            <input type="number" class="form-control" name="prix" id="prix" required>
                        </div>
                        <div class="form-group">
                            <label for="description" class="col-form-label">Description:</label>
                            <textarea class="form-control" name="description"  id="description" required></textarea>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div data-date-viewmode="years" data-date-format="dd-mm-yyyy" data-date="<%out.println(localDate);%>" class="input-append date dpYears">
                                        <label for="date" class="col-form-label">Date:</label>
                                        <input type="text" readonly="" value="<%out.println(localDate);%>" name="date_dep" id="date" class="form-control">
                                        <span class="input-group-btn add-on">
                                            <button class="btn btn-theme" type="button"><i class="fa fa-calendar"></i></button>
                                        </span>
                                    </div>
                                </div>
                            </div>

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


    <!--------Info produit Start-
    <div class="modal fade" id="infoCom" tabindex="-1" role="dialog" aria-labelledby="ModalComTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="ModalComTitle">Modifer la dépense</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="ititre" class="col-form-label">Libellé:</label>
                            <input type="text" class="form-control" name="ititre" id="ititre" required>
                        </div>
                        <div class="form-group">
                            <label for="iprix" class="col-form-label">Montant:</label>
                            <input type="number" class="form-control" name="iprix" id="iprix" required>
                        </div>
                        <div class="form-group">
                            <label for="idescription" class="col-form-label">Description:</label>
                            <textarea class="form-control" name="idescription"  id="idescription" required></textarea>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div data-date-viewmode="years" data-date-format="dd-mm-yyyy" data-date="01-01-2014" class="input-append date dpYears">
                                        <label for="idate" class="col-form-label">Date:</label>
                                        <input type="text" readonly="" value="01-01-2014" name="idate" size="14" id="idate" class="form-control">
                                        <span class="input-group-btn add-on">
                            <button class="btn btn-theme" type="button"><i class="fa fa-calendar"></i></button>
                            </span>
                                    </div>
                                </div>
                            </div>

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
  --Info produit End--------->


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
<script type="text/javascript" src="lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
<script type="text/javascript" src="lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="lib/bootstrap-daterangepicker/date.js"></script>
<script type="text/javascript" src="lib/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="lib/bootstrap-daterangepicker/moment.min.js"></script>


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
<script type="text/javascript" src="lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
<script src="lib/advanced-form-components.js"></script>
</body>
</html>
