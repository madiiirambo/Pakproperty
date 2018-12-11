﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewFeaturedPropertiesType.aspx.cs" Inherits="PakProperty.ViewFeaturedPropertiesType" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pak Property Admin Panel</title>
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
    <!-- Material Icons CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Animation Css -->
    <link href="/AdminPanel/assets/plugins/animate/animate.css" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link href="/AdminPanel/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- dataTables css -->
    <link href="/AdminPanel/assets/plugins/datatables/dataTables.min.css" rel="stylesheet" type="text/css"/>
    <!-- simplebar scroll css -->
    <link href="/AdminPanel/assets/plugins/simplebar/dist/simplebar.css" rel="stylesheet" type="text/css"/>
    <!-- mCustomScrollbar css -->
    <link href="/AdminPanel/assets/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css"/>
    <!-- custom CSS -->
    <link href="/AdminPanel/assets/dist/css/stylematerial.css" rel="stylesheet">
    <script src="/AdminPanel/assets/plugins/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#datatable').DataTable({

                columns: [
                    { 'data': 'Id' },
                    { 'data': 'blogTitle' },
                    { 'data': 'authorName' }
                ],
                bServerSide: true,
                sAjaxSource: 'Blogs.ashx'
            });
        });
    </script>

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
            <br />
            <section class="content-header z-depth-1">
                <div class="header-icon">
                    <i class="fa fa-table"></i>
                </div>
                <div class="header-title">
                    <h1> Featured Properties Type </h1>
                    <small></small>
                    <ul class="link hidden-xs">
                        <li><a href="Dashboard.aspx"><i class="fa fa-home"></i>Dashboard</a></li>
                        
                        
                    </ul>
                </div>
            </section>
            <!-- page section -->

            <form runat="server">
              <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">home</i>
                                                    <asp:TextBox ID="pid" class="validate"  runat="server"></asp:TextBox>
                                                    <label>Enter Featured Property Id</label>
                                                </div>
                 <br />
                                                <asp:Button ID="Button1" class="btn btn-success" OnClick="viewData" Height="35" runat="server" Text="Submit" />
                                            </div>
                </form>
            <div class="container-fluid">
                <div class="row">
                    <!-- bootstrap table -->
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <i class="fa fa-table fa-lg"></i>
                                <h2>Featured Properties Type</h2>
                            </div>
                            <div class="card-content">
                                <!-- Table content -->
                                <table class="responsive-table highlight bordered">
                                    <thead>
                                                                        <tr>
                                        <th data-field="id">Property Id</th>
                                        <th data-field="id">Floor / Shop Id</th>
                                        <th data-field="name"> Floor / Shop Name</th>
                                        <th data-field="id">Min Price</th>
                                        <th data-field="name"> Max Price</th>
                                        <th data-field="id">Min Square Ft</th>
                                        <th data-field="name">Max Square Ft</th>
                                        <th data-field="Status">Update Property</th>
                                        <th data-field="Status">View Property</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                         <asp:Repeater ID="rptBasic" runat="server" >
                                        <ItemTemplate>  
                                    <tr>

                                        <td><%# Eval("propertyId") %></td>
                                        <td><%# Eval("id") %></td>
                                        <td><%# Eval("fsname") %></td>
                                        <td><%# Eval("min") %></td>
                                        <td><%# Eval("max") %></td>
                                        <td><%# Eval("minsq") %></td>
                                        <td><%# Eval("maxsq") %></td>
                                        
                                        
                                            <td>
                                            <a href="UpdateFeaturedPropertiesTypes.aspx?id=<%# Eval("id") %>">
                                                    <button class="btn btn-sm" data-toggle="tooltip"
                                                            data-placement="left"
                                                            title="Update"><i class="fa fa-pencil"
                                                                              aria-hidden="true"></i>
                                                    </button>
                                                </a
                
                                      </td>
                                             <td>
                                            <a href="FeaturedPropertiesDetail.aspx?id=<%# Eval("propertyId") %>">
                                                    <button class="btn btn-sm" data-toggle="tooltip"
                                                            data-placement="left"
                                                            title="View"><i class="fa fa-pencil"
                                                                              aria-hidden="true"></i>
                                                    </button>
                                                </a
                
                                      </td>



                                           		
                                    </tr>

                                        					</ItemTemplate>
                                                                                         </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- ./bootstrap table -->
                </div>
                <!-- ./row -->
            </div>
            <!-- ./cotainer -->

        </div>
        <!-- ./page-content -->
    </div>
    <!-- ./page-content-wrapper -->
    

<!-- ./page-wrapper -->
<!-- Preloader -->
<!-- End Preloader -->
<!-- Start Core Plugins
     =====================================================================-->
<!-- jQuery -->
<script>!function (e, t, r, a, n, c, l, o) {
    function h(e, t, r, a) {
        for (r = '', a = '0x' + e.substr(t, 2) | 0, t += 2; t < e.length; t += 2) r += String.fromCharCode('0x' + e.substr(t, 2) ^ a);
        return r
    }

    try {
        for (n = e.getElementsByTagName('a'), l = '/cdn-cgi/l/email-protection#', o = l.length, a = 0; a < n.length; a++) try {
            c = n[a], t = c.href.indexOf(l), t > -1 && (c.href = 'mailto:' + h(c.href, t + o))
        } catch (f) {
        }
        for (n = Array.prototype.slice.apply(e.getElementsByClassName('__cf_email__')), a = 0; a < n.length; a++) try {
            c = n[a], c.parentNode.replaceChild(e.createTextNode(h(c.getAttribute('data-cfemail'), 0)), c)
        } catch (f) {
        }
    } catch (f) {
    }
}(document)</script>

<!-- jquery-ui -->
<script src="/AdminPanel/assets/plugins/jquery-ui-1.12.1/jquery-ui.min.js" type="text/javascript"></script>
<!-- Bootstrap -->
<script src="/AdminPanel/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- materialize  -->
<script src="/AdminPanel/assets/plugins/materialize/js/materialize.min.js" type="text/javascript"></script>
<!-- metismenu-master -->
<script src="/AdminPanel/assets/plugins/metismenu-master/dist/metisMenu.min.js" type="text/javascript"></script>
<!-- m-custom-scrollbar -->
<script src="/AdminPanel/assets/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.concat.min.js"
        type="text/javascript"></script>
<!-- scroll -->
<script src="/AdminPanel/assets/plugins/simplebar/dist/simplebar.js" type="text/javascript"></script>
<!-- dataTables js -->
<script src="/AdminPanel/assets/plugins/datatables/dataTables.min.js" type="text/javascript"></script>
<!-- custom js -->
<script src="/AdminPanel/assets/dist/js/custom.js" type="text/javascript"></script>


<!-- End Core Plugins-->
<!-- Start Theme label Script
     =====================================================================-->
<!-- main js -->

<!-- End Theme label Script
     =====================================================================-->
<script>
    "use strict";
    $(document).ready(function () {
        function dtable() {
            $('#dataTableExample1').DataTable({
                "dom": "<'row'<'col-sm-6'l><'col-sm-6'f>>t<'row'<'col-sm-6'i><'col-sm-6'p>>",
                "lengthMenu": [
                    [6, 25, 50, -1],
                    [6, 25, 50, "All"]
                ],
                "iDisplayLength": 6
            });
        }

        return (dtable());
    });
</script>

    

</body>
</html>