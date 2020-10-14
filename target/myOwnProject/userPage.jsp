<%--
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
    <title>Dashboard</title>

    <!-- Favicons -->
    <link href="images/logo2.PNG" rel="icon">

    <!-- Bootstrap core CSS -->
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--external css-->
    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="lib/gritter/css/jquery.gritter.css" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">
    <script src="lib/chart-master/Chart.js"></script>

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
                    <a class="active" href="Dashboard">
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
                <div class="col-lg-9 main-chart">


                    <!--CUSTOM CHART START -->
                    <div class="border-head">
                        <div class="row">
                            <div class="col-md-2 col-md-offset-1">
                                <h3>Ventes</h3>
                            </div>
                            <form>
                                <div class="col-md-6">
                                    <div class="input-group" data-date="01/01/2014" data-date-format="mm/dd/yyyy">
                                        <span class="input-group-addon">du</span><input type="text" class="form-control dpd1" name="from">
                                        <span class="input-group-addon">au</span>
                                        <input type="text" class="form-control dpd2" name="to">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> Afficher</button>
                                </div>
                            </form>
                        </div>

                    </div>
                    <div class="custom-bar-chart">
                        <ul class="y-axis">
                            <li><span>10.000</span></li>
                            <li><span>8.000</span></li>
                            <li><span>6.000</span></li>
                            <li><span>4.000</span></li>
                            <li><span>2.000</span></li>
                            <li><span>0</span></li>
                        </ul>
                        <div class="bar">
                            <div class="title">Jus</div>
                            <div class="value tooltips" data-original-title="4000 bouteilles" data-toggle="tooltip" data-placement="top">40%</div>
                        </div>
                        <div class="bar ">
                            <div class="title">Eau</div>
                            <div class="value tooltips" data-original-title="5000 bouteilles" data-toggle="tooltip" data-placement="top">50%</div>
                        </div>
                        <div class="bar ">
                            <div class="title">Bierre</div>
                            <div class="value tooltips" data-original-title="6000 bouteilles" data-toggle="tooltip" data-placement="top">60%</div>
                        </div>
                        <div class="bar ">
                            <div class="title">Vin</div>
                            <div class="value tooltips" data-original-title="4500 bouteilles" data-toggle="tooltip" data-placement="top">45%</div>
                        </div>
                        <div class="bar">
                            <div class="title">Wisky</div>
                            <div class="value tooltips" data-original-title="3200 bouteilles" data-toggle="tooltip" data-placement="top">32%</div>
                        </div>
                    </div>
                    <!--custom chart end-->


                    <div class="row mt">
                        <!-- SERVER STATUS PANELS -->
                        <div class="col-md-3 col-sm-3 mb text-center">
                                <h1><i class="fa fa-shopping-cart"></i></h1>
                                <div class="row">
                                    <div class="col-sm-12 col-xs-12">
                                        <h3>5000000.0 FCFA</h3>
                                    </div>
                                    <div class="col-sm-12 col-xs-12">
                                        <h5>Total des achats</h5>
                                    </div>
                                </div>
                            <!-- /grey-panel -->
                        </div>
                        <!-- /col-md-4-->
                        <div class="col-md-3 col-sm-3 mb text-center">
                            <h1><i class="fa fa-bar-chart-o"></i></h1>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <h3>5000000.0 FCFA</h3>
                                </div>
                                <div class="col-sm-12 col-xs-12">
                                    <h5>Total des ventes</h5>
                                </div>
                            </div>
                            <!-- /grey-panel -->
                        </div>
                        <!-- /col-md-4 -->
                        <div class="col-md-3 col-sm-3 mb text-center">
                            <h1><i class="fa fa-sort-amount-desc"></i></h1>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <h3 style="color: firebrick;">500000.0 FCFA</h3>
                                </div>
                                <div class="col-sm-12 col-xs-12">
                                    <h5>Total des dépenses</h5>
                                </div>
                            </div>
                            <!-- /grey-panel -->
                        </div>
                        <!-- /col-md-4 -->
                        <div class="col-md-3 col-sm-3 mb text-center">
                            <h1><i class="fa fa-money"></i></h1>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <h3 style="color: seagreen;">500000.0 FCFA</h3>
                                </div>
                                <div class="col-sm-12 col-xs-12">
                                    <h5>Bénéfices</h5>
                                </div>
                            </div>
                            <!-- /grey-panel -->
                        </div>
                    </div>
                </div>
                <!-- /col-lg-9 END SECTION MIDDLE -->
                <!-- **********************************************************************************************************************************************************
                    RIGHT SIDEBAR CONTENT
                    *********************************************************************************************************************************************************** -->
                <div class="col-lg-3 ds">
                    <!-- CALENDAR-->
                    <div id="calendar" class="mb">
                        <div class="panel green-panel no-margin">
                            <div class="panel-body">
                                <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px; color: white;">
                                    <div class="arrow" style="color: white;"></div>
                                    <h3 class="popover-title" style="disadding: none; color: white;"></h3>
                                    <div id="date-popover-content" class="popover-content"  style="color: white;"></div>
                                </div>
                                <div id="my-calendar" style="color: white;"></div>
                            </div>
                        </div>
                    </div>
                    <!-- / calendar -->
                </div>
                <!-- /col-lg-3 -->
            </div>
            <!-- /row -->
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
<script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="lib/jquery.scrollTo.min.js"></script>
<script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
<script src="lib/jquery.sparkline.js"></script>
<!--common script for all pages-->
<script src="lib/common-scripts.js"></script>
<script type="text/javascript" src="lib/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="lib/gritter-conf.js"></script>
<!--script for this page-->


<script src="lib/jquery-ui-1.9.2.custom.min.js"></script>
<script type="text/javascript" src="lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="lib/bootstrap-daterangepicker/date.js"></script>
<script type="text/javascript" src="lib/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="lib/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
<script src="lib/advanced-form-components.js"></script>

<script src="lib/sparkline-chart.js"></script>
<script src="lib/zabuto_calendar.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'Bienvenu sur MyOwn!',
            // (string | mandatory) the text inside the notification
            text: 'Une application de gestion des ventes, achats, dépenses et stock des produits de boissons gazeuses.',
            // (string | optional) the image to display on the left
            image: 'images/logo2.PNG',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: false,
            // (int | optional) the time you want it to be alive for before fading out
            time: 8000,
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return false;
    });
</script>
<script type="application/javascript">
    $(document).ready(function() {
        $("#date-popover").popover({
            html: true,
            trigger: "manual"
        });
        $("#date-popover").hide();
        $("#date-popover").click(function(e) {
            $(this).hide();
        });

        $("#my-calendar").zabuto_calendar({
            action: function() {
                return myDateFunction(this.id, false);
            },
            action_nav: function() {
                return myNavFunction(this.id);
            },
            ajax: {
                url: "show_data.php?action=1",
                modal: true
            },
            legend: [{
                type: "text",
                label: "Special event",
                badge: "00"
            },
                {
                    type: "block",
                    label: "Regular event",
                }
            ]
        });
    });

    function myNavFunction(id) {
        $("#date-popover").hide();
        var nav = $("#" + id).data("navigation");
        var to = $("#" + id).data("to");
        console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
</script>
</body>
</html>
