,,,<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PakProperty.Index" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Pak Property</title>
    <!-- FAVICON -->
    <link rel="shortcut icon" type="image/x-icon" href="/FrontEnd/assests/images/Logo/pp.png">
    <link rel="stylesheet" href="/FrontEnd/assests/css/jquery-ui.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i%7CMontserrat:600,800" rel="stylesheet">
    <!-- FONT AWESOME -->
    <link rel="stylesheet" href="/FrontEnd/assests/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="/FrontEnd/assests/css/font-awesome.min.css">
    <!-- Slider Revolution CSS Files -->
    <link rel="stylesheet" href="/FrontEnd/assests/revolution/css/settings.css">
    <link rel="stylesheet" href="/FrontEnd/assests/revolution/css/layers.css">
    <link rel="stylesheet" href="/FrontEnd/assests/revolution/css/navigation.css">
    <!-- ARCHIVES CSS -->
    <link rel="stylesheet" href="/FrontEnd/assests/css/animate.css">
    <link rel="stylesheet" href="/FrontEnd/assests/css/magnific-popup.css">
    <link rel="stylesheet" href="/FrontEnd/assests/css/lightcase.css">
    <link rel="stylesheet" href="/FrontEnd/assests/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/FrontEnd/assests/css/bootstrap.css">
    <link rel="stylesheet" href="/FrontEnd/assests/css/styles.css">
    <link rel="stylesheet" id="color" href="/FrontEnd/assests/css/default.css">
           <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
          <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOKN_aSYiW40FCEVh7AQkgkLGStmyuuTQ&libraries=places"></script>

<script>
            var autocomplete;
            function initialize() {
              autocomplete = new google.maps.places.Autocomplete(
                  /** @type {HTMLInputElement} */(document.getElementById('autocomplete')),
                  { types: ['geocode'] });
              autocomplete.setComponentRestrictions(
          { 'country': ['pak'] });
              google.maps.event.addListener(autocomplete, 'place_changed' 
              );
            }
        </script>




    <script type="text/javascript" src="https://code.jquery.com/jquery-1.8.2.js"></script>
<style type="text/css">
#overlay {
position: fixed;
top: 0;
left: 0;
width: 100%;
height: 100%;
background-color: #000;
filter:alpha(opacity=70);
-moz-opacity:0.7;
-khtml-opacity: 0.7;
opacity: 0.7;
z-index: 100;
display: none;
}
.cnt223 a{
text-decoration: none;
}
.popup{
width: 100%;
margin: 0 auto;
display: none;
position: fixed;
z-index: 101;
}
.cnt223{
min-width: 600px;
width: 600px;
min-height: 150px;
margin: 100px auto;
background: #f3f3f3;
position: relative;
z-index: 103;
padding: 15px 35px;
border-radius: 5px;
box-shadow: 0 2px 5px #000;
}
.cnt223 p{
clear: both;
    color: #555555;
    /* text-align: justify; */
    font-size: 20px;
    font-family: sans-serif;
}
.cnt223 p a{
color: #d91900;
font-weight: bold;
}
.cnt223 .x{
float: right;
height: 35px;
left: 22px;
position: relative;
top: -25px;
width: 34px;
}
.cnt223 .x:hover{
cursor: pointer;
}
</style>
<script type='text/javascript'>
$(function(){
var overlay = $('<div id="overlay"></div>');
overlay.show();
overlay.appendTo(document.body);
$('.popup').show();
$('.close').click(function(){
$('.popup').hide();
overlay.appendTo(document.body).remove();
return false;
});


 

$('.x').click(function(){
$('.popup').hide();
overlay.appendTo(document.body).remove();
return false;
});
});
</script>


</head>

<body onload="initialize()">

    <form runat="server" autocomplete="off">
   <div class='popup'>
<div class='cnt223'>

<p>
    <asp:Image ID="pop" runat="server" />
<br/>
<br/>
<a href="#" class='close'>Close</a>
</p>
</div>
</div>

<div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id;
    js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v3.1';
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
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

