<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Terms-Condition.aspx.cs" Inherits="PakProperty.Terms_Condition" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="html 5 template">
    <meta name="author" content="">
    <title>Terms & Condition</title>
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
            <h1>Terms & Condition</h1>
            <h2><a href="Index.aspx">Home </a> &nbsp;/&nbsp; Terms & Conditions</h2>
        </div>
    </div>
</section>
<!-- END SECTION HEADINGS -->

<!-- START SECTION ABOUT -->
<section class="about-us">
    <div class="container">

        <h2> Privacy Policy</h2>

        <p>
            Below we set out our privacy policy which will govern the way in which we process any personal 
information that you provide to us. We will notify you if the way in which we process your information
is to change at any time.<br /> <br />

You can access our home page and browse our site without disclosing your personal data save information collected by cookies that we use (see below).

            <br /> <br />
<h3><b>WHO MAY PROCESS DATA</b></h3>
            
Your personal information (which includes your name, address and any other details you provide to us which concern you as an individual) may be processed both by us and by other companies within our group. Our website also includes a link to Rackspace and such company may collect personal data about visitors to our site. Each of the companies authorised to process your information as mentioned above will do so in accordance with this privacy policy.
            <br /> <br />
<h3><b>PURPOSE OF PROCESSING</b></h3> 
We will use your information for the purpose of fulfilling service orders placed by you, processing any other transactions authorised or made by you with us, informing you of special offers and providing other marketing information to you which we think you may find of interest, undertaking services or customer research/development.
            <br /> <br />
<h3><b>DISCLOSURE OF INFORMATION</b></h3>
In the unlikely event that a liquidator, administrator or receiver is appointed over us or all or any part of our assets that insolvency practitioner may transfer your information to a third party purchaser of the business provided that purchaser undertakes to use your information for the same purposes as set out in this policy. We undertake not to provide your personal information to third parties save in accordance with this policy. Your information will not be disclosed to government or local authorities or other government institutions save as required by law or other binding regulations.

            <br /><br />
<h3><b>COOKIES</b></h3>
We may send a small file to your computer when you visit our website. This will enable us to identify your computer, track your behaviour on our website and to identify your particular areas of interest so as to enhance your future visits to this website. We may use cookies to collect and store personal data and we link information stored by cookies with personal data you supply to us. Save for the use of cookies, we do not automatically log data or collect data save for information you specifically provide to us. You can set your computer browser to reject cookies but this may preclude your use of certain parts of this website.
            <br />
Third party vendors, including Google, use cookies to serve ads based on a user's prior visits to your website. Google's use of the DART cookie enables it and its partners to serve ads to your users based on their visit to your sites and/or other sites on the Internet. Users may opt out of the use of the DART cookie by visiting the advertising opt-out page.
            <br /><br />
<h3><b>SECURITY MEASURES</b></h3>
We have implemented security policies, rules and technical measures to protect the personal data that we have under our control from unauthorised access, improper use and disclosure, unauthorised destruction or accidental loss.
            <br /><br />
<h3><b>ACCESS TO INFORMATION</b></h3>
You may ask us whether we are storing personal information about you by emailing our admin department via the Contact page and, if you wish and upon payment of a fee of $10, we will provide you with a copy of the personal data we hold about you by email. We may ask for proof of your identity before providing any information and reserve the right to refuse to provide information requested if identity is not established.
            <br /><br />
<h3><b>COPYRIGHT</b></h3>
All website design, text, graphics, the selection and arrangement thereof are Copyright © 2007, Pakproperty.co, ALL RIGHTS RESERVED.
            <br /><br />
<h3><b>TRADEMARKS</b></h3>
Pakproperty.co is a trademark of Pak Property. Media Pvt Ltd or its subsidiaries and may be registered in certain parts of the world.
            <br /><br />
<h3><b>DISCLAIMER OF WARRANTY AND LIABILITY</b></h3>
The following provisions may be curtailed or disallowed by the laws of certain jurisdictions. In such case, the terms hereof are to be read as excluding or limiting such term so as to satisfy such law.
            <br /><br />
We do not represent or warrant that the information accessible via this website is accurate, complete or current. We have no liability whatsoever in respect of any use which you make of such information.
            <br /><br />
The information provided on this website has not been written to meet your individual requirements and it is your sole responsibility to satisfy yourself prior to ordering any products or services from us that they are suitable for your purposes.
            <br /><br />
Whilst we make all reasonable attempts to exclude viruses from the website, we cannot ensure such exclusion and no liability is accepted for viruses. Thus, you are recommended to take all appropriate safeguards before downloading information or images from this website.
            <br /><br />
