<%@ page import="operations.ProduitOperation" %>
<%@ page import="entites.Produit" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="operations.EmployeOperation" %>
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
    <title>Commandes</title>

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

    <script src="lib/jquery/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#quantite").on("input", function () {
                $("#prix_total").val($(this).val()*$("#prix_achat").val());
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
                        <li><a href="Produit">Produits</a></li>
                        <li><a href="Categorie">Catégories</a></li>
                        <li><a href="Type">Types</a></li>
                        <li><a href="Magasin">Stock Magasin</a></li>
                        <li class="active"><a href="Commande">Commande</a></li>
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
    <%
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String localDate = LocalDate.now().format(formatter);
    %>
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-4">
                    <div class="text-center" data-toggle="modal" data-target="#exampleModalCenter" style="border: 1px darkgreen dashed; width: 200px; margin-top: 4%; margin-left: 4%;">
                        <h1>+</h1><h4>Nouvelle commande</h4>
                    </div>
                </div>
            </div>
            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel">
                        <div class="adv-table">
                            <table class="table table-striped table-advance table-hover table-bordered" cellpadding="0" cellspacing="0" border="0" id="hidden-table-info">
                                <form>
                                    <div class="row">
                                    <div class="col-md-3">
                                        <h4><i class="fa fa-angle-right"></i> Liste des commandes</h4>
                                    </div>
                                    <div class="col-md-2">
                                                    <select class="form-control" name="emp">
                                                        <option>Tout</option>
                                                        <option>Chantale</option>
                                                        <option>Adeline 12</option>
                                                    </select>
                                                    <span class="help-block">Trier par Employé</span>
                                    </div>
                                    <div class="col-lg-1">
                                        <select class="form-control" name="etat">
                                            <option>Tout</option>
                                            <option>Entrée</option>
                                            <option>Sortie</option>
                                        </select>
                                        <span class="help-block">Trier par Etat</span>
                                    </div>
                                        <div class="col-md-4">
                                            <div class="input-group" data-date="01/01/2014" data-date-format="mm/dd/yyyy">
                                                <span class="input-group-addon">du</span><input type="text" class="form-control dpd1" name="from">
                                                <span class="input-group-addon">au</span>
                                                <input type="text" class="form-control dpd2" name="to">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> Chercher</button>
                                        </div>
                                    </div>
                                </form>
                                <hr>
                                <thead>
                                <tr>
                                    <th>Produit</th>
                                    <th>Catégorie</th>
                                    <th>Type</th>
                                    <th>Quantité</th>
                                    <th>Prix d'achat</th>
                                    <th>Prix de vente</th>
                                    <th>Prix total</th>
                                    <th>Date</th>
                                    <th>Etat</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>Castel</td>
                                    <td>Bierre</td>
                                    <td>casier 12</td>
                                    <td>12 bouteilles </td>
                                    <td>600 Fcfa</td>
                                    <td>800 Fcfa</td>
                                    <td>9600 Fcfa</td>
                                    <td>11-10-2020</td>
                                    <td>Sortie</td>
                                    <td><button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#infoCom"><i class="fa fa-pencil"></i></button>
                                        <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                                    </td>
                                </tr>
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

    <!--------Creer un produit Start--------->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="exampleModalCenterTitle">Commander</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="indexPro" class="col-form-label">Produit:</label>
                            <select class="form-control" onchange="getSelectValuePro()" id="indexPro" required>
                                <option value="0">--Selectionner un produit--</option>
                                <%
                                    ProduitOperation op = new ProduitOperation();
                                    List<Produit> listP = op.entiteList();
                                    for (Produit p:listP){
                                %>
                                <option value="<%out.println(p.getPrix_vente()+","+p.getId());%>"><%out.println(p.getNom()+" ("+p.getType()+")");%></option>
                                <% } %>
                            </select>
                            <input type="text" name="id_pro" id="idPro" style="display: none;">
                        </div>
                        <div class="form-group">
                            <label for="prix_achat" class="col-form-label">Prix de vente:</label>
                            <input type="text" class="form-control" value="0" name="prix_vente" id="prix_achat" required readonly>
                        </div>
                        <div class="form-group">
                            <label for="quantite" class="col-form-label">Quantité:</label>
                            <input type="number" class="form-control" name="quantite" id="quantite" required>
                        </div>
                        <div class="form-group">
                            <label for="prix_total" class="col-form-label">Prix total:</label>
                            <input type="text" class="form-control" value="0" name="prix_total" id="prix_total" required readonly>
                        </div>
                        <div class="form-group">
                            <label for="employe">Employé</label>
                            <select class="form-control" name="employe" onchange="getSelectValueEmp()" id="employe" required>
                                <option value="0">--Selectionner un employé--</option>
                                <%
                                    EmployeOperation operation = new EmployeOperation();
                                    List<Employe> em = operation.entiteList();
                                    for (Employe e:em){
                                %>
                                <option value="<%out.println(e.getId());%>"><%out.println(e.getNom()+" "+e.getPrenom());%></option>
                                <% } %>
                            </select>
                            <input type="text" name="id_emp" id="idEmp" style="display: none;">
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div data-date-viewmode="years" data-date-format="dd-mm-yyyy" data-date="<%out.println(localDate);%>" class="input-append date dpYears">
                                        <label for="date" class="col-form-label">Date:</label>
                                        <input type="text" readonly="" value="<%out.println(localDate);%>" name="date" id="date" class="form-control" required>
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


    <!--------Info produit Start--
    <div class="modal fade" id="infoCom" tabindex="-1" role="dialog" aria-labelledby="ModalComTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="ModalComTitle">Modifer la commande</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="iproduit" class="col-form-label">Produit:</label>
                            <select class="form-control" name="iproduit" id="iproduit" required>
                                <option>Jus</option>
                                <option>Bierre</option>
                                <option>Eau</option>
                                <option>Vin</option>
                                <option>Wisky</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="iquantite" class="col-form-label">Quantité:</label>
                            <input type="number" class="form-control" name="iquantite" id="iquantite" required>
                        </div>
                        <div class="form-group">
                            <label for="iemploye">Employé</label>
                            <select class="form-control" name="iemploye" id="iemploye" required>
                                <option>Chantale</option>
                                <option>Adeline 12</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div data-date-viewmode="years" data-date-format="dd-MM-yyyy" data-date="01-01-2014" class="input-append date dpYears">
                                        <label for="idate" class="col-form-label">Date:</label>
                                        <input type="text" readonly="" value="01-01-2014" name="idate" size="14" id="idate" class="form-control" required>
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
    -----Info produit End--------->


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
<!--common script for all pages-->

<script type="text/javascript" language="javascript" src="lib/advanced-datatable/js/jquery.js"></script>
<script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="lib/jquery.scrollTo.min.js"></script>
<script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript" src="lib/advanced-datatable/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="lib/advanced-datatable/js/DT_bootstrap.js"></script>

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

    function getSelectValuePro()
    {
        var selectElmt = document.getElementById('indexPro');
        var chaine = selectElmt.options[selectElmt.selectedIndex].value.split(',');
        document.getElementById('prix_achat').value = chaine[0];
        document.getElementById('idPro').value = chaine[1]
    }

    function getSelectValueEmp()
    {
        var selectElmt = document.getElementById('employe');
        var chaine = selectElmt.options[selectElmt.selectedIndex].value;
        document.getElementById('idEmp').value = chaine;
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
