<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDetails.aspx.cs" Inherits="PakProperty.AddDetails" %>

<!DOCTYPE html>
<html lang="zxx">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="html 5 template">
    <meta name="author" content="">
    <title>Property Details</title>
    <style>
         #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
      
    </style>
    <!-- FAVICON -->
    <link rel="shortcut icon" type="image/x-icon" href="/FrontEnd/assests/images/Logo/Shaikhani.png">
    <link rel="stylesheet" href="/FrontEnd/assests/css/jquery-ui.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i%7CMontserrat:600,800" rel="stylesheet">
    <!-- FONT AWESOME -->
    <link rel="stylesheet" href="/FrontEnd/assests/css/font-awesome.min.css">
    <!-- ARCHIVES CSS -->
    <link rel="stylesheet" href="/FrontEnd/assests/css/animate.css">
    <link rel="stylesheet" href="/FrontEnd/assests/css/magnific-popup.css">
    <link rel="stylesheet" href="/FrontEnd/assests/css/lightcase.css">
    <link rel="stylesheet" href="/FrontEnd/assests/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/FrontEnd/assests/css/bootstrap.css">
    <link rel="stylesheet" href="/FrontEnd/assests/css/styles.css">
    <link rel="stylesheet" id="color" href="/FrontEnd/assests/css/default.css">
</head>

<body class="inner-pages">
    <form runat="server">
<!-- START SECTION HEADINGS -->
<div class="header">
    <div class="header-top">
        <div class="container">
            <div class="top-info hidden-sm-down">
                <div class="call-header">
                    <p><i class="fa fa-phone" aria-hidden="true"></i>+92-21-34012421</p>
                </div>
                <div class="address-header">
                    <p><i class="fa fa-map-marker" aria-hidden="true"></i> Karachi</p>
                </div>
                <div class="mail-header">
                    <p><i class="fa fa-envelope" aria-hidden="true"></i> admin@pakproperty.co</p>
                </div>
            </div>
            <div class="top-social hidden-sm-down">
                <div class="login-wrap">
                    <ul class="d-flex">
                        <li><a href="Login.aspx"><i class="fa fa-user"></i> Login</a></li>
                        <li><a href="userRegister.aspx"><i class="fa fa-sign-in"></i> Register</a></li>
                    </ul>
                </div>
                <div class="social-icons-header">
                    <div class="social-icons">
                        <a target="_blank" href="https://www.facebook.com/theshaikhanirealestateandmarketing/"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a target="_blank" href="https://twitter.com/"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a target="_blank" href="https://mail.google.com"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                    </div>
                </div>
                <a href="Index.aspx" class="logo">
                    <img src="/FrontEnd/assests/images/Logo/abad-logo.png" alt="sikhani">
                </a>
            </div>
        </div>
    </div>
    <div class="header-bottom heading sticky-header" id="heading">
        <div class="container">
            <a href="Index.aspx" class="logo">
                <img src="/FrontEnd/assests/images/Logo/pp.png" alt="sikhani">
            </a>
            &nbsp;
            &nbsp;
            <a href="index.html" class="logo2">
                <img src="/FrontEnd/assests/images/Logo/abad-logo.png" alt="sikhani">
            </a>
            <button type="button" class="search-button" data-toggle="collapse" data-target="#bloq-search"
                    aria-expanded="false">
                <i class="fa fa-search" aria-hidden="true"></i>
            </button>
            <button type="button" class="button-menu hidden-lg-up" data-toggle="collapse" data-target="#main-menu"
                    aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>
           
  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="up1" runat="server">
    <ContentTemplate>
            <div action="#" id="bloq-search" class="collapse">
                <div class="bloq-search">
                    <asp:TextBox ID="TextBox1" onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90 ) && event.keyCode!=32);" AutoPostBack="false" placeholder="search by property ID" runat="server"></asp:TextBox>
                    <asp:Button ID="Button2" OnClick="getProperty"  runat="server" Text="Submit" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
                
            <nav id="main-menu" class="collapse">
                <ul>
                    <li><a href="Index.aspx">Home</a></li>
                    <li><a href="Propertiess.aspx">Properties</a></li>
                    <li><a href="Agents.aspx">Agents</a></li>
                    <li><a href="About-Us.aspx">About Us</a></li>
                    <li><a href="Blog.aspx">Blog</a></li>
                    <li><a href="Contact-Us.aspx">Contact</a></li>
                    <li><a href="userRegister.aspx">Register</a></li>
                    <li><a href="Login.aspx">Login</a></li>
                </ul>
            </nav>

        </div>

    </div>
</div>
<section class="headings">
    <div class="text-heading text-center">
        <div class="container">
            <h1>Property Details</h1>
            <h2><a href="Index.aspx">Home </a> &nbsp;/&nbsp; Property Details</h2>
        </div>
    </div>
</section>
<!-- END SECTION HEADINGS -->

