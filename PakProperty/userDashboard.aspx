<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userDashboard.aspx.cs" Inherits="PakProperty.userDashboard" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=WINDOWS-1252">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pak Property User Panel</title>
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="/AdminPanel/assets/dist/img/ico/Shaikhani.png">
    <!-- Start Global Mandatory Style
         =====================================================================-->
    <!-- jquery-ui css -->
    <link href="/AdminPanel/assets/plugins/jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
    <!-- materialize css -->
    <link href="/AdminPanel/assets/plugins/materialize/css/materialize.min.css" rel="stylesheet">
    <!-- Bootstrap css-->
    <link href="/AdminPanel/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Animation Css -->
    <link href="/AdminPanel/assets/plugins/animate/animate.css" rel="stylesheet"/>
    <!-- Material Icons CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/AdminPanel/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- Monthly css -->
    <link href="/AdminPanel/assets/plugins/monthly/monthly.css" rel="stylesheet" type="text/css"/>
    <!-- simplebar scroll css -->
    <link href="/AdminPanel/assets/plugins/simplebar/dist/simplebar.css" rel="stylesheet" type="text/css"/>
    <!-- mCustomScrollbar css -->
    <link href="/AdminPanel/assets/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css"/>
    <!-- custom CSS -->
    <link href="/AdminPanel/assets/dist/css/stylematerial.css" rel="stylesheet">
</head>

<body>

