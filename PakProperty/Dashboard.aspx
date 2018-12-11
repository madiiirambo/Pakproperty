<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="PakProperty.Dashboard" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pak Property Admin Panel</title>
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="AdminPanel/assets/dist/img/ico/Shaikhani.png">
    <!-- Start Global Mandatory Style
         =====================================================================-->
    <!-- jquery-ui css -->
    <link href="AdminPanel/assets/plugins/jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
    <!-- materialize css -->
    <link href="AdminPanel/assets/plugins/materialize/css/materialize.min.css" rel="stylesheet">
    <!-- Bootstrap css-->
    <link href="AdminPanel/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Animation Css -->
    <link href="AdminPanel/assets/plugins/animate/animate.css" rel="stylesheet"/>
    <!-- Material Icons CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="AdminPanel/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- Monthly css -->
    <link href="AdminPanel/assets/plugins/monthly/monthly.css" rel="stylesheet" type="text/css"/>
    <!-- simplebar scroll css -->
    <link href="AdminPanel/assets/plugins/simplebar/dist/simplebar.css" rel="stylesheet" type="text/css"/>
    <!-- mCustomScrollbar css -->
    <link href="AdminPanel/assets/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css"/>
    <!-- custom CSS -->
    <link href="AdminPanel/assets/dist/css/stylematerial.css" rel="stylesheet">
</head>