<!-- START SLIDER -->
<!-- START REVOLUTION SLIDER 5.0.7 fullwidth mode -->
<div id="rev_slider_home_wrapper" class="rev_slider_wrapper fullwidthbanner-container" data-alias="news-gallery34"
     style="margin:0 auto;background-color:#ffffff;padding:0; margin-top:1px; margin-bottom:1px;">
    <div id="rev_slider_home" class="rev_slider fullwidthabanner" style="display:none;" data-version="5.0.7">
        <ul>
            <!-- SLIDE 1 -->
            <li data-index="rs-1" data-transition="slidingoverlayhorizontal" data-slotamount="default"
                data-easein="default" data-easeout="default" data-masterspeed="default"
                data-thumb="/FrontEnd/assests/images/slider/slider-1.jpg" data-rotate="0" data-fstransition="fade"
                data-fsmasterspeed="1500" data-fsslotamount="7" data-saveperformance="off" data-title="Make an Impact">
                <!-- MAIN IMAGE -->
                <img src="/FrontEnd/assests/images/slider/slider-1.jpg" alt="" data-bgposition="center center" data-bgfit="cover"
                     data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                <!-- LAYERS -->
                <!-- LAYER NR. 1 -->
                <div class="tp-caption tp-shape tp-shapewrapper tp-resizeme rs-parallaxlevel-0" id="slide-1-layer-1"
                     data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                     data-y="['middle','middle','middle','middle']" data-voffset="['0','0','0','0']" data-width="full"
                     data-height="full" data-whitespace="normal" data-transform_idle="o:1;"
                     data-transform_in="opacity:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="opacity:0;s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                     data-start="1000" data-basealign="slide" data-responsive_offset="on"
                     style="z-index: 5;background-color:rgba(0, 0, 0, 0.35);border-color:rgba(0, 0, 0, 1.00);">
                </div>
                <!-- LAYER NR. 2 -->
                <div class="tp-caption tp-resizeme text-white rs-parallaxlevel-0" id="slide-1-layer-2"
                     data-x="['left','left','left','left']" data-hoffset="['50','50','50','30']"
                     data-y="['top','top','top','top']" data-voffset="['120','100','70','90']"
                     data-fontsize="['56','46','40','36']" data-lineheight="['70','60','50','45']"
                     data-fontweight="['800','700','700','700']" data-width="['700','650','600','420']"
                     data-height="none" data-whitespace="normal" data-transform_idle="o:1;"
                     data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="auto:auto;s:1000;e:Power3.easeInOut;"
                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-mask_out="x:0;y:0;s:inherit;e:inherit;"
                     data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on"
                     style="z-index: 6; min-width: 600px; max-width: 600px; white-space: normal;">This is the <span
                        class="text-theme-colored2"></span> best <span class="text-theme-colored2">Real Estate </span>Web
                    Site.
                </div>
                <!-- LAYER NR. 3 -->
                <div class="tp-caption tp-resizeme text-white rs-parallaxlevel-0 font-p" id="slide-1-layer-3"
                     data-x="['left','left','left','left']" data-hoffset="['50','50','50','30']"
                     data-y="['top','top','top','top']" data-voffset="['280','220','180','180']"
                     data-fontsize="['18','18','16','13']" data-lineheight="['30','30','28','25']"
                     data-fontweight="['600','600','600','600']" data-width="['700','650','600','420']"
                     data-height="none" data-whitespace="nowrap" data-transform_idle="o:1;"
                     data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="auto:auto;s:1000;e:Power3.easeInOut;"
                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-mask_out="x:0;y:0;s:inherit;e:inherit;"
                     data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on"
                     style="z-index: 7; white-space: nowrap;">We provides always our best services for our clients and
                    always
                    <br> try to achieve our client's trust and satisfaction.
                </div>
                <!-- LAYER NR. 4 -->
                <div class="tp-caption tp-resizeme text-white rs-parallaxlevel-0" id="slide-1-layer-4"
                     data-x="['left','left','left','left']" data-hoffset="['53','53','53','30']"
                     data-y="['top','top','top','top']" data-voffset="['360','290','260','260']"
                     data-fontsize="['18','18','16','16']" data-lineheight="['30','30','30','30']"
                     data-fontweight="['600','600','600','600']" data-width="['700','650','600','420']"
                     data-height="none" data-whitespace="nowrap" data-transform_idle="o:1;"
                     data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="auto:auto;s:1000;e:Power3.easeInOut;"
                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-mask_out="x:0;y:0;s:inherit;e:inherit;"
                     data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on"
                     style="z-index: 7; white-space: nowrap;"><a href="#"
                                                                 class="btn btn-default btn-theme-colored2 btn-xl">Read
                    More</a> <a href="#" class="btn btn-dark btn-theme-colored btn-xl">Contact Us</a>
                </div>
            </li>

            <!-- SLIDE 2 -->
            <li data-index="rs-2" data-transition="slidingoverlayhorizontal" data-slotamount="default"
                data-easein="default" data-easeout="default" data-masterspeed="default"
                data-thumb="/FrontEnd/assests/images/slider/slider-2.jpg" data-rotate="0" data-fstransition="fade"
                data-fsmasterspeed="1500" data-fsslotamount="7" data-saveperformance="off" data-title="Make an Impact">
                <!-- MAIN IMAGE -->
                <img src="/FrontEnd/assests/images/slider/slider-2.jpg" alt="" data-bgposition="center center" data-bgfit="cover"
                     data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                <!-- LAYERS -->
                <!-- LAYER NR. 1 -->
                <div class="tp-caption tp-shape tp-shapewrapper tp-resizeme rs-parallaxlevel-0" id="slide-2-layer-1"
                     data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                     data-y="['middle','middle','middle','middle']" data-voffset="['0','0','0','0']" data-width="full"
                     data-height="full" data-whitespace="normal" data-transform_idle="o:1;"
                     data-transform_in="opacity:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="opacity:0;s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                     data-start="1000" data-basealign="slide" data-responsive_offset="on"
                     style="z-index: 5;background-color:rgba(0, 0, 0, 0.35);border-color:rgba(0, 0, 0, 1.00);">
                </div>
                <!-- LAYER NR. 2 -->
                <div class="tp-caption tp-resizeme text-white rs-parallaxlevel-0" id="slide-2-layer-2"
                     data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                     data-y="['top','top','top','top']" data-voffset="['120','100','70','90']"
                     data-fontsize="['28','24','24','24']" data-lineheight="['33','30','30','30']"
                     data-fontweight="['600','600','600','600']" data-textalign="['center','center','center','center']"
                     data-width="none" data-height="none" data-whitespace="nowrap" data-transform_idle="o:1;"
                     data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="auto:auto;s:1000;e:Power3.easeInOut;"
                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-mask_out="x:0;y:0;s:inherit;e:inherit;"
                     data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on"
                     style="z-index: 7; white-space: nowrap;">Online Solution
                </div>
                <!-- LAYER NR. 3 -->
                <div class="tp-caption tp-resizeme text-white rs-parallaxlevel-0" id="slide-2-layer-3"
                     data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                     data-y="['top','top','top','top']" data-voffset="['165','135','105','130']"
                     data-fontsize="['56','46','40','36']" data-lineheight="['70','60','50','45']"
                     data-fontweight="['800','700','700','700']" data-textalign="['center','center','center','center']"
                     data-width="['700','650','600','420']" data-height="none" data-whitespace="normal"
                     data-transform_idle="o:1;"
                     data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="auto:auto;s:1000;e:Power3.easeInOut;"
                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-mask_out="x:0;y:0;s:inherit;e:inherit;"
                     data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on"
                     style="z-index: 6; min-width: 600px; max-width: 600px; white-space: normal;">Grow Up<span
                        class="text-theme-colored2"> Business</span> Choose <span
                        class="text-theme-colored2">Right</span> Solution.
                </div>
                <!-- LAYER NR. 4 -->
                <div class="tp-caption tp-resizeme text-white rs-parallaxlevel-0 font-p" id="slide-2-layer-4"
                     data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                     data-y="['top','top','top','top']" data-voffset="['320','260','220','220']"
                     data-fontsize="['18','18','16','13']" data-lineheight="['30','30','28','25']"
                     data-fontweight="['600','600','600','600']" data-textalign="['center','center','center','center']"
                     data-width="['700','650','600','420']" data-height="none" data-whitespace="nowrap"
                     data-transform_idle="o:1;"
                     data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="auto:auto;s:1000;e:Power3.easeInOut;"
                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-mask_out="x:0;y:0;s:inherit;e:inherit;"
                     data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on"
                     style="z-index: 7; white-space: nowrap;">We provides always our best services for our clients and
                    always
                    <br> try to achieve our client's trust and satisfaction.
                </div>
                <!-- LAYER NR. 5 -->
                <div class="tp-caption tp-resizeme text-white rs-parallaxlevel-0" id="slide-2-layer-5"
                     data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                     data-y="['top','top','top','top']" data-voffset="['400','340','300','300']"
                     data-fontsize="['18','18','16','16']" data-lineheight="['30','30','30','30']"
                     data-fontweight="['600','600','600','600']" data-width="none" data-height="none"
                     data-whitespace="nowrap" data-transform_idle="o:1;"
                     data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="auto:auto;s:1000;e:Power3.easeInOut;"
                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-mask_out="x:0;y:0;s:inherit;e:inherit;"
                     data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on"
                     style="z-index: 7; white-space: nowrap;"><a href="#" class="btn btn-dark btn-theme-colored btn-xl">Read
                    More</a>
                </div>
            </li>

            <!-- SLIDE 3 -->
            <li data-index="rs-3" data-transition="slidingoverlayhorizontal" data-slotamount="default"
                data-easein="default" data-easeout="default" data-masterspeed="default"
                data-thumb="/FrontEnd/assests/images/slider/slider-3.jpg" data-rotate="0" data-fstransition="fade"
                data-fsmasterspeed="1500" data-fsslotamount="7" data-saveperformance="off" data-title="Make an Impact">
                <!-- MAIN IMAGE -->
                <img src="/FrontEnd/assests/images/slider/slider-3.jpg" alt="" data-bgposition="top 20%" data-bgfit="cover"
                     data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                <!-- LAYERS -->
                <!-- LAYER NR. 1 -->
                <div class="tp-caption tp-shape tp-shapewrapper tp-resizeme rs-parallaxlevel-0" id="slide-3-layer-1"
                     data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
                     data-y="['middle','middle','middle','middle']" data-voffset="['0','0','0','0']" data-width="full"
                     data-height="full" data-whitespace="normal" data-transform_idle="o:1;"
                     data-transform_in="opacity:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="opacity:0;s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
                     data-start="1000" data-basealign="slide" data-responsive_offset="on"
                     style="z-index: 5;background-color:rgba(0, 0, 0, 0.25);border-color:rgba(0, 0, 0, 1.00);">
                </div>
                <!-- LAYER NR. 2 -->
                <div class="tp-caption tp-resizeme text-white rs-parallaxlevel-0" id="slide-3-layer-2"
                     data-x="['center','center','center','center']" data-hoffset="['310','200','100','0']"
                     data-y="['top','top','top','top']" data-voffset="['120','100','70','90']"
                     data-fontsize="['56','46','40','36']" data-lineheight="['70','60','50','45']"
                     data-fontweight="['800','700','700','700']" data-width="['700','650','500','420']"
                     data-height="none" data-whitespace="normal" data-transform_idle="o:1;"
                     data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="auto:auto;s:1000;e:Power3.easeInOut;"
                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-mask_out="x:0;y:0;s:inherit;e:inherit;"
                     data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on"
                     style="z-index: 6; min-width: 600px; max-width: 600px; white-space: normal;">We help you <span
                        class="text-theme-colored2">business</span> to grow and expand
                </div>
                <!-- LAYER NR. 3 -->
                <div class="tp-caption tp-resizeme text-white rs-parallaxlevel-0 font-p" id="slide-3-layer-3"
                     data-x="['center','center','center','center']" data-hoffset="['310','200','100','0']"
                     data-y="['top','top','top','top']" data-voffset="['280','220','180','180']"
                     data-fontsize="['18','18','16','13']" data-lineheight="['30','30','28','25']"
                     data-fontweight="['600','600','600','600']" data-width="['700','650','500','420']"
                     data-height="none" data-whitespace="nowrap" data-transform_idle="o:1;"
                     data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="auto:auto;s:1000;e:Power3.easeInOut;"
                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-mask_out="x:0;y:0;s:inherit;e:inherit;"
                     data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on"
                     style="z-index: 7; white-space: nowrap;">We provides always our best services for our clients and
                    always
                    <br> try to achieve our client's trust and satisfaction.
                </div>
                <!-- LAYER NR. 3 -->
                <div class="tp-caption tp-resizeme text-white rs-parallaxlevel-0" id="slide-3-layer-4"
                     data-x="['center','center','center','center']" data-hoffset="['310','200','100','0']"
                     data-y="['top','top','top','top']" data-voffset="['360','290','260','260']"
                     data-fontsize="['18','18','16','16']" data-lineheight="['30','30','30','30']"
                     data-fontweight="['600','600','600','600']" data-width="['700','650','500','420']"
                     data-height="none" data-whitespace="nowrap" data-transform_idle="o:1;"
                     data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="auto:auto;s:1000;e:Power3.easeInOut;"
                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-mask_out="x:0;y:0;s:inherit;e:inherit;"
                     data-start="1000" data-splitin="none" data-splitout="none" data-responsive_offset="on"
                     style="z-index: 7; white-space: nowrap;"><a href="#" class="btn btn-dark btn-theme-colored btn-xl">Read
                    More</a>
                </div>
                <!-- LAYER NR. 4 -->
                <div class="tp-caption rs-parallaxlevel-0" id="slide-3-layer-5"
                     data-x="['center','center','center','center']" data-hoffset="['310','33','0','0']"
                     data-y="['top','top','top','top']" data-voffset="['360','290','260','260']"
                     data-width="['700','650','600','420']" data-height="none" data-whitespace="nowrap"
                     data-transform_idle="o:1;" data-transform_hover="o:1;rX:0;rY:0;rZ:0;z:0;s:300;e:Power1.easeInOut;"
                     data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power3.easeInOut;"
                     data-transform_out="auto:auto;s:1000;e:Power3.easeInOut;" data-mask_in="x:0px;y:0px;"
                     data-mask_out="x:0;y:0;" data-start="1000" data-splitin="none" data-splitout="none"
                     data-responsive_offset="on" data-responsive="off"
                     style="z-index: 8; white-space: nowrap;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;">
                </div>
            </li>
        </ul>
        <div class="tp-bannertimer tp-bottom" style="height: 5px; background-color: #494949;"></div>
    </div>