<div id="wrapper">
    <!--navbar top-->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <!-- Logo -->
        <a class="navbar-brand pull-left" href="userDashboard.aspx">
            <img src="/AdminPanel/assets/img/Logo/pp.png" alt="logo" width="205" height="100">
        </a>
        <a id="menu-toggle">
            <i class="material-icons">apps</i>
        </a>
        <div class="navbar-custom-menu hidden-xs">

            <ul class="navbar navbar-right">
                <!--Notification-->
                <li class="dropdown">
                    
                    <!-- /.notification -->

                    <!--user profile-->
                <li class="dropdown">
                    <a class='dropdown-button user-pro' href='#' data-activates='dropdown-user'>
                        <img src="/AdminPanel/assets/dist/img/avatar5.png" class="img-circle" height="45" width="50"
                             alt="User Image">
                    </a>
                    <ul id='dropdown-user' class='dropdown-content'>
                        <li>
                            <asp:Label ID="lblName" Font-Bold="true" runat="server"  ></asp:Label>
                        </li>
                        <li>
                            <a href ="Login.aspx"><i class="material-icons">lock</i> Logout</a>
                        </li>
                    </ul>
                </li
                <!-- /.user profile -->
            </ul>
        </div>
    </nav>
    <!-- Sidebar -->
    <div id="sidebar-wrapper" class="waves-effect" data-simplebar>
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="list-header">Pak Property</li>
                    <li class="active-link"><a href="userDashboard.aspx"><i class="material-icons">dashboard</i>Dashboard</a>
                    </li>

                    
                    

                    <li>
                        <a><i class="material-icons">domain</i>Buy Packages<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="userDiamondPackage.aspx">Business Packages for Web Portal (Diamond)</a></li>
                            <li><a href="userGoldPackage.aspx">Standard Packages for Web Portal (Gold)</a></li>
                            <li><a href="userIndividualPackage.aspx">Individual  Packages for Web Portal</a></li>
                            
                        </ul>
                    </li>

                    
                    
                    <!--ADD PROPERTY INFO START-->
                    <li>
                        <a><i class="material-icons">domain</i>Property<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="AddProperty.aspx">Add Property</a></li>

                        </ul>
                    </li>
                    <!--ADD PROPERTY INFO END-->

                    <!--ADD ADVERTISMENT -->
                    
                    <!--ADD ADVERTISMENT END-->

                    <!--VIEW Enquiries START -->
                    <li>
                        <a href="Support.aspx"><i class="material-icons">domain</i>Support</a>
                    </li>
                    <li>
                        <a href="Login.aspx"><i class="material-icons">domain</i>Logout</a>
                    </li>
                    <!--View  Enquiries END-->
                    <li class="side-last"></li>
                </ul>
                <!-- ./sidebar-nav -->
            </div>
            <!-- ./sidebar -->
        </div>
        <!-- ./sidebar-nav -->
    </div>
    <!-- ./sidebar-wrapper -->
    <!-- Page content -->
    <div id="page-content-wrapper">
        <div class="page-content">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="header-icon">
                    <i class="fa fa-tachometer"></i>
                </div>
                <div class="header-title">
                    <h1> Dashboard</h1>
                    <small> Dashboard features</small>
                    <ul class="link hidden-xs">
                        <li><a href="userDashboard.aspx"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="userUpdateInfo.aspx">Update Information</a></li>
                    </ul>
                </div>
            </section>
            <!-- page section -->



            <div class="container-fluid">

                <div class="row">
                                
                                            	               <asp:Repeater ID="rptResult" runat="server" >
                                        <ItemTemplate>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="panel cardbox bg-primary">
                            <div class="panel-body card-item panel-refresh">
                                <a class="refresh" href="#">
                                    <span class="fa fa-refresh"></span>
                                </a>
                                <div class="refresh-container"><i
                                        class="refresh-spinner fa fa-spinner fa-spin fa-5x"></i></div>
                                <div class="timer" data-to="<%# Eval("diamond") %>" data-speed="1500">0</div>
                                <div class="cardbox-icon">
                                    <i class="material-icons">supervisor_account</i>
                                </div>
                                <div class="card-details">
                                    <h4>Remaining Diamond Adds</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="panel cardbox bg-success">
                            <div class="panel-body card-item panel-refresh">
                                <a class="refresh" href="#">
                                    <span class="fa fa-refresh"></span>
                                </a>
                                <div class="refresh-container"><i
                                        class="refresh-spinner fa fa-spinner fa-spin fa-5x"></i></div>
                                <div class="timer" data-to="<%# Eval("gold") %>" data-speed="1500">0</div>
                                <div class="cardbox-icon">
                                    <i class="material-icons">supervisor_account</i>
                                </div>
                                <div class="card-details">
                                    <h4>Remaining Gold Adds</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="panel cardbox bg-warning">
                            <div class="panel-body card-item panel-refresh">
                                <a class="refresh2" href="#">
                                    <span class="fa fa-refresh"></span>


                                </a>
                                <div class="refresh-container"><i
                                        class="refresh-spinner fa fa-spinner fa-spin fa-5x"></i></div>
                                <div class="timer" data-to="<%# Eval("free") %>" data-speed="1500">0</div>
                                <div class="cardbox-icon">
                                    <i class="material-icons">visibility</i>
                                </div>
                                <div class="card-details">
                                    <h4>Remaining Free Adds</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="panel cardbox bg-dark">
                            <div class="panel-body card-item panel-refresh">
                                <a class="refresh" href="#">
                                    <span class="fa fa-refresh"></span>
                                </a>
                                <div class="refresh-container"><i
                                        class="refresh-spinner fa fa-spinner fa-spin fa-5x"></i></div>
                                <div class="timer" data-to="<%# Eval("diamond") %>" data-speed="1500">0</div>
                                <div class="cardbox-icon">
                                    <i class="material-icons">email</i>
                                </div>
                                <div class="card-details">
                                    <h4>Total Enquiries</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="panel cardbox bg-dark">
                            <div class="panel-body card-item panel-refresh">
                                <a class="refresh" href="#">
                                    <span class="fa fa-refresh"></span>
                                </a>
                                <div class="refresh-container"><i
                                        class="refresh-spinner fa fa-spinner fa-spin fa-5x"></i></div>
                                <div class="timer" data-to="<%# Eval("inddia") %>" data-speed="1500">0</div>
                                <div class="cardbox-icon">
                                    <i class="material-icons">email</i>
                                </div>
                                <div class="card-details">
                                    <h4>Individual Diamond Adds</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="panel cardbox bg-dark">
                            <div class="panel-body card-item panel-refresh">
                                <a class="refresh" href="#">
                                    <span class="fa fa-refresh"></span>
                                </a>
                                <div class="refresh-container"><i
                                        class="refresh-spinner fa fa-spinner fa-spin fa-5x"></i></div>
                                <div class="timer" data-to="<%# Eval("indgold") %>" data-speed="1500">0</div>
                                <div class="cardbox-icon">
                                    <i class="material-icons">email</i>
                                </div>
                                <div class="card-details">
                                    <h4>Individual Gold Adds</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./counter Number -->
                    		</ItemTemplate>
                                 </asp:Repeater>

                    <!-- Table content -->
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <i class="fa fa-table fa-lg"></i>
                                <h2>Property Adds</h2>
                            </div>
                            <div class="card-content">
                                <!-- Table content -->