All warranties, express or implied, statutory or otherwise are hereby excluded.
            <br /><br />
Neither we nor any of our employees or affiliated entities will be liable for any kind of damages and howsoever arising including, without limitation, loss of profits, compensatory, consequential, direct, exemplary, incidental, indirect, punitive or special, damages or any liability which you may have to a third party, even if we have been advised of the possibility of such loss.
            <br /><br />
We are not responsible for the direct or indirect consequences of you linking to any other website from this website.
            <br /><br />
<h3><b>CONSENT AND INQUIRIES</b></h3>
In order to access the information on this website, you must signal acceptance of the terms and disclaimer set out above. If you do not accept any of these terms, leave this website now.
            <br /><br />
If you have any enquiry or concern about our privacy policy or the way in which we are handling personal data please contact our admin department via the Contact page. If at any time you wish us to cease processing your information please send a message to our admin department and insert "unsubscribe" as the subject heading.
        </p>

        <br /> <br />

                <h2> Terms of Use</h2>
        <p>
            If you wish to use this Website or employ Pak Property for any service, you must agree to the terms below as the exclusive basis which governs usage of the Website and provision of services. If you do not agree to any of the terms, do not use this Website or employ Pak Property for any service.

<br /> <br />
THIS AGREEMENT is made between Pak Property Media Pvt Ltd and you ("the User"). <br /> <br />
<h3><b>1. DEFINITIONS</b></h3>
            <br />
In this Agreement, the following terms shall have the following meanings:-<br /><br />
"Effective Date" - the date on which this set of terms and conditions entered effect.<br /><br />
"Intellectual Property Rights"- all copyrights, patents, registered and unregistered design rights, database rights, trademarks and service marks and applications for any of the foregoing, together with all trade secrets, know-how, rights to confidence and other intellectual and industrial property rights in all parts of the world.
<br /><br />
"Material" - content published on the Website or otherwise provided to Pak Property by the user. For the avoidance of doubt, it includes all content posted on the Website by the User or otherwise provided to Pak Property by the User.
<br /><br />"Registration Details" - the details which a User must provide on registering for the Website including name, phone numbers, email address, age or address.
<br /><br />"Service" - the provision of the Website as a property portal or any other service provided by Pak Property
<br /><br />"Unacceptable" - Material which under the laws of any jurisdiction from which the Website may be accessed may be considered either:-
<br /><br />a. illegal, illicit, indecent, obscene, racist, offensive, pornographic, insulting, false, unreliable, misleading, alleged to be or actually defamatory or in infringement of third party rights (of whatever nature and including, without limitation, any Intellectual Property Rights);
<br /><br />b. in breach of any applicable regulations, standards or codes of practice (notwithstanding that compliance may not be compulsory);
<br /><br /> c. to contravene legislation, including without limitation, that relating to weapons, animals or alcohol;
<br /><br /> d. might harm Pak Property's reputation.
<br /><br />"User"- any party who uses any service provided by Pak Property, including the use of Website. For the avoidance of doubt, User includes all advertisers and all parties who enter into any agreement with Pak Property
<br /><br />"Website" - Pak Property's website located at www.Pakproperty.co
<br /><br />"Pak Property " - Pak Property Media Pvt Limited which is the owner of the Website and whose registered office is located at 94-B/I, MM Alam Road, Gulberg III, Lahore, Pakistan.
 <br /><br />
            