</div>
<!-- END REVOLUTION SLIDER -->
<!-- END SECTION HEADINGS -->

<!-- START SECTION SEARCH AREA -->
    
<section class="main-search-field">
    <div class="container">

        <h3>Find Your Dream House</h3>
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="at-col-default-mar">

                    <asp:DropDownList  ID="ddcities" runat="server">
                                                         <asp:ListItem Text="Karachi" Value="1"></asp:ListItem>
                                                          <asp:ListItem Text="Lahore" Value="2"></asp:ListItem>
                                                           <asp:ListItem Text="Islamabad" Value="3"></asp:ListItem>
                                                           <asp:ListItem Text="Faisalabad" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Multan" Value="5"></asp:ListItem>
                                                        <asp:ListItem Text="Sialkot" Value="6"></asp:ListItem>
                                                        <asp:ListItem Text="Hyderabad" Value="7"></asp:ListItem>

                                                    </asp:DropDownList>
                   
                </div>
            </div>
            <div class="col-lg-6 col-md-12">
                <div class="at-col-default-mar">


                    <asp:TextBox class="at-input"  id="autocomplete" onFocus="geolocate()" runat="server" placeholder="Enter Location"></asp:TextBox>

                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="at-col-default-mar no-mb">
                    <asp:Button ID="Button1" class="btn btn-default hvr-bounce-to-right" OnClick="getAllAdd" runat="server" Text="Search" />
                    
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-lg-3 col-md-6">
                <div class="at-col-default-mar">


                    <asp:DropDownList class="div-toggle" ID="ddpurpose" runat="server">
                                                                                  <asp:ListItem Text="Sale" Value="2"></asp:ListItem>
                                                         <asp:ListItem Text="Rent" Value="1"></asp:ListItem>


                                                    </asp:DropDownList>

                    
                </div>
            </div>

            <div class="col-lg-6 col-md-12 no-pds">
                <div class="at-col-default-mar no-mb">
                    <input class="at-input" type="text" name="min-area" placeholder="Square Fit">
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="at-col-default-mar">
                    <div class="at-col-default-mar">
                        <asp:DropDownList  ID="ddtype" runat="server">
                                                         <asp:ListItem Text="House" Value="1"></asp:ListItem>
                                                          <asp:ListItem Text="Flat" Value="2"></asp:ListItem>
                                                           <asp:ListItem Text="Shop" Value="3"></asp:ListItem>
                                                           <asp:ListItem Text="Factory" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="WareHouse" Value="5"></asp:ListItem>
                                                        <asp:ListItem Text="PentHouse" Value="6"></asp:ListItem>
                                                        <asp:ListItem Text="FarmHouse" Value="7"></asp:ListItem>

                                                    </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="at-col-default-mar">
                    <select class="div-toggle" data-target=".my-info-1">
                        <option value="0" selected>Beds</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">7+</option>
                    </select>
                </div>
            </div>


            <div class="col-lg-6 col-md-12 no-pds">
                <div class="at-col-default-mar no-mb">
                    <input class="at-input" type="text" name="min-area" placeholder="Enter Range Rs.">
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="at-col-default-mar no-mb">
                    <select>
                        <option value="0" selected>Baths</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                                                                        <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">7+</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</section>
       
