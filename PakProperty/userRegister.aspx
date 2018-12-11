<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userRegister.aspx.cs" Inherits="PakProperty.userRegister" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="html 5 template">
    <meta name="author" content="">
    <title>Register</title>
    <!-- FAVICON -->
    <link rel="shortcut icon" type="image/x-icon" href="/FrontEnd/assests/images/Logo/Shaikhani.png">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i%7CMontserrat:600,800" rel="stylesheet">
    <!-- FONT AWESOME -->
    <link rel="stylesheet" href="/FrontEnd/assests/css/font-awesome.min.css">
    <!-- ARCHIVES CSS -->
    <link rel="stylesheet" href="/FrontEnd/assests/css/animate.css">
    <link rel="stylesheet" href="/FrontEnd/assests/css/bootstrap.css">
    <link rel="stylesheet" href="/FrontEnd/assests/css/styles.css">
    <link rel="stylesheet" id="color" href="/FrontEnd/assests/css/default.css">
</head>

<body class="inner-pages" style="background-color: #edeff1">
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
<section id="register" class="headings">
    <div class="text-heading text-center">
        <div class="container">
            <h1>Register</h1>
            <h2><a href="Index.aspx">Home </a> &nbsp;/&nbsp; Register</h2>
        </div>
    </div>
</section>
<!-- END SECTION HEADINGS -->


<div class="container">
    <div class="row">
        <div class="col-md-6 register">
            <div class="section-title col-md-5">
                <h2>Register Now!</h2>
            </div>
            <div class="welcome-content">
                <p><span>PAK PROPERTY</span> is the best place for elit, sed do eiusmod tempor dolor sit amet, conse
                    ctetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et lorna aliquatd minimam,
                    quis nostrud exercitation oris nisi ut aliquip ex ea.
                    is the best place for elit, sed do eiusmod tempor dolor sit amet, conse
                    ctetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et lorna aliquatd minimam,
                    quis nostrud exercitation oris nisi ut aliquip ex ea.</p>
            </div>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-5 register-form">
            <!-- START SECTION Register -->
            <div id="login">
                <div class="login">
                    <div  autocomplete="off">
                       
                        <div class="form-group">
                            <asp:TextBox class="form-control" ID="nameTxt" runat="server"  placeholder="Your Name"></asp:TextBox>
                            
                            <i class="ti-user"></i>
                        </div>
                        <div class="form-group">

                        <asp:TextBox class="form-control" ID="emailtxt" runat="server"  placeholder="Your Email"></asp:TextBox>
                        <i class="icon_mail_alt"></i>

                        </div>
                     
                 
                        <div class="form-group">
                            <asp:TextBox class="form-control" ID="passtxt"   runat="server"   placeholder="Password"></asp:TextBox>
                            <i class="icon_lock_alt"></i>

                        </div>
                        <div class="form-group">
                            <asp:TextBox class="form-control" ID="contxt" AutoPostBack="true" runat="server"   placeholder="Confirm Password" OnTextChanged="contxt_TextChanged"></asp:TextBox>
                            <i class="icon_lock_alt" >
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Pass"></asp:Label>
                        </div>

                        <div class="form-group">
                             <asp:TextBox class="form-control" ID="phtxt" onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90 ) && event.keyCode!=32);"  runat="server"  placeholder="Phone Number"></asp:TextBox>
                            <i class="icon_phone_alt"></i>
                             
                        </div>

                        <div class="form-group">

                            

                           <asp:DropDownList CssClass="form-control" ID="cities" runat="server">
    <asp:ListItem Enabled="true" Text="Select City" Value="-1"></asp:ListItem>
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
                     
                        <div style="display: none; background-color: #edeff1" id="text">
                            <hr>
                            <label class="country">Select City* <p style="font-size: 12px">hold ctrl to select
                                multiple</p>
                                <select class="form-control" type="text" id="" multiple>
                                    <option value="0" disabled selected>Choose City</option>
                                    <option value="1">Karachi</option>
                                    <option value="2">Islamabad</option>
                                    <option value="2">Islamabad</option>
                                    <option value="2">Islamabad</option>
                                    <option value="2">Islamabad</option>
                                    <option value="2">Islamabad</option>
                                    <option value="2">Islamabad</option>
                                    <option value="2">Islamabad</option>
                                </select>
                            </label>
                            <input class="form-control" type="text" placeholder="Agency Name*">
                            <input class="form-control" type="text" placeholder="Service Description">
                            <input class="form-control" type="text" placeholder="Company Phone">
                            <input class="form-control" type="text" placeholder="Company Fax">
                            <input class="form-control" type="text" placeholder="Company Address">
                            <input class="form-control" type="text" placeholder="Company Email">
                            <label> Select Logo</label>
                            <input type="file" name="pic" accept="image/*">
                        </div>
                        <br>

                        <asp:CheckBox ID="checkBox" runat="server" Text="I accept" /> <a id="abc" runat="server" href="Terms-Condition.aspx"> Terms & Conditions</a>


                        <div id="pass-info" class="clearfix"></div>

                        <asp:Button ID="Button1" OnClick="addUser" class="btn_1 rounded full-width add_top_30" runat="server" Text="Get Code" />
                        
                          
                                      <div  class="text-center add_top_10">Already Have An Account ?  <strong><a href="Login.aspx">Sign in !</a></strong></div>
                    
                    
                    <br />
                        <div class="form-group">
                            <asp:TextBox class="form-control" ID="code"   runat="server"   placeholder="Enter Code"></asp:TextBox>
                            <i class="icon_lock_alt"></i>

                        </div>
                       <asp:Button ID="Button3" OnClick="enterCode" class="btn_1 rounded full-width add_top_30" runat="server" Text="Register" />

                    </div>
                </div>
            </div>
            <!-- END SECTION Register --></div>
    </div>
</div>


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
            <p>Developed <a href="https://www.facebook.com/smart.adil.9" target="_blank"> <i class="fa fa-heart" aria-hidden="true"></i> By Muhammad Adil</a></p>
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
<script src="/FrontEnd/assests/js/inner.html"></script>

<script>
    function myFunction() {
        // Get the checkbox
        var checkBox = document.getElementById("myCheck");
        // Get the output text
        var text = document.getElementById("text");

        // If the checkbox is checked, display the output text
        if (checkBox.checked == true) {
            text.style.display = "block";
        } else {
            text.style.display = "none";
        }
    }
</script>
</form>
</body>
</html>