<!-- START SECTION PROPERTIES LISTING -->
<section class="blog details">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-12 blog-pots">
                <!-- Block heading Start-->
                                           <h3>  <asp:Label ID="namePropertyTxt" Font-Bold="true"  runat="server" ></asp:Label></h3>
                <br />
                <div class="block-heading details">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-2">

 
                            <p>
                            <span class="heading-icon">
                                <i class="fa fa-map-marker"></i>
                                </span>
                                <span class="hidden-sm-down">

                                    <asp:Label ID="locationText" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label></span>
                            </p>

                        </div>

                        <div class="col-lg-6 col-md-6 col-10 cod-pad">
                            <div class="sorting-options">
                                <h5><span>Price: </span> Rs <asp:Label ID="price" Font-Bold="true" runat="server" ForeColor="Blue"></asp:Label></h5>
                                <h6 class="type"><span>Type: </span> <asp:Label ID="type" Font-Bold="true" runat="server" ForeColor="Blue"></asp:Label></h6>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <!-- Block heading end -->
                <!--PROJECT IMAGES-->
                <div class="row">
                    <div class="col-md-12 mb-4">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                
                                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                            </ol>
                            <div class="carousel-inner" role="listbox">


                                <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>


                              

                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                               data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                               data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>

                        <asp:Repeater ID="rptBasic" runat="server" >
                                        <ItemTemplate> 

                        <div class="blog-info details">
                            <!-- cars content -->
                            <div class="homes-content details-2 mb-5">
                                <!-- cars List -->
                                <ul class="homes-list clearfix">
                                    <li>
                                        <i class="fa fa-bed" aria-hidden="true"></i>
                                        <span>Bed <%# Eval("bed") %> </span>
                                    </li>
                                    <li>
                                        <i class="fa fa-bath" aria-hidden="true"></i>
                                        <span>Baths <%# Eval("bath") %></span>
                                    </li>
                                    <li>
                                        <i class="fa fa-object-group" aria-hidden="true"></i>
                                        <span><%# Eval("sq") %> </span>
                                    </li>
                                    <li>
                                        <i class="fa fa-car" aria-hidden="true"></i>
                                        <span>Garages <%# Eval("garage") %></span>
                                    </li>
                                    <li>
                                        <i class="fa fa-columns" aria-hidden="true"></i>
                                        <span>Kitchen <%# Eval("kitchen") %></span>
                                    </li>
                                    <li>
                                        <i class="fa fa-clone" aria-hidden="true"></i>
                                        <span>Balcony <%# Eval("balconey") %></span>
                                    </li>
                                </ul>
                            </div>
                            
                            
                            <h5 class="mb-4">Property Video</h5>

                            <div class="col-lg-6 col-md-12 col-xs-12 welcome">
                                <div class="wprt-image-video w50">
                                    <img alt="image" src="/FrontEnd/assests/images/slider/slider-1.jpg">
                                    <a class="icon-wrap popup-video popup-youtube"
                                       href="<%# Eval("videolink") %>">
                                        <i class="fa fa-play"></i>
                                    </a>
                                    <div class="iq-waves">
                                        <div class="waves wave-1"></div>
                                        <div class="waves wave-2"></div>
                                        <div class="waves wave-3"></div>
                                    </div>
                                </div>
                            </div>



                                                       							</ItemTemplate>
                                 </asp:Repeater>
                            <!--OVERVIEW-->
                            <h5 class="mb-4">Overview</h5>
                            <p class="mb-3">
                                <asp:Label ID="des" runat="server" ></asp:Label></p>
                        </div>

                                                 
                    </div>
                </div>
                <!--PROJECT TYPE-->

                <!-- PROJECT FEATURE  -->
                <div class="homes-content details mb-5">
                    <!-- title -->
                    <h5 class="mb-4">Near By Facilities</h5>
                    <!-- cars List -->
                    <ul class="homes-list clearfix">
                        <asp:Repeater ID="rptFeatures" runat="server" >
                                        <ItemTemplate> 
                        <li>
                            <i class="fa fa-check-square" aria-hidden="true"></i>
                            <span><%# Eval("features") %></span>
                        </li>
                        	</ItemTemplate>
                                 </asp:Repeater>
                    </ul>
                </div>
                <!--PAYMENT PLAN DIV-->
                            <div class="property-location mb-5">
                <!--LOCATION DIV-->

                                                    <h5 class="mb-4">PROPERTY/PROJECT/REPRESENTATIVE LOCATION</h5>
 
            <div id="map"></div>



                        <asp:HiddenField ID="latitude" runat="server" />
                        <asp:HiddenField ID="longitude" runat="server" />
                        <asp:HiddenField ID="HiddenField1" runat="server" />

                    
                                   
                                </div>

                
                <!-- START SECTION ASSIGNED AGENTS -->

                <!-- END SECTION ASSIGNED AGENTS -->
            </div>

            <aside class="col-lg-3 col-md-12 car">
                      <br /> <br /> <br />      <br /> <br /> <br />       <br /> 


                <div class="widget">
                    <div class="section-heading">
                        <div class="media">
                            <div class="media-left">
                                <i class="fa fa-mail-forward"></i>
                            </div>
                            <div class="media-body">
                          
                                <h5>For More Information Contact Us </h5>
                                <div class="border"></div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <form action="">
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="PropertyID:" Font-Size="Large"></asp:Label>
                            
                            <asp:Label ID="pid" runat="server" Font-Bold="true"  Font-Size="Large"></asp:Label>
                            <i class="icon_name_alt"></i>
                        </div>
                        <br /> 
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="Property Owner/Agent/Representative Name:" Font-Size="Large"></asp:Label>
                         <asp:Label ID="ownername" runat="server" Font-Bold="true"  Font-Size="Large" ></asp:Label>
                            <i class="icon_mail_alt"></i>
                        </div>
                        <br /> 
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Contact:" Font-Size="Large"></asp:Label>
                            
                           <asp:Label ID="bnum" runat="server" Font-Bold="true"  Font-Size="Large" ></asp:Label>
                            <i class="icon_phone_alt"></i>
                        </div>
                        <br /> 
                       
                        <br>
                        <br>




                        <!-- Modal -->


                    </form>
                </div>
            </aside>
        </div>
    