<!-- END SECTION SEARCH AREA -->
      

<!-- STAR SECTION PARTNERS -->
<div class="partners">
    <div class="container">
        <div class="section-title">
            <h3>Our</h3>
            <h2>Partners</h2>
        </div>
        <div class="owl-carousel style2">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>

    </div>
</div>
<!-- END SECTION PARTNERS -->


<!-- START SECTION FEATURED PROPERTIES -->
<section class="featured portfolio">

    <div class="container">
        <div class="row">
            <div class="section-title col-md-5">
                <h3>Featured</h3>
                <h2>Properties</h2>
            </div>
        </div>
        <div class="row portfolio-items">

<asp:Repeater ID="rptBasic" runat="server" >
                                        <ItemTemplate> 

            <div class="item  col-md-4 col-xs-12 landscapes sale">
                <div class="project-single">
                    <div class="project-inner project-head">
                        <div class="project-bottom">
                            <h4><a href="FeaturedPropertiesDetail.aspx?id=<%# Eval("propertyId") %>">View Property</a><span
                                    class="category">Pak Property</span></h4>
                        </div>

                        <div class="homes">
                            <!-- homes img -->
                            <a href="FeaturedPropertiesDetail.aspx?id=<%# Eval("propertyId") %>" class="homes-img">
                                <div class="homes-tag button alt featured">Featured</div>
                                <div class="homes-tag button alt sale">For Sale</div>
                                <div class="homes-price">Family Home</div>
                                <img src="<%# Eval("coverImage") %>" alt="home-2"
                                     class="img-responsive">
                            </a>
                        </div>
                    </div>
                    <!-- homes content -->
                    <div class="homes-content">
                        <!-- homes address -->
                        <h3><%# Eval("propertyName") %></h3>
                        <p class="homes-address mb-3">
                            <a href="properties-details.html">
                                <i class="fa fa-map-marker"></i><span><%# Eval("propertyAddress") %> , <%# Eval("propertyCity") %></span>
                            </a>
                        </p>
                        <!-- homes List -->
                        <ul class="homes-list clearfix">
                            <li>
                                <i class="fa fa-bed" aria-hidden="true"></i>
                                <span><%# Eval("propertyBeds") %> Bedrooms</span>
                            </li>
                            <li>
                                <i class="fa fa-bath" aria-hidden="true"></i>
                                <span><%# Eval("propertyBaths") %> Bathrooms</span>
                            </li>
                            <li>
                                <i class="fa fa-object-group" aria-hidden="true"></i>
                                <span><%# Eval("propertySquareft") %> sq ft</span>
                            </li>
                            <li>
                                <i class="fas fa-warehouse" aria-hidden="true"></i>
                                <span><%# Eval("propertyBalcony") %> Balcony</span>
                            </li>
                        </ul>
                        <!-- Price -->
                        <div class="price-properties">
                            <h3 class="title mt-3">
                                <a href="FeaturedPropertiesDetail.aspx?id=<%# Eval("propertyId") %>">Rs. <%# Eval("propertyMin") %> - <%# Eval("propertyMax") %></a>
                            </h3>
                        </div>
                        
                    </div>
                </div>
            </div>
                                                   							</ItemTemplate>
                                 </asp:Repeater>



        </div>
    </div>