<div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th data-field="id">Property Id</th>
                                        <th data-field="name">Property Purpose</th>
                                        <th data-field="name">Property Type</th>
                                        <th data-field="name">Property Status</th>
                                        <th data-field="name">Property Price</th>
                                        <th data-field="price">Posted Add Date</th>
                                        <th data-field="Status">Expire Add Date</th>
                                        <th data-field="name">Update Location</th>
                                        <th data-field="price">Update Add Info</th>
                                        <th data-field="Status">View Add</th>
                                        
                                    </tr>
                                    </thead>
                                    <tbody>
                                            <asp:Repeater ID="rpttblAdds" runat="server">
                                            <ItemTemplate>
                                    <tr>

                                        <td><%# Eval("propertyId") %></td>
                                        <td><%# Eval("pp") %></td>
                                        <td><%# Eval("pt") %></td>
                                        <td><%# Eval("proty") %></td>
                                        <td><%# Eval("price") %></td>
                                        <td><%# Eval("postdate") %></td>
                                        <td><%# Eval("expdate") %></td>
                                        <td>
                                            <a href="userUpdateLocation.aspx?id=<%# Eval("propertyId") %>">
                                                    <button class="btn btn-sm" data-toggle="tooltip"
                                                            data-placement="left"
                                                            title="Update"><i class="fa fa-pencil"
                                                                              aria-hidden="true"></i>
                                                    </button>
                                                </a
                
                                      </td>
                                        <td>
                                            <a href="userUpdateAdd.aspx?id=<%# Eval("propertyId") %>">
                                                    <button class="btn btn-sm" data-toggle="tooltip"
                                                            data-placement="left"
                                                            title="Update"><i class="fa fa-pencil"
                                                                              aria-hidden="true"></i>
                                                    </button>
                                                </a
                
                                      </td>
                                             <td>
                                            <a target="_blank" href="AddDetails.aspx?id=<%# Eval("propertyId") %>">
                                                    <button class="btn btn-sm" data-toggle="tooltip"
                                                            data-placement="left"
                                                            title="View"><i class="fa fa-pencil"
                                                                              aria-hidden="true"></i>
                                                    </button>
                                                </a</td>
                                        </tr>

                                                </ItemTemplate>
                                        </asp:Repeater>
                                    
                                    </tbody>
                                </table>
</div>
                            </div>
                        </div>
                    </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <i class="fa fa-table fa-lg"></i>
                                <h2>Expired Property Adds</h2>
                            </div>
                            <div class="card-content">
                                <!-- Table content -->


