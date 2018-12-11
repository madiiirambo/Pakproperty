<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoldAdd.aspx.cs" Inherits="PakProperty.GoldAdd" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
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
    <!-- simplebar scroll css -->
    <link href="/AdminPanel/assets/plugins/simplebar/dist/simplebar.css" rel="stylesheet" type="text/css"/>
    <link href="/AdminPanel/assets/plugins/dropzone/dropzone.min.css" rel="stylesheet" type="text/css"/>

    <!-- mCustomScrollbar css -->
    <link href="/AdminPanel/assets/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css"/>
    <!-- custom CSS -->
    <link href="/AdminPanel/assets/dist/css/stylematerial.css" rel="stylesheet">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 70%;
        width: 50%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #description {
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
      }

      #infowindow-content .title {
        font-weight: bold;
      }

      #infowindow-content {
        display: none;
      }

      #map #infowindow-content {
        display: inline;
      }

      .pac-card {
        margin: 10px 10px 0 0;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        background-color: #fff;
        font-family: Roboto;
      }

      #pac-container {
        padding-bottom: 12px;
        margin-right: 12px;
      }

      .pac-controls {
        display: inline-block;
        padding: 5px 11px;
      }

      .pac-controls label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      #title {
        color: #fff;
        background-color: #4d90fe;
        font-size: 25px;
        font-weight: 500;
        padding: 6px 12px;
      }
        </style>
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
                    <li><a href="userDashboard.aspx"><i class="material-icons">dashboard</i>Dashboard</a>
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
                    </li><li>
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
           <form runat="server">
    <div id="page-content-wrapper">


        <!--EDIT TESTIMONIALS-->
        <div class="page-content">
            <!-- Content Header (Page header) -->
            <section class="content-header z-depth-1">
                <div class="header-icon">
                    <i class="fa fa-file-o"></i>
                </div>
                <div class="header-title">
                    <h1> Add Gold Ads</h1>
                    <small></small>
                    <ul class="link hidden-xs">
                        <li><a href="userDashboard.aspx"><i class="fa fa-home"></i>Home</a></li>
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
                                    <h2>Editor</h2>
                                    <p>Add Ads info</p>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div  class="col s12 m-t-20">
                                            



                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">business</i>
                                                <asp:TextBox ID="lat"  Font-Bold="true" ReadOnly="true" ForeColor="Black" class="validate" runat="server"></asp:TextBox>
                                                <label>Location Latitute</label>
                                            </div>

                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">business</i>
                                                <asp:TextBox ID="lng"  Font-Bold="true" ReadOnly="true" TextMode="Number" ForeColor="Black" class="validate" runat="server"></asp:TextBox>
                                                <label>Location Longitute</label>
                                            </div>

                                            <div class="input-field form-input form-input-select col s6">
                                                <div class="select-wrapper icons">


                                                    <asp:DropDownList class="icons initialized" ID="ddpurpose" runat="server">
                                                         <asp:ListItem Text="Rent" Value="1"></asp:ListItem>
                                                          <asp:ListItem Text="Sale" Value="2"></asp:ListItem>

                                                    </asp:DropDownList>
                                                    
                                                </div>
                                                <label>Select Property Purpose</label>
                                            </div>
                                            



                                            <div class="input-field form-input form-input-select col s6">
                                                <div class="select-wrapper icons">


                                                    <asp:DropDownList class="icons initialized" ID="ddtype" runat="server">
                                                         <asp:ListItem Text="House" Value="1"></asp:ListItem>
                                                          <asp:ListItem Text="Flat" Value="2"></asp:ListItem>
                                                           <asp:ListItem Text="Shop" Value="3"></asp:ListItem>
                                                           <asp:ListItem Text="Factory" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="WareHouse" Value="5"></asp:ListItem>
                                                        <asp:ListItem Text="PentHouse" Value="6"></asp:ListItem>
                                                        <asp:ListItem Text="FarmHouse" Value="7"></asp:ListItem>

                                                    </asp:DropDownList>
                                                    
                                                </div>
                                                <label>Select Property Type</label>
                                                </div>

                                            <div class="input-field form-input form-input-select col s6">
                                                <div class="select-wrapper icons">


                                                    <asp:DropDownList class="icons initialized" ID="ddcities" runat="server">
                                                         <asp:ListItem Text="Karachi" Value="1"></asp:ListItem>
                                                          <asp:ListItem Text="Lahore" Value="2"></asp:ListItem>
                                                           <asp:ListItem Text="Islamabad" Value="3"></asp:ListItem>
                                                           <asp:ListItem Text="Faisalabad" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Multan" Value="5"></asp:ListItem>
                                                        <asp:ListItem Text="Sialkot" Value="6"></asp:ListItem>
                                                        <asp:ListItem Text="Hyderabad" Value="7"></asp:ListItem>
                                                              <asp:ListItem Text="Rawalpindi" Value="8"></asp:ListItem>

                                                    </asp:DropDownList>
                                                    
                                                </div>
                                                <label>Select City</label>
                                                </div>

                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">add_location</i>
                                                <asp:TextBox ID="countryTxt" ReadOnly="true" ForeColor="Black" Text="Pakistan" Font-Bold="true" class="validate" runat="server"></asp:TextBox>
                                                <label>Country</label>
                                            </div>


                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">business</i>
                                                <asp:TextBox ID="typeaddTxt" ReadOnly="true" Text="Gold" ForeColor="Black" Font-Bold="true" class="validate" runat="server"></asp:TextBox>
                                                <label>Property Type</label>
                                            </div>

                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">business</i>
                                                <asp:TextBox ID="expireDate" ReadOnly="true" Text="1 Year" ForeColor="Black" Font-Bold="true" class="validate" runat="server"></asp:TextBox>
                                                <label>Expire Add After</label>
                                            </div>

                                            <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="pdesTxt" TextMode="MultiLine" Width="400" Height="200" runat="server" class="validate" ></asp:TextBox>
                                                    <label>Property Description</label>
                                                </div>

                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">add_location</i>
                                                <asp:TextBox ID="addtxt"  ReadOnly="true" ForeColor="Black" Font-Bold="true" class="validate" runat="server"></asp:TextBox>
                                                <label>Full Address</label>
                                            </div>

                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">business</i>
                                                <asp:TextBox ID="beds"  Font-Bold="true" TextMode="Number" class="validate" runat="server"></asp:TextBox>
                                                <label>Total Bed Rooms</label>
                                            </div>
                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">business</i>
                                                <asp:TextBox ID="baths" TextMode="Number"  Font-Bold="true" class="validate" runat="server"></asp:TextBox>
                                                <label>Total Baths</label>
                                            </div>
                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">business</i>
                                                <asp:TextBox ID="kitchen"  Font-Bold="true" TextMode="Number" class="validate" runat="server"></asp:TextBox>
                                                <label>Total Kitchen</label>
                                            </div>

                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">business</i>
                                                <asp:TextBox ID="garage"  Font-Bold="true" TextMode="Number" class="validate" runat="server"></asp:TextBox>
                                                <label>Total Garage</label>
                                            </div>

                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">business</i>
                                                <asp:TextBox ID="balcony"  Font-Bold="true" TextMode="Number" class="validate" runat="server"></asp:TextBox>
                                                <label>Total Balcony</label>
                                            </div>
                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">business</i>
                                                <asp:TextBox ID="area"  Font-Bold="true" class="validate" runat="server"></asp:TextBox>
                                                <label>Total Sq ft or Sq yard</label>
                                            </div>
                                            <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="featuresTxt" TextMode="MultiLine" Width="500" Height="200" runat="server"  class="validate" ></asp:TextBox>
                                                    <label>Property Features Or Near By Facilities For Example: Swimming Pool , Masjid , Shopping Mall , Gym , Hospital ( , comma lazmi daina har facility k baad :D )</label>
                                                </div>
                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">business</i>
                                                <asp:TextBox ID="price"  Font-Bold="true" class="validate" runat="server"></asp:TextBox>
                                                <label>Enter Price</label>
                                            </div>
     <div class="input-field form-input col s6">
                                                 <div class="card-content">
                                    <p class="m-b-15">Upload Cover Image Of Add</p>

                                        <div class="fallback">
                                            <asp:FileUpload ID="FileUpload"  runat="server" />
                                        </div>
                                    </div>
                                             </div>   
                                                </div>


                                            </div>
                                        </div>
                                    
                                
                                <!--File UPLOAD-->
                            <div class="card-header">
                                    <i class="fa fa-file-text"></i>
                                    <h2>File Upload</h2>
                                </div>
                                <div class="card-content">
                                    <p class="m-b-15">Upload Images Of Property</p>

                                        <div class="fallback">
                                            <asp:FileUpload ID="FileUpload1" AllowMultiple="true" runat="server" />
                                        </div>
                                    </div>
                                    &nbsp;&nbsp;   <asp:Button ID="Button1" class="btn btn-success"  OnClick="add"  runat="server" Text="Submit" /><br /> <br />

                                    <br>
                            </div>

                        </div>

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
    </form>
    <!-- ./page-content -->
</div>
<!-- ./page-content-wrapper -->


<!-- Preloader -->

<!-- End Preloader -->
<!-- Start Core Plugins-->

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


</body>


</html>