<body>
<div id="wrapper">
    <!--navbar top-->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <!-- Logo -->
        <a class="navbar-brand pull-left" href="Dashboard.aspx">
            <img src="AdminPanel/assets/img/Logo/pp.png" alt="logo" width="205" height="50">
        </a>
        <a id="menu-toggle">
            <i class="material-icons">apps</i>
        </a>
        <div class="navbar-custom-menu hidden-xs">
            
            
            <ul class="navbar navbar-right">
                <!--Notification-->
                <li class="dropdown">
                    

                    <!--user profile-->
                <li class="dropdown">
                    <a class='dropdown-button user-pro' href='#' data-activates='dropdown-user'>
                        <img src="AdminPanel/assets/dist/img/avatar5.png" class="img-circle" height="45" width="50"
                             alt="User Image">
                    </a>
                    <ul id='dropdown-user' class='dropdown-content'>
                        <li>
                            <a href="LoginAdminPanel.aspx"><i class="material-icons">lock</i> Logout</a>
                        </li>
                    </ul>
                </li>
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
                    <li class="active-link"><a href="Dashboard.aspx"><i class="material-icons">dashboard</i>Dashboard</a>
                    </li>

                    <!--EDIT WEBSITE INFO SECTION-->
                    <li><a><i class="material-icons">web</i>Agencies<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">

                            <!--EDIT HOME PAGE INFO SECTION-->
                            <li><a href="AddAgencies.aspx">Add Agencies</a>

                            </li>
                            <!--EDIT HOME PAGE INFO SECTION END-->


                            <!--EDIT ABOUT INFO SECTION-->
                            <li><a href="viewAgencies.aspx">View Agencies</a>

                            </li>
                            <!--EDIT CONTACT INFO SECTION END-->

                        </ul>
                    </li>
                    <!--EDIT WEBSITE INFO SECTION END-->

                    <!--ADD PROPERTY INFO START-->
                    <li>
                        <a><i class="material-icons">domain</i>Featured Properties<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="AddFeaturedProperty.aspx">Add Featured Properties</a></li>
                            <li><a href="ViewFeaturedProperties.aspx">View Featured Properties</a></li>
                            <li><a href="ViewFeaturedPropertiesAgents.aspx">View Featured Properties Agents</a></li>
                            <li><a href="ViewFeaturedPropertiesType.aspx">View Featured Properties Type</a></li>
                        </ul>
                    </li>
                    <li>
                        <a><i class="material-icons">domain</i>Partners<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="AddPartners.aspx">Add Partners</a></li>
                            <li><a href="ViewPartners.aspx">View Partners</a></li>

                        </ul>
                    </li>

                     <li>
                        <a><i class="material-icons">domain</i>Advertisement<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="AddAdvertisement.aspx">Add Advertisement</a></li>
                            <li><a href="ViewAdvertisement.aspx">View Advertisement</a></li>

                        </ul>
                    </li>


                    <li>
                        <a><i class="material-icons">domain</i>Blogs<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="AddBlog.aspx">Add Blogs</a></li>
                            <li><a href="ViewBlogs.aspx">View Blogs</a></li>

                        </ul>
                    </li>


                    <li>
                        <a><i class="material-icons">domain</i>Happy Customers<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="AddHappyCustomers.aspx">Add Happy Customers</a></li>
                            <li><a href="ViewCustomers.aspx">View Happy Customers</a></li>

                        </ul>
                    </li>

                    <li>
                        <a><i class="material-icons">domain</i>Popup Adds<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="AddPopup.aspx">Add Popup Adds</a></li>
                            <li><a href="ViewPopup.aspx">View Popup Adds</a></li>

                        </ul>
                    </li>



                    <!--ADD PROPERTY INFO END-->

                    <!--ADD ADVERTISMENT -->
                    <li>
                        <a><i class="material-icons">domain</i>Property Adds <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">

                            <li><a href="ViewAllPropertyAdds.aspx">View Active Property Adds</a></li>
                            <li><a href="ViewAllExpireAdds.aspx">View Expire Property Adds</a></li>
                        </ul>
                    </li><!--ADD ADVERTISMENT END-->


                    <li>
                        <a><i class="material-icons">domain</i>Active Users<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="ViewUsers.aspx">View Users</a></li>

                        </ul>
                    </li>

                    <li>
                        <a href="LoginAdminPanel.aspx"><i class="material-icons">domain</i>Logout<span class="fa arrow"></span></a>
                        
                    </li>


                    <!--VIEW USERS START -->
                    
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

                        <li><a href="PasswordChange.aspx">Change Account Password</a></li>
                         <li><a href="AddContacts.aspx">Add Contacts</a></li>
                        <li><a href="ViewContact.aspx">View Contacts</a></li>
                        <li><a href="IndividualSms.aspx">Send Sms Individual</a></li>
                        <li><a href="SendAllSms.aspx">Send Sms All</a></li>

                    </ul>
                </div>
            </section>

     <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="panel cardbox bg-primary">
                            <div class="panel-body card-item panel-refresh">
                                <a class="refresh" href="#">
                                    <span class="fa fa-refresh"></span>
                                </a>
                                <div class="refresh-container"><i
                                        class="refresh-spinner fa fa-spinner fa-spin fa-5x"></i></div>
                                <div class="timer" data-to="780" data-speed="1500"><asp:Label ID="runningAdds" runat="server" Text="0"></asp:Label></div>
                                <div class="cardbox-icon">
                                    <i class="material-icons">directions_run</i>
                                </div>
                                <div class="card-details">
                                    <h4>Running Adds</h4>
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
                                <div class="timer" data-to="1285" data-speed="1500"><asp:Label ID="totalUserss" runat="server" Text="0"></asp:Label></div>
                                <div class="cardbox-icon">
                                    <i class="material-icons">supervisor_account</i>
                                </div>
                                <div class="card-details">
                                    <h4>Total Users</h4>
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
                                <div class="timer" data-to="920" data-speed="1500"><asp:Label ID="totalExpireAdds" runat="server" Text="0"></asp:Label></div>
                                <div class="cardbox-icon">
                                    <i class="material-icons">visibility</i>
                                </div>
                                <div class="card-details">
                                    <h4>Expire Adds</h4>
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
                                <div class="timer" data-to="51" data-speed="1500">
                                    <asp:Label ID="totalAdds" runat="server" Text="0"></asp:Label></div>
                                <div class="cardbox-icon">
                                    <i class="material-icons">email</i>
                                </div>
                                <div class="card-details">
                                    <h4>Total Adds</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./counter Number -->

                    <!-- Table content -->
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <i class="fa fa-table fa-lg"></i>
                                <h2>Waiting For Approval Or Reject Properties</h2>
                            </div>
                            <div class="card-content">
                                <!-- Table content -->
 <table class="responsive-table highlight bordered">
                                    <thead>
                                    <tr>
                                        <th data-field="id">Property Id</th>
                                        <th data-field="name"> User Name</th>
                                        <th data-field="name"> Type</th>
                                        <th data-field="name"> Price</th>

                                        <th data-field="Status">Delete Property</th>
                                        <th data-field="Status">Approved Property</th>

                                        <th data-field="Status">View Property</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                                                                <asp:Repeater ID="rptBasic" runat="server" >
                                        <ItemTemplate>
                                    <tr>
 
                                        <td><%# Eval("propertyId") %></td>
                                        <td><%# Eval("userName") %></td>
                                        <td><%# Eval("proty") %></td>
                                        <td><%# Eval("price") %></td>

                                        
                                        
                                       

                                        <td>
                                            <a href="Dashboard.aspx?id=del <%# Eval("propertyId") %>">
                                             <button class="btn btn-danger btn-sm" data-toggle="tooltip"
                                                        data-placement="right" title="Delete "><i
                                                        class="fa fa-trash-o"
                                                        aria-hidden="true"></i>
                                                </button>
                                                 </a
                                               
                                            </td>
                                            <td>
                                            <a   href="Dashboard.aspx?id=up <%# Eval("propertyId") %>">
                                                    <button class="btn btn-sm" data-toggle="tooltip"
                                                            data-placement="left"
                                                            title="Approved"><i class="fa fa-pencil"
                                                                              aria-hidden="true"></i>
                                                    </button>
                                                </a
                
                                      </td>
                                          
                                             <td>
                                            <a  href="AddDetails.aspx?id=<%# Eval("propertyId") %>" target="_blank">
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
                                <h2>New users</h2>
                            </div>
                            <div class="card-content">
                                <!-- Messages -->
                                <div class="message_inner">
                                    <div class="message_widgets">
                                        <a>
                                            <div class="inbox-item">
                                                <div class="inbox-item-img"><img src="/AdminPanel/AdminPanel/assets/dist/img/avatar.png"
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