<div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th data-field="id">Property Id</th>
                                        <th data-field="name">Property Purpose</th>
                                        <th data-field="name">Property Type</th>
                                        <th data-field="name">Property Status</th>
                                        <th data-field="name">Property Price</th>
                                        <th data-field="price">Posted Add Date</th>
                                        <th data-field="Status">Expire Add Date</th>
                                        <th data-field="name">Re-Listing Add</th>
    
                                        
                                    </tr>
                                    </thead>
                                    <tbody>
                                            <asp:Repeater ID="rpttblEAdds" runat="server">
                                            <ItemTemplate>
                                    <tr>

                                        <td><%# Eval("propertyId") %></td>
                                        <td><%# Eval("pp") %></td>
                                        <td><%# Eval("pt") %></td>
                                        <td><%# Eval("proty") %></td>
                                        <td><%# Eval("price") %></td>
                                        <td><%# Eval("postdate") %></td>
                                        <td><%# Eval("expdate") %></td>
                                        
                                        <td>
                                            <a href="userUpdateAdd.aspx?id=rep<%# Eval("propertyId") %>">
                                                    <button class="btn btn-sm" data-toggle="tooltip"
                                                            data-placement="left"
                                                            title="Update"><i class="fa fa-pencil"
                                                                              aria-hidden="true"></i>
                                                    </button>
                                                </a
                
                                        </tr>

                                                </ItemTemplate>
                                        </asp:Repeater>
                                    
                                    </tbody>
                                </table>
</div>
                            </div>
                        </div>
                    </div>
                    <!-- ./Table content -->

                    <!-- Calender -->
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <i class="fa fa-calendar-check-o fa-lg"></i>
                                <h2>Calender</h2>
                            </div>
                            <div class="card-content">
                                <!-- monthly calender -->
                                <div class="monthly_calender">
                                    <div class="monthly" id="m_calendar"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./Calender -->
                    <!-- Activities -->
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <i class="fa fa-list fa-lg"></i>
                                <h2>Running Ads</h2>
                            </div>
                            <div class="card-content">
                                <!-- Activities -->
                                <ul class="activity-list list-unstyled">
                                    <li class="activity-purple">
                                        <span class="label label-default purple"><i class="fa fa-clock-o"></i> 2 days ago</span>
                                        <p class="text-darken-1">Agent name</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- ./Activities -->
                    <!-- Inbox -->
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <i class="fa fa-list fa-lg"></i>
                                <h2>New Enquiries</h2>
                            </div>
                            <div class="card-content">
                                <!-- Messages -->
                                <div class="message_inner">
                                    <div class="message_widgets">
                                        <a>
                                            <div class="inbox-item">
                                                <div class="inbox-item-img"><img src="/AdminPanel/assets/dist/img/avatar.png"
                                                                                 class="img-circle" alt=""></div>
                                                <strong class="inbox-item-author">Name</strong>
                                                <p class="inbox-item-text">Email</p>
                                                <span class="label"><i class="fa fa-clock-o"></i> 2 days ago</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./Messages -->
                </div>
                <!-- ./row -->
            </div>
            <!-- ./cotainer -->
        </div>
        <!-- ./page-content -->
    </div>
    <!-- ./page-content-wrapper -->
</div>
<!-- ./page-wrapper -->
<!-- Preloader -->
<div id="preloader">
    <div class="preloader-position">
        <div class="preloader-wrapper big active">
            <div class="spinner-layer spinner-teal">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Preloader -->

<!-- Start Core Plugins
     =====================================================================-->
<!-- jQuery -->
<script src="/AdminPanel/assets/plugins/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- jquery-ui -->
<script src="/AdminPanel/assets/plugins/jquery-ui-1.12.1/jquery-ui.min.js" type="text/javascript"></script>
<!-- Bootstrap -->
<script src="/AdminPanel/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- materialize  -->
<script src="/AdminPanel/assets/plugins/materialize/js/materialize.min.js" type="text/javascript"></script>
<!-- metismenu-master -->
<script src="/AdminPanel/assets/plugins/metismenu-master/dist/metisMenu.min.js" type="text/javascript"></script>
<!-- SlimScroll -->
<script src="/AdminPanel/assets/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- m-custom-scrollbar -->
<script src="/AdminPanel/assets/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.concat.min.js"
        type="text/javascript"></script>