</section>
<!-- END SECTION FEATURED PROPERTIES -->

<!-- STAR SECTION WELCOME -->
<section class="welcome">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-12 col-xs-12">
                <div class="welcome-title">
                    <h2>WELCOME TO <span>Pak Property</span></h2>
                    <h4>THE BEST PLACE TO FIND THE HOUSE YOU WANT.</h4>
                </div>
                <div class="welcome-content">
                    <p><span>PAKPROPERTY</span> is an Electronic Property Hub that is catering the client needs by helping them Buy/Sell/Rent/Construction/Market their Various Properties/Projects/Lands in Pakistan. </p>
                </div>
                <div class="welcome-services">
                    <div class="row">
                        <div class="col-lg-6 col-md-12 col-xs-12 ">
                            <div class="w-single-services">
                                <div class="services-img img-1">
                                    <img src="/FrontEnd/assests/images/1.png" width="32" alt="">
                                </div>
                                <div class="services-desc">
                                    <h6>Buy Property</h6>
                                    <p>We have the best properties
                                        <br> available for Purchase</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-xs-12 ">
                            <div class="w-single-services">
                                <div class="services-img img-2">
                                    <img src="/FrontEnd/assests/images/2.png" width="32" alt="">
                                </div>
                                <div class="services-desc">
                                    <h6>Rent Property</h6>
                                    <p>We have the best properties
                                        <br> available for Rent</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-xs-12 ">
                            <div class="w-single-services no-mb mbx">
                                <div class="services-img img-3">
                                    <img src="/FrontEnd/assests/images/3.png" width="32" alt="">
                                </div>
                                <div class="services-desc">
                                    <h6>Real Estate Kit</h6>
                                    <p>We have the best Marketing 
                                         
                                        <br> to Build Brand Image </p>
                                </div>
                            </div>
                        </div>
                            
                        <div class="col-lg-6 col-md-6 col-xs-12 ">
                            <div class="w-single-services no-mb">
                                <div class="services-img img-4">
                                    <img src="/FrontEnd/assests/images/4.png" width="32" alt="">
                                </div>
                                <div class="services-desc">
                                    <h6>Sell Property</h6>
                                    <p>We have the best properties 
                                        <br> avaliable to Sell </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2"></div>
            <div class="col-lg-4 col-md-12 col-xs-12">
                <div class="fb-page"
                     data-href="https://www.facebook.com/theshaikhanirealestateandmarketing/"
                     data-tabs="timeline" data-width="400px" data-height="650px" data-small-header="false"
                     data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
                    <blockquote
                            cite="https://www.facebook.com/theshaikhanirealestateandmarketing/"
                            class="fb-xfbml-parse-ignore"><a
                            href="https://www.facebook.com/theshaikhanirealestateandmarketing/">&quot;I
                        pretend to think when teacher is looking at me&quot;</a></blockquote>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION WELCOME -->

