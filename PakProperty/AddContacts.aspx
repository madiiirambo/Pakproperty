<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddContacts.aspx.cs" Inherits="PakProperty.AddContacts" %>

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
                    { 'data': 'userName' },
                    { 'data': 'address' }
                    ,
                    { 'data': 'pp' }
                    ,
                    { 'data': 'pt' }
                    ,
                    { 'data': 'proty' }
                    ,
                    { 'data': 'postdate' }
                    ,
                    { 'data': 'expdate' }
                ],
                bServerSide: true,
                sAjaxSource: 'ExpAdds.ashx'
            });
        });
    </script>

</head>

<body>
    <form runat="server">
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
                    <!--ADD ADVERTISMENT END-->

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
                    <i class="fa fa-file-o"></i>
                </div>
                <div class="header-title">
                    <h1> Add Contact</h1>
                    <small></small>
                    <ul class="link hidden-xs">
                        <li><a href="Dashboard.aspx"><i class="fa fa-home"></i>Home</a></li>
                        
                    </ul>
                </div>
            </section>
            <!-- page section -->
            <div class="container-fluid">
                <div class="card-content">
                    <div class="row">
                        <!-- tabs -->
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="card">
                                <!--TEXT EDIT-->
                                <div class="card-header">
                                    <i class="fa fa-pencil-square-o"></i>
                                    
                                    <h2>Add Contact</h2>
                                </div>
                                <div class="card-content">


                                     <div class="row">
                                                <div class="input-field form-input form-input-select col s6">
                                                <div class="select-wrapper icons">


                                                    <asp:DropDownList class="icons initialized" ID="ddcontacts" AutoPostBack="true"  runat="server">
                                                         

                                                    </asp:DropDownList>
                                                    
                                                </div>
                                                <label>Select Category</label>
                                            </div>

</div>

                                    <div class="row">
                                        <div class="col s12 m-t-20">
                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">account_circle</i>
                                                <asp:TextBox ID="contact" onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90 ) && event.keyCode!=32);" runat="server"></asp:TextBox>
                                                <label for="icon_prefix">Enter Contact Number</label>
                                            </div>
                                          

                                            
                                        </div>

                                    </div>
                                </div>

                                <div class="card-content">
                                  
                                 
                                    <asp:Button ID="Button1" OnClick="add" class="btn btn-success" runat="server"  Text="Add " />
                                    
                                    <br /><br />

                                </div>

                            </div>

                        </div>
                        <!-- Summernote -->
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="card">

                            </div>
                        </div>
                        <!-- ./Summernote -->

                        <!-- ./tabs -->
                        <!-- ./row -->
                    </div>
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
<script src="/AdminPanel/assets/plugins/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
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
<script src="/AdminPanel/assets/plugins/dropzone/dropzone.min.js" type="text/javascript"></script>

<!-- custom js -->
<script src="/AdminPanel/assets/dist/js/custom.js" type="text/javascript"></script>
<!-- End Core Plugins-->
<!-- Start Theme label Script-->
<!-- main js -->


<script>
    $(function () {
        "use strict"; // Start of use strict
        Dropzone.options.dropzoneForm = {
            paramName: "file", // The name that will be used to transfer the file
            maxFilesize: 2, // MB
            dictDefaultMessage: "<strong>Drop files here or click to upload. </strong></br>"
        };
    });
</script>
<!-- End Theme label Script-->
<script>
    "use strict";
    $(function () {
        $('select').material_select();
        Materialize.updateTextFields();
        // autocomplete
        $('input.autocomplete').autocomplete({
            data: {
                "Apple": null,
                "Microsoft": null,
                "Google": 'https://placehold.it/250x250'
            },
            limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
            onAutocomplete: function (val) {
                // Callback function when value is autcompleted.
            },
            minLength: 1 // The minimum length of the input for the autocomplete to start. Default: 1.
        });

        //datepicker
        $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15 // Creates a dropdown of 15 years to control year
        });
    });
</script>


    </form>
</body>
</html>



