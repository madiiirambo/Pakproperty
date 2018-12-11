﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About-Us.aspx.cs" Inherits="PakProperty.About_Us" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="html 5 template">
    <meta name="author" content="">
    <title>About Us</title>
    <!-- FAVICON -->
    <link rel="shortcut icon" type="image/x-icon" href="FrontEnd/assests/images/Logo/Shaikhani.png">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i%7CMontserrat:600,800" rel="stylesheet">
    <!-- FONT AWESOME -->
    <link rel="stylesheet" href="FrontEnd/assests/css/font-awesome.min.css">
    <!-- ARCHIVES CSS -->
    <link rel="stylesheet" href="FrontEnd/assests/css/animate.css">
    <link rel="stylesheet" href="FrontEnd/assests/css/magnific-popup.css">
    <link rel="stylesheet" href="FrontEnd/assests/css/lightcase.css">
    <link rel="stylesheet" href="FrontEnd/assests/css/owl.carousel.min.css">
    <link rel="stylesheet" href="FrontEnd/assests/css/bootstrap.css">
    <link rel="stylesheet" href="FrontEnd/assests/css/styles.css">
    <link rel="stylesheet" id="color" href="FrontEnd/assests/css/default.css">
</head>

<body class="inner-pages">
    <form runat="server"><!-- START SECTION HEADINGS -->
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
            <h1>About Us</h1>
            <h2><a href="Index.aspx">Home </a> &nbsp;/&nbsp; About Us</h2>
        </div>
    </div>
</section>
<!-- END SECTION HEADINGS -->

<!-- START SECTION ABOUT -->
<section class="about-us">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-12 who-1">
                <div>
                    <h2 class="text-left mb-4">About <span>PAKPROPERTY</span></h2>
                </div>
                <div class="pftext">
                    <p>PAKPROPERTY is Pakistan’s leading Real Estate Experts, An Electronic Property Hub, Builders, Developers and Marketers. PAKPROPERTY is currently operating in different major locations like Karachi, Lahore, Islamabad, and Gwadar in Pakistan and United Arab Emirates. Our Core Group was founded as a Real Estate Agency (Memon Estate). We further empowered our name to Shaikhani Property Center in 1989. In 2000, Our Real Estate Agency extended into most influential real estate developer as “Shaikhani Associates”. We are licensed under Association of Builders and Developers of Pakistan (ABAD) since 2000 by the name of A.K.Zee and Komal Builders. In 2018, We have further extended our group as PAKPROPERTY.</p>

                    <p> Building Relationships and Changing lives in the Islamic Republic of Pakistan and United Arab Emirates. PAKPROPERTY is ready to serve the community in every best possible way. Electronic Property Hub, Advertising, Marketing, Construction, Real Estate, Mortgage and Property Documentation are the core activities of our group.</p>
                        
                       <br /> <h3> <b> “Where Dreams Meet Reality” </b></h3>
                </div>

            </div>
            <div class="col-lg-6 col-md-12 who">
                <div class="wprt-image-video w50">
                    <img alt="image" src="FrontEnd/assests/images/Logo/prop.png">
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION ABOUT -->

<!-- START SECTION SERVICES -->
<main class="services-2">
    <div class="container">
        <div class="section-title">
            <h3>Our</h3>
            <h2>Services</h2>
        </div>
        <div class="row service-1">
            <article class="col-md-4 serv">
                <div class="art-1 img-1">
                    <img src="FrontEnd/assests/images/1.png" width="52" alt="">
                    <h3>Buy Property</h3>
                    <p><b> We have the best properties available for Purchase. </b></p>
                </div>
            </article>
            <article class="col-md-4 serv">
                <div class="art-1 img-2">
                    <img src="FrontEnd/assests/images/2.png" width="52" alt="">
                    <h3>Rent Property</h3>
                    <p><b>We have the best properties available for Rent.</b></p>
                </div>
            </article>
            <article class="col-md-4 serv">
                <div class="art-1 img-3">
                    <img src="FrontEnd/assests/images/3.png" width="52" alt="">
                    <h3>Real Estate Kit</h3>
                    <p><b> We have the best Marketing & Advertising to Build Brand Image</b></p>
                </div>
            </article>
        </div>
    </div>
</main>
<!-- END SECTION SERVICES -->


<!-- START SECTION AGENTS -->
<section class="team">
    <div class="container">
        <div class="section-title col-md-5">
            <h3>Meet Our</h3>
            <h2>Team</h2>
        </div>
        <div class="row team-all">
            <div class="col-lg-3 col-md-6 team-pro hover-effect">
                <div class="team-wrap">
                    <div class="team-img" style="height:250px">
                        <img src="FrontEnd/assests/images/team/cas.jpg" alt=""/>
                    </div>
                    <div class="team-content">
                        <div class="team-info">
                            <h3>Mustafa Usmani</h3>
                            <p>Proprietor</p>
                            <p>03132144825</p>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 team-pro hover-effect">
                <div class="team-wrap">
                    <div class="team-img" style="height:250px">
                        <img src="FrontEnd/assests/images/team/ash.jpg" alt=""/>
                    </div>
                    <div class="team-content">
                        <div class="team-info">
                            <h3>Ashfaq Shaikhani</h3>
                            <p>Director</p>
                            <p>03318113632</p>
                            <p>03239251514</p>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 team-pro pb-none hover-effect">
                <div class="team-wrap">
                    <div class="team-img">
                        <img src="FrontEnd/assests/images/team/mur.jpg" height="10"/>
                    </div>
                    <div class="team-content">
                        <div class="team-info">
                            <h3>Murtaza Usmani</h3>
                            <p>Head Of Sales & Marketing</p>
                            <p>03312111998</p>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 team-pro hover-effect kat">
                <div class="team-wrap">
                    <div class="team-img">
                        <img src="FrontEnd/assests/images/team/zee.jpg" alt=""/>

                    </div>
                    <div class="team-content">
                        <div class="team-info">
                            <h3>Zeeshan Shahid</h3>
                            <p>Team Leader</p>
                            <p>03012282069</p>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION AGENTS -->

<!-- START FOOTER -->
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


<a data-scroll href="#heading" class="go-up"><i class="fa fa-angle-double-up" aria-hidden="true"></i></a>
<!-- END FOOTER -->

<!-- ARCHIVES JS -->
<script src="FrontEnd/assests/js/jquery.min.js"></script>
<script src="FrontEnd/assests/js/tether.min.js"></script>
<script src="FrontEnd/assests/js/bootstrap.min.js"></script>
<script src="FrontEnd/assests/js/smooth-scroll.min.js"></script>
<script src="FrontEnd/assests/js/jquery.magnific-popup.min.js"></script>
<script src="FrontEnd/assests/js/popup.html"></script>
<script src="FrontEnd/assests/js/jquery.waypoints.min.js"></script>
<script src="FrontEnd/assests/js/jquery.counterup.min.js"></script>
<script src="FrontEnd/assests/js/counterup.html"></script>
<script src="FrontEnd/assests/js/ajaxchimp.min.js"></script>
<script src="FrontEnd/assests/js/newsletter.js"></script>
<script src="FrontEnd/assests/js/inner.html"></script>
        </form>

</body>
</html>