<!-- End Preloader -->

<!-- Start Core Plugins
     =====================================================================-->
<!-- jQuery -->
<script src="AdminPanel/assets/plugins/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- jquery-ui -->
<script src="AdminPanel/assets/plugins/jquery-ui-1.12.1/jquery-ui.min.js" type="text/javascript"></script>
<!-- Bootstrap -->
<script src="AdminPanel/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- materialize  -->
<script src="AdminPanel/assets/plugins/materialize/js/materialize.min.js" type="text/javascript"></script>
<!-- metismenu-master -->
<script src="AdminPanel/assets/plugins/metismenu-master/dist/metisMenu.min.js" type="text/javascript"></script>
<!-- SlimScroll -->
<script src="AdminPanel/assets/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- m-custom-scrollbar -->
<script src="AdminPanel/assets/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.concat.min.js"
        type="text/javascript"></script>
<!-- scroll -->
<script src="AdminPanel/assets/plugins/simplebar/dist/simplebar.js" type="text/javascript"></script>
<!-- custom js -->
<script src="AdminPanel/assets/dist/js/custom.js" type="text/javascript"></script>
<!-- End Core Plugins
     =====================================================================-->
<!-- Start Page Lavel Plugins
     =====================================================================-->
<!-- Sparkline js -->
<script src="AdminPanel/assets/plugins/sparkline/sparkline.min.js" type="text/javascript"></script>
<!-- Counter js -->
<script src="AdminPanel/assets/plugins/counterup/jquery.counterup.min.js" type="text/javascript"></script>
<!-- ChartJs JavaScript -->
<script src="AdminPanel/assets/plugins/chartJs/Chart.min.js" type="text/javascript"></script>
<!-- Monthly js -->
<script src="AdminPanel/assets/plugins/monthly/monthly.js" type="text/javascript"></script>

<!-- End Page Lavel Plugins
     =====================================================================-->
<!-- Start Theme label Script
     =====================================================================-->
<!-- main js-->

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