<h3><b>2.USER TERMS</b></h3>
<br /><br /> 2.1. In registering for this Website, the User must provide true, accurate, current and complete Registration Details which the User must update after any changes (except age) before using the Website for further services in the future.
<br /><br /> 2.2. The User hereby warrants to Pak Property that it is at least eighteen years of age and legally able to enter into contracts.
<br /><br /> 2.3. Pak Property reserves the discretion to withdraw any Material from the Website without prior notice and to refuse any Material posted by a User.
<br /><br /> 2.4. The User's Registration Details and data relating to its use of the Website will be recorded by Pak Property but this information shall not be disclosed to third parties (otherwise than on an aggregated, anonymous basis).
<br /><br /> 2.5. Pak Property may send a small file to the User's computer when it visits the Website. This "cookie" will enable Pak Property to identify the User's computer, track its behaviour on the Website and to identify the User's particular areas of interest so as to enhance the User's future visits to the Website. The cookie will not enable Pak Property to identify the User and Pak Property shall not use it otherwise than in relation to this Website. The User can set its computer browser to reject cookies but this may preclude use of certain parts of this Website.
<br /><br /> 2.6. The User hereby authorises Pak Property to use any information which it submits to this Website to inform the User of special offers, occasional third party offers and for other marketing and related purposes. Pak Property will not use User data for any other purposes than as set out in this Agreement except that Pak Property may disclose this data if compelled to do so by law, or at the request of a law enforcement agency or governmental authority.
<br /><br /> 2.7. If the User does not wish Pak Property to use its information as set out in Clauses 2.3 and 2.4 above, it should leave the Website before submitting its personal details.
<br /><br /> 2.8. If the User does not want Pak Property to use its email address or SMS to send information concerning the Website and related matters, the User should send a message to Pak Property and insert unsubscribe as the subject heading.
<br /><br /> 2.9. Pak Property reserves the right to suspend or terminate a User's account where, in its absolute discretion, it deems such suspension appropriate. In the event of such suspension or termination, Pak Property will notify the User by email and the User must not seek to re-register either directly or indirectly through a related entity.
<br /><br /> 2.10. For the avoidance of doubt, Pak Property is providing a service not goods.
<br /><br /> 2.11. Pak Property owns all Intellectual Property Rights in the Website and the Service, including without limitation, the design, text, graphics, the selection and arrangement thereof.
<br /><br /> 2.12. Pak Property takes reported and actual infringement of Intellectual Property Rights and fraud extremely seriously and whilst Users cannot hold Pak Property liable in relation to such issues, Pak Property requests all Users to report such matters immediately and Pak Property shall inform the appropriate authorities.
<br /><br /> 2.13. Users will be invited to send comments to Pak Property by email relating to the integrity and performance of other Users.
<br /><br /> 2.14. The following restrictions shall apply to all Users:
<br /><br /> a. User agrees not to transmit any material designed to interrupt, damage, destroy or limit the functionality of the Website or the Service.
<br /><br /> b. User agrees not to use any automated software to view the Service without consent and to only access the Service manually.
<br /><br /> c. User agrees not to use the Service other than for its own personal use or as an agent listing properties for sale and to rent.
<br /><br /> d. User shall not be entitled to delete any advertisement/listing for a period of 24 hours after posting on the website by said user.
<br /><br /> e. User agrees not to attempt to copy any Material or reverse engineer any processes without Pak Property's consent.
<br /><br /> f. User agrees not to use any Service in any manner that is illegal, immoral or harmful to Pak Property.
<br /><br /> g. User agrees not to use any Service in breach of any policy or other notice on the Website.
<br /><br /> h. User agrees not to remove or alter any copyright notices that appear on the Website.
<br /><br /> j. User agrees not to publish any Material that may encourage a breach of any relevant laws or regulations.
<br /><br /> j. User agrees not to interfere with any other User's enjoyment of the Website or the Service.
<br /><br /> k. User agrees not to transmit materials protected by copyright without the permission of the owner.
<br /><br /> l. User agrees not to conduct itself in an offensive or abusive manner whilst using the Website or the Service.
<br /><br /> 2.15. By submitting Material on the Website or otherwise, User grants Pak Property a royalty-free, perpetual, irrevocable and non-exclusive right and license to use, reproduce, distribute, display, modify and edit the Material. Pak Property will not pay the User any fees for the Material and reserves the right in its sole discretion to remove or edit the Material at any time. User also warrants and represents that it has all rights necessary to grant Pak Property these rights.
<br /><br /> 2.16. Pak Property permits the User to post Material on the Website in accordance with Pak Property's procedures provided that Material is not illegal, obscene, abusive, threatening, defamatory or otherwise objectionable to Pak Property.
<br /><br /> 2.17. Pak Property reserves the right to terminate any Service agreement without any notice to the User and without providing any reason whatsoever. In the event of cancellation, the User shall pay any outstanding invoices relating to the Service agreement within 14 working days.
<br /><br /> 2.18. Any User who enters into any agreement with Pak Property shall not in any way, directly or indirectly, employ or offer employment to any employee of Pak Property and/or its affiliates during the period of the agreement and up to one year after the termination/expiry of the agreement. Further, any User with any agreement with Pak Property shall not acquire any direct or indirect service from employees of Pak Property other than the services stipulated in their agreement with Pak Property for the aforementioned period. Further, any User with any agreement with Pak Property shall not solicit or endavour to entice away or discourage any employee of Pak Property from being employed by Pak Property for the aforementioned period.
<br /><br /> <h3><b> 3. LIMITATION OF LIABILITY </b></h3>
<br /><br /> 3.1. Pak Property is not liable for any indirect loss, consequential loss, loss of profits, revenue, data or goodwill howsoever arising suffered by any User arising in any way in connection with this Agreement or for any liability of a User to any third party.
<br /><br /> 3.2. Whilst Pak Property will make all reasonable attempts to exclude viruses from the Website, it cannot ensure such exclusion and no liability is accepted for viruses. Thus, the User is recommended to take all appropriate safeguards before downloading information or any Material from the Website.
<br /><br /> 3.3. Pak Property shall not be liable for ensuring that the Material on the Website is not Unacceptable Material and the User in making any financial or other decision accepts that it does so exclusively at its own risk.
<br /><br /> 3.4. Pak Property shall not be liable for any interruption to the Service, whether intentional or otherwise.
<br /><br /> 3.5. Pak Property is not liable for any failure in respect of its obligations hereunder which result directly or indirectly from failure or interruption in software or services provided by third parties.
 <br /><br /> 3.6. Pak Property is not responsible for the direct or indirect consequences of a User linking to any other website from the Website.