<!-- START SECTION TESTIMONIALS -->
<section class="testimonials">
    <div class="container">
        <div class="section-title col-md-5">
            <h3>Happy</h3>
            <h2>Customers</h2>
        </div>
        <div class="owl-carousel style1">

            <asp:Repeater ID="rptHappyCustomer" runat="server" >
                                        <ItemTemplate> 
            <div class="test-1">
                <h3><%# Eval("customerName") %></h3>
                <img src="<%# Eval("customerImage") %>" alt="">
                <h6 class="mt-2">Pak Property</h6>
                <ul class="starts text-center mb-2">
                    <li><i class="fa fa-star"></i>
                    </li>
                    <li><i class="fa fa-star"></i>
                    </li>
                    <li><i class="fa fa-star"></i>
                    </li>
                    <li><i class="fa fa-star"></i>
                    </li>
                    <li><i class="fa fa-star"></i>
                    </li>
                </ul>
                <p><%# Eval("customerDescription") %>.</p>
            </div>
            </ItemTemplate></asp:Repeater>

        </div>

    </div>

</section>
<!-- END SECTION TESTIMONIALS -->


<!-- START SECTION COUNTER UP -->
<section class="counterup">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-xs-12">
                <div class="countr">
                    <i class="fa fa-home" aria-hidden="true"></i>
                    <div class="count-me">
                        <p class="counter text-left">
                            <asp:Label ID="adds" runat="server"></asp:Label></p>
                        <h3>Listing Ads</h3>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-xs-12">
                <div class="countr">
                    <i class="fa fa-list" aria-hidden="true"></i>
                    <div class="count-me">
                        <p class="counter text-left"><asp:Label ID="users" runat="server"></asp:Label></p>
                        <h3>Active Users</h3>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-xs-12">
                <div class="countr mb-0">
                    <i class="fa fa-users" aria-hidden="true"></i>
                    <div class="count-me">
                        <p class="counter text-left"><asp:Label ID="agencies" runat="server"></asp:Label></p>
                        <h3>Agencies</h3>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-xs-12">
                <div class="countr mb-0 last">
                    <i class="fa fa-trophy" aria-hidden="true"></i>
                    <div class="count-me">
                        <p class="counter text-left"><asp:Label ID="partners" runat="server"></asp:Label></p>
                        <h3>Partners</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION COUNTER UP -->

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
<script src="/FrontEnd/assests/js/jquery-ui.js"></script>
<script src="/FrontEnd/assests/js/tether.min.js"></script>
<script src="/FrontEnd/assests/js/moment.js"></script>
<script src="/FrontEnd/assests/js/transition.min.js"></script>
<script src="/FrontEnd/assests/js/bootstrap.min.js"></script>
<script src="/FrontEnd/assests/js/fitvids.js"></script>
<script src="/FrontEnd/assests/js/jquery.waypoints.min.js"></script>
<script src="/FrontEnd/assests/js/jquery.counterup.min.js"></script>
<script src="/FrontEnd/assests/js/imagesloaded.pkgd.min.js"></script>
<script src="/FrontEnd/assests/js/isotope.pkgd.min.js"></script>
<script src="/FrontEnd/assests/js/smooth-scroll.min.js"></script>
<script src="/FrontEnd/assests/js/lightcase.js"></script>
<script src="/FrontEnd/assests/js/owl.carousel.js"></script>
<script src="/FrontEnd/assests/js/jquery.magnific-popup.min.js"></script>
<script src="/FrontEnd/assests/js/ajaxchimp.min.js"></script>
<script src="/FrontEnd/assests/js/newsletter.js"></script>
<script src="/FrontEnd/assests/js/jquery.form.js"></script>
<script src="/FrontEnd/assests/js/jquery.validate.min.js"></script>
<script src="/FrontEnd/assests/js/forms-2.js"></script>

