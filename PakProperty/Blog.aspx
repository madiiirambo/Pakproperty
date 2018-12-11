﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="PakProperty.Blog" %>

<!DOCTYPE html>
<html lang="en">

<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="description" content="html 5 template">
        <meta name="author" content="">
        <title>Blog</title>
        <!-- FAVICON -->
        <link rel="shortcut icon" type="image/x-icon" href="/FrontEnd/assests/images/Logo/Shaikhani.png">
        <!-- GOOGLE FONTS -->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i%7CMontserrat:600,800" rel="stylesheet">
        <!-- FONT AWESOME -->
        <link rel="stylesheet" href="/FrontEnd/assests/css/font-awesome.min.css">
        <!-- ARCHIVES CSS -->
        <link rel="stylesheet" href="/FrontEnd/assests/css/animate.css">
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
                        <h1>Blog</h1>
                        <h2><a href="Index.aspx">Home </a> &nbsp;/&nbsp; Blog</h2>
                </div>
        </div>
</section>
<!-- END SECTION HEADINGS -->

<!-- START SECTION BLOG -->
<section class="blog">
 

        <div class="container">

                <div class="row">
                    <asp:Repeater ID="rptResult" runat="server" >
                                        <ItemTemplate>    
                        <div class="col-lg-4 col-md-6 blog-pots hover-effect">
                            
                                <div class="single-blog-post">
                                               
                                        <div class="blog-list img-box">
                                            
                                                <img src="<%# Eval("blogImage") %>" alt="">
                                                <div class="social">
                                                        <span class="date"><%# Eval("Date") %><span><%# Eval("Month") %></span></span>
                                                        <a href="#"><i class="fa fa-user-o"></i><span>Admin</span></a>
                                                        <a href="#"><i class="fa fa-eye"></i><span><%# Eval("blogView") %></span></a>
                                                        
                                                </div>
                                                <div class="overlay">
                                                        <div class="box">
                                                                <div class="content">
                                                                        <ul>
                                                                                <li><a href="BlogDetails.aspx?id=<%# Eval("blogId") %>"><i class="fa fa-link"></i></a></li>
                                                                        </ul>
                                                                </div>
                                                        </div>
                                                </div>
                                        </div>
                                        <div class="blog-info">
                                                <a href="BlogDetails.aspx?id=<%# Eval("blogId") %>"><h3 class="mb-2"><%# Eval("blogTitle") %></h3></a>
                                                <p><%# Eval("blogDescription") %></p>
                                                <a href="BlogDetails.aspx?id=<%# Eval("blogId") %>" class="btn btn-secondary">Read More...</a>
                                        </div>
                                                 

                                                
                                </div>

                        </div>
                                   							</ItemTemplate>
                                 </asp:Repeater>
                    </div>

                                    
                
             
            


            <nav aria-label="..." class="pt-5">
                        <ul class="pagination">
                                <li class="page-item">
                                    <asp:LinkButton CssClass="page-link" TabIndex="-1" ID="PreBtn" OnClick="PrevButton_Click" runat="server">Previous</asp:LinkButton>
                                </li>
                                <li class="page-item active">
                                        <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand" OnItemDataBound="rptPaging_ItemDataBound">
                                        <ItemTemplate>

									
											
											<li class="page-item">  <asp:LinkButton CssClass="page-link" ID="lbPaging" runat="server"

                                            CommandArgument='<%# Eval("PageIndex") %>' 

						CommandName="newPage"

                                            Text='<%# Eval("PageText") %> '/></li>
										    
										
											
										
                                            </ItemTemplate>
                                          </asp:Repeater>
                               <asp:LinkButton CssClass="page-link" OnClick="NextBtn_Click" ID="NextBtn" runat="server">Next</asp:LinkButton>
                                </li>
                        </ul>
                </nav>

                                                
        </div>
                                                
</section>




<!-- END SECTION BLOG -->


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
<script src="/FrontEnd/assests/js/jquery.min.js"></script>
<script src="/FrontEnd/assests/js/tether.min.js"></script>
<script src="/FrontEnd/assests/js/bootstrap.min.js"></script>
<script src="/FrontEnd/assests/js/smooth-scroll.min.js"></script>
<script src="/FrontEnd/assests/js/ajaxchimp.min.js"></script>
<script src="/FrontEnd/assests/js/newsletter.js"></script>
<script src="/FrontEnd/assests/js/inner.js"></script>
        </form>
</body>

</html>