</section>

<footer class="first-footer">
    <div class="top-footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <div class="netabout">
                        <a href="Index.aspx" class="logo">
                            <img src="/FrontEnd/assests/images/Logo/pp.png" alt="LOGO">
                        </a>
                        <p>PAKPROPERTY is Pakistan’s leading Real Estate Experts, Electronic Property Hub, Builders, Developers and Marketers. PAKPROPERTY is currently operating in different major locations like Karachi, Lahore, Islamabad, and Gwadar in Pakistan and United Arab Emirates.....</p>
                        <a href="About-Us.aspx" class="btn btn-secondary">Read More...</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="navigation">
                        <h3>Navigation</h3>
                        <div class="nav-footer">
                            <ul>
                                <li><a href="Index.aspx">Home</a></li>
                                <li><a href="About-Us.aspx">About Us</a></li>
                                <li><a href="Propertiess.aspx">Properties</a></li>
                                <li><a href="Terms-Condition.aspx">Terms & Conditions</a></li>
                                <li><a href="Contact-Us.aspx">Contact us</a></li>
                            </ul>
                            <ul class="nav-right">
                                <li><a href="Agents.aspx">Agents</a></li>
                                <li><a href="Blog.aspx">Blog</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="contactus">
                        <h3>Contact Us</h3>
                        <ul>
                            <li>
                                <div class="info">
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                    <p class="in-p">Karachi</p>
                                </div>
                            </li>
                            <li>
                                <div class="info">
                                    <i class="fa fa-phone" aria-hidden="true"></i>
                                    <p class="in-p">+92-21-34012421</p>
                                </div>
                            </li>
                            <li>
                                <div class="info">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <p class="in-p ti">admin@pakproperty.co</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <ul class="netsocials">
                        <li><a target="_blank" href="https://www.facebook.com/theshaikhanirealestateandmarketing/"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                        <li><a href=""><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href=""><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                        <li><a href=""><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="second-footer">
        <div class="container">
            <p>2018 © Copyright - All Rights Reserved.</p>
            <p>Developed <a href="https://www.facebook.com/smart.adil.9" target="_blank">  By <b>Muhammad Adil & Arqum Usmani</b></a></p>
        </div>
    </div>
</footer>






<!-- END SECTION PROPERTIES LISTING -->


<!-- START FOOTER -->


<a data-scroll href="#heading" class="go-up"><i class="fa fa-angle-double-up" aria-hidden="true"></i></a>
<!-- END FOOTER -->


<!-- ARCHIVES JS -->

        <script>


        function initMap() {
            // The location of Uluru
            var lati = parseFloat(document.getElementById("<%=latitude.ClientID %>").value);
            var lngi = parseFloat(document.getElementById("<%=longitude.ClientID %>").value);
  var uluru = {lat: lati, lng: lngi};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 17, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
}
    </script>
    <!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOKN_aSYiW40FCEVh7AQkgkLGStmyuuTQ&callback=initMap">
    </script>
<script src="/FrontEnd/assests/js/jquery.min.js"></script>
<script src="/FrontEnd/assests/js/jquery-ui.js"></script>
<script src="/FrontEnd/assests/js/range-slider.js"></script>
<script src="/FrontEnd/assests/js/tether.min.js"></script>
<script src="/FrontEnd/assests/js/bootstrap.min.js"></script>
<script src="/FrontEnd/assests/js/smooth-scroll.min.js"></script>
<script src="/FrontEnd/assests/js/jquery.magnific-popup.min.js"></script>
<script src="/FrontEnd/assests/js/popup.js"></script>
<script src="/FrontEnd/assests/js/ajaxchimp.min.js"></script>
<script src="/FrontEnd/assests/js/newsletter.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDhAYvx0GmLyN5hlf6Uv_e9pPvUT3YpozE"></script>
<script src="/FrontEnd/assests/js/map-single.js"></script>
<script src="/FrontEnd/assests/js/inner.js"></script>
        </form>
</body>

</html>