<!-- Slider Revolution scripts -->
<script src="/FrontEnd/assests/revolution/js/jquery.themepunch.tools.min.js"></script>
<script src="/FrontEnd/assests/revolution/js/jquery.themepunch.revolution.min.js"></script>
<script src="/FrontEnd/assests/revolution/js/extensions/revolution.extension.actions.min.js"></script>
<script src="/FrontEnd/assests/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
<script src="/FrontEnd/assests/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
<script src="/FrontEnd/assests/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script src="/FrontEnd/assests/revolution/js/extensions/revolution.extension.migration.min.js"></script>
<script src="/FrontEnd/assests/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script src="/FrontEnd/assests/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
<script src="/FrontEnd/assests/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script src="/FrontEnd/assests/revolution/js/extensions/revolution.extension.video.min.js"></script>

<script>
    var tpj = jQuery;
    var revapi34;
    if (tpj("#rev_slider_home").revolution === undefined) {
        revslider_showDoubleJqueryError("#rev_slider_home");
    } else {
        revapi34 = tpj("#rev_slider_home").show().revolution({
            sliderType: "standard",
            jsFileLocation: "js/revolution-slider/js/",
            sliderLayout: "fullwidth",
            dottedOverlay: "none",
            delay: 9000,
            navigation: {
                keyboardNavigation: "on",
                keyboard_direction: "horizontal",
                mouseScrollNavigation: "off",
                onHoverStop: "on",
                touch: {
                    touchenabled: "on",
                    swipe_threshold: 75,
                    swipe_min_touches: 1,
                    swipe_direction: "horizontal",
                    drag_block_vertical: false
                },
                arrows: {
                    style: "zeus",
                    enable: true,
                    hide_onmobile: true,
                    hide_under: 600,
                    hide_onleave: true,
                    hide_delay: 200,
                    hide_delay_mobile: 1200,
                    tmp: '<div class="tp-title-wrap">    <div class="tp-arr-imgholder"></div> </div>',
                    left: {
                        h_align: "left",
                        v_align: "center",
                        h_offset: 30,
                        v_offset: 0
                    },
                    right: {
                        h_align: "right",
                        v_align: "center",
                        h_offset: 30,
                        v_offset: 0
                    }
                },
                bullets: {
                    enable: true,
                    hide_onmobile: true,
                    hide_under: 600,
                    style: "metis",
                    hide_onleave: true,
                    hide_delay: 200,
                    hide_delay_mobile: 1200,
                    direction: "horizontal",
                    h_align: "center",
                    v_align: "bottom",
                    h_offset: 0,
                    v_offset: 30,
                    space: 5,
                    tmp: '<span class="tp-bullet-img-wrap"><span class="tp-bullet-image"></span></span>'
                }
            },
            viewPort: {
                enable: true,
                outof: "pause",
                visible_area: "80%"
            },
            responsiveLevels: [1240, 1024, 778, 480],
            gridwidth: [1240, 1024, 778, 480],
            gridheight: [600, 550, 500, 450],
            lazyType: "none",
            parallax: {
                type: "scroll",
                origo: "enterpoint",
                speed: 400,
                levels: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
            },
            shadow: 0,
            spinner: "off",
            stopLoop: "off",
            stopAfterLoops: -1,
            stopAtSlide: -1,
            shuffle: "off",
            autoHeight: "off",
            hideThumbsOnMobile: "off",
            hideSliderAtLimit: 0,
            hideCaptionAtLimit: 0,
            hideAllCaptionAtLilmit: 0,
            debugMode: false,
            fallbacks: {
                simplifyAll: "off",
                nextSlideOnWindowFocus: "off",
                disableFocusListener: false
            }
        });
    }

</script>

<!-- MAIN JS -->
<script src="/FrontEnd/assests/js/script.js"></script>
        </form>
</body>
</html>