<!-- scroll -->
<script src="/AdminPanel/assets/plugins/simplebar/dist/simplebar.js" type="text/javascript"></script>
<!-- custom js -->
<script src="/AdminPanel/assets/dist/js/custom.js" type="text/javascript"></script>
<!-- End Core Plugins
     =====================================================================-->
<!-- Start Page Lavel Plugins
     =====================================================================-->
<!-- Sparkline js -->
<script src="/AdminPanel/assets/plugins/sparkline/sparkline.min.js" type="text/javascript"></script>
<!-- Counter js -->
<script src="/AdminPanel/assets/plugins/counterup/jquery.counterup.min.js" type="text/javascript"></script>
<!-- ChartJs JavaScript -->
<script src="/AdminPanel/assets/plugins/chartJs/Chart.min.js" type="text/javascript"></script>
<!-- Monthly js -->
<script src="/AdminPanel/assets/plugins/monthly/monthly.js" type="text/javascript"></script>

<!-- End Page Lavel Plugins
     =====================================================================-->
<!-- Start Theme label Script
     =====================================================================-->
<!-- main js-->
<script src="/AdminPanel/assets/dist/js/main.js" type="text/javascript"></script>
<!-- End Theme label Script
     =====================================================================-->
<script>
    $(document).ready(function () {
        "use strict";

        // Message
        function slscroll() {
            $('.chat_list , .activity-list , .message_inner').slimScroll({
                size: '3px',
                height: '320px',
                allowPageScroll: true,
                railVisible: true
            });
        }

        slscroll();

        function chatscroll() {
            $('.chat_list').slimScroll({
                size: '3px',
                height: '290px'
            });
        }

        chatscroll();

        //monthly calender
        $('#m_calendar').monthly({
            mode: 'event',
            //jsonUrl: 'events.json',
            //dataType: 'json'
            xmlUrl: 'events.xml'
        });

        //panel refresh
        $.fn.refreshMe = function (opts) {
            var $this = this,
                defaults = {
                    ms: 1500,
                    started: function () {
                    },
                    completed: function () {
                    }
                },
                settings = $.extend(defaults, opts);

            var panelToRefresh = $this.parents('.panel').find('.refresh-container');
            var dataToRefresh = $this.parents('.panel').find('.refresh-data');
            var ms = settings.ms;
            var started = settings.started;		//function before timeout
            var completed = settings.completed;	//function after timeout

            $this.click(function () {
                $this.addClass("fa-spin");
                panelToRefresh.show();
                started(dataToRefresh);
                setTimeout(function () {
                    completed(dataToRefresh);
                    panelToRefresh.fadeOut(800);
                    $this.removeClass("fa-spin");
                }, ms);
                return false;
            });
        };

        $(document).ready(function () {
            $('.refresh, .refresh2').refreshMe({
                started: function (ele) {
                    ele.html("Getting new data..");
                },
                completed: function (ele) {
                    ele.html("This is the new data after refresh..");
                }
            });
        });

        //line chart
        var ctx = document.getElementById("lineChart");
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                datasets: [{
                    label: "Total income",
                    borderColor: "#73879C",
                    borderWidth: "1",
                    backgroundColor: "#73879C",
                    data: [22, 44, 67, 43, 76, 45, 12, 45, 65, 55, 42, 61, 73]
                }, {
                    label: "Total Expense",
                    borderColor: "rgba(26, 187, 156, 0.64)",
                    borderWidth: "1",
                    backgroundColor: "rgba(26, 187, 156, 0.64)",
                    pointHighlightStroke: "rgba(26, 187, 156, 0.64)",
                    data: [16, 32, 18, 26, 42, 33, 44, 24, 19, 16, 67, 71, 65]
                }]
            },
            options: {
                responsive: true,
                tooltips: {
                    mode: 'index',
                    intersect: false
                },
                hover: {
                    mode: 'nearest',
                    intersect: true
                }

            }
        });

    });
</script>

</body>
</html>