<br /><br /> 3.7. None of the clauses herein shall apply so as to restrict liability for death or personal injury resulting from the negligence of Pak Property or its appointed agents.
<br /><br /> 3.8. No matter how many claims are made and whatever the basis of such claims, Pak Property's maximum aggregate liability to a User under or in connection with this Agreement in respect of any direct loss (or any other loss to the extent that such loss is not excluded by Clauses 3.1-3.6 above or otherwise) whether such claim arises in contract or in tort shall not exceed a sum equal to twice the value of any amount paid to Pak Property by the User in relation to which such claim arises.
<br /><br /> <h3><b> 4. WARRANTIES AND INDEMNITY </b> </h3>
<br /><br /> 4.1. Pak Property does not represent or warrant that the information accessible via the Website is accurate, complete or current. Pak Property has no liability whatsoever in respect of any use which the User makes of such information.
<br /><br /> 4.2. Material has not been written to meet the individual requirements of the User and it is the User's sole responsibility to satisfy itself prior to entering into any transaction or decision that the Material is suitable for its purposes.
<br /><br /> 4.3. All warranties, express or implied, statutory or otherwise are hereby excluded.
<br /><br /> 4.4. The User hereby agrees to indemnify Pak Property against all liabilities, claims and expenses that may arise from any breach of this Agreement by the User.
<br /><br /> <h3><b> 5. GENERAL</b></h3>
<br /><br /> 5.1. Subject to Clause 5.2, this written Agreement and any other expressly incorporated document constitute the entire agreement between the parties hereto relating to the subject matter hereof and neither party has relied on any representation made by the other party unless such representation is expressly included herein. Nothing in this Clause 5.1 shall relieve either party of liability for fraudulent misrepresentations and neither party shall be entitled to any remedy for either any negligent or innocent misrepresentation except to the extent (if any) that a court or arbitrator may allow reliance on the same as being fair and reasonable.
<br /><br /> 5.2. Pak Property reserves the right to alter its terms of business from time to time. The Effective Date at the time the User is reading these terms is set out at the top of this Agreement. Prior to using the Website again in the future, Users should check that the effective date has not altered. If it has, the User should examine the new set of terms and only use the Website if it accepts the new terms.
<br /><br /> 5.3. If any provision of this Agreement or part thereof shall be void for whatever reason, it shall be deemed deleted and the remaining provisions shall continue in full force and effect.
<br /><br /> 5.4. Pak Property reserves the right to assign or subcontract any or all of its rights and obligations under this Agreement.
<br /><br /> 5.5. The User may not assign or otherwise transfer its rights or obligations under this Agreement without Pak Property's prior written consent.
<br /><br /> 5.6. Any notice given pursuant hereto may be served personally or by email to the last known email address of the addressee. It is the responsibility of Users promptly to update Pak Property of any change of address or email address. Such notice shall be deemed to have been duly served upon and received by the addressee, when served personally, at the time of such service, when sent by email 24 hours after the same shall has been sent, or if sent by post 72 hours after put into the post correctly addressed and pre-paid.
<br /><br /> 5.7. Pak Property shall not be liable for any loss suffered by the other party or be deemed to be in default for any delays or failures in performance hereunder resulting from acts or causes beyond its reasonable control or from any acts of God, acts or regulations of any governmental or supra-national authority.
<br /><br /> 5.8. The headings in this Agreement are solely used for convenience and shall not have any legal or contractual significance.
<br /><br /> 5.9. This Agreement shall be governed by and construed in accordance with the laws of Pakistan and the User submits to the exclusive jurisdiction of the Courts of Lahore, Pakistan, save that Pak Property may take action against the User in any relevant jurisdiction to enforce its rights.
        </p>

    </div>
</section>
<!-- END SECTION ABOUT -->  

<!-- START SECTION SERVICES -->
<!-- END SECTION SERVICES -->


<!-- START SECTION AGENTS -->

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