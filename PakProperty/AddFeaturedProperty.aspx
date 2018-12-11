<%@ Page Title="" Language="C#" MasterPageFile="~/AP.Master" AutoEventWireup="true" CodeBehind="AddFeaturedProperty.aspx.cs" Inherits="PakProperty.AddFeaturedProperty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="page-content-wrapper">

<!--EDIT TESTIMONIALS-->
        <div class="page-content">
            <!-- Content Header (Page header) -->
            <section class="content-header z-depth-1">
                <div class="header-icon">
                    <i class="fa fa-file-o"></i>
                </div>
                <div class="header-title">
                    <h1> Add Featured Properties</h1>
                    <small></small>
                    <ul class="link hidden-xs">
                        <li><a href="Dashboard.aspx"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="ViewFeaturedProperties.aspx">View Featured Properties</a></li>
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
                                    <p>Add Property info</p>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div class="col s12 m-t-20">
                                            <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">home</i>
                                                    <asp:TextBox ID="pnameTxt" class="validate" runat="server"></asp:TextBox>
                                                    <label for="pnameTxt">Property name </label>
                                                </div>

                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">add_location</i>
                                                      <asp:TextBox ID="paddressTxt" class="validate" runat="server"></asp:TextBox>
                                                    <label>Property address</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="pdesTxt" TextMode="MultiLine" Width="1000" Height="200" runat="server" class="validate" ></asp:TextBox>
                                                    <label>Property Description</label>
                                                </div>
                                                
                                            </div>
                                            <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">add_location</i>
                                                    <asp:TextBox ID="pcityTxt" class="validate" runat="server"></asp:TextBox>
                                                    <label>City</label>
                                                </div>

                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">add_location</i>
                                                    <asp:TextBox ID="pcountryTxt" class="validate" runat="server"></asp:TextBox>
                                                    <label>Country</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">business</i>
                                                    <asp:TextBox ID="minpriceTxt" class="validate" runat="server"></asp:TextBox>
                                                    <label>Minimum Price</label>
                                                </div>

                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">business</i>
                                                    <asp:TextBox ID="maxpriceTxt"  class="validate" runat="server"></asp:TextBox>
                                                    <label>Maximum Price </label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">hotel</i>
                                                    <asp:TextBox ID="totalbedsTxt"  class="validate" runat="server"></asp:TextBox>
                                                    <label>Total Beds</label>
                                                </div>

                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">hot_tub</i>
                                                    <asp:TextBox ID="totalbathsTxt" class="validate"  runat="server"></asp:TextBox>
                                                    <label>Total Baths</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">directions_car</i>
                                                    <asp:TextBox ID="totalgarageTxt" class="validate"  runat="server"></asp:TextBox>
                                                    <label>Total Garage if any</label>
                                                </div>
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">kitchen</i>
                                                    <asp:TextBox ID="totalkitchesTxt" class="validate"  runat="server"></asp:TextBox>
                                                    <label>Total Kitchen if any</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">business</i>
                                                    <asp:TextBox ID="totalbalconyTxt" class="validate" runat="server"></asp:TextBox>
                                                    <label>Total Balcony</label>
                                                </div>

                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">business</i>
                                                    <asp:TextBox ID="sqftTxt"  class="validate" runat="server"></asp:TextBox>
                                                    <label>Total Square Ft </label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">business</i>
                                                    <asp:TextBox ID="videolinkTxt" class="validate" runat="server"></asp:TextBox>
                                                    <label>Add Video Link</label>
                                                </div>

                                               <div class="input-field form-input col s6">
                                                     <div class="card-content">
                                        <p class="m-b-15">Upload Cover Image Of Property</p>
                                          <div action="#" class="dropzone" id="dropzoneForm3">
                                            <div class="fallback">
                                                <asp:FileUpload ID="FileUpload4"  runat="server" />
                                            </div>
                                        </div>
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
                                      <div action="#" class="dropzone" id="dropzoneForm3">
                                        <div class="fallback">
                                            <asp:FileUpload ID="FileUpload1" AllowMultiple="true" runat="server" />
                                        </div>
                                    </div>
                                    </div>
                                    <br>

                                   


 &nbsp;&nbsp;&nbsp;    <asp:Button ID="btn" class="btn btn-success" OnClick="addBasicInfo" runat="server" Text="Submit" /><br /> <br />

                                </div>

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



    

     <div id="page-content-wrapper">


        <!--EDIT TESTIMONIALS-->
        <div class="page-content">

            <!-- Content Header (Page header) -->
           
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
                                    <p>Add Property Types</p>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div class="col s12 m-t-20">
                                            <div class="row">

                                               
                                                        
            
                    
                

                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">home</i>
                                                    <asp:TextBox ID="pid" class="validate"  onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" runat="server"></asp:TextBox>
                                                    <label for="pnameTxt">Enter Id Number  </label>
                                                </div>

                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">home</i>
                                                    <asp:TextBox ID="floorTxt"  class="validate" runat="server"></asp:TextBox>
                                                    <label for="pnameTxt">Enter Floors Or Shops  </label>
                                                </div>

                                                
                                            </div>
                                            <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">business</i>
                                                    <asp:TextBox ID="Min" class="validate"  runat="server"></asp:TextBox>
                                                    <label for="pnameTxt"> Minumum Price   </label>
                                                </div>

                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">business</i>
                                                      <asp:TextBox ID="Max" class="validate" runat="server"></asp:TextBox>
                                                    <label>Maximum Price</label>
                                                </div>
                                            </div>
                                            
                                            <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">business</i>
                                                    <asp:TextBox ID="MinSq" class="validate" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" runat="server"></asp:TextBox>
                                                    <label for="pnameTxt"> Minumum Square Ft   </label>
                                                </div>

                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">business</i>
                                                      <asp:TextBox ID="MaxSq" class="validate" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" runat="server"></asp:TextBox>
                                                    <label>Maximum Square Ft</label>
                                                </div>
                                            </div>
                                            
                                            
                                                                            &nbsp;&nbsp;    <asp:Button ID="Button2" class="btn btn-success" OnClick="addType" runat="server" Text="Submit" /><br /> <br />

                                        </div>
                                    </div>
                                </div>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <!-- ./row -->
            </div>

            <!-- ./cotainer -->
        </div>

     <div id="page-content-wrapper">


        <!--EDIT TESTIMONIALS-->
        <div class="page-content">
            <!-- Content Header (Page header) -->
           
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
                                    <p>Add Project Features </p>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div class="col s12 m-t-20">
                                            <div class="row">


                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">home</i>
                                                    <asp:TextBox ID="proId" class="validate"  onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" runat="server"></asp:TextBox>
                                                    <label for="pnameTxt">Enter Id Number  </label>
                                                </div>

                                                </div>
                                            <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="featuresTxt" TextMode="MultiLine" Width="1000" Height="200" runat="server" placeholder="Eg: Pool,Garage,Shopping Mall" class="validate" ></asp:TextBox>
                                                    <label>Property Features</label>
                                                </div>
                                                
                                            </div>
                                        
                                            &nbsp;&nbsp;    <asp:Button ID="Button1" class="btn btn-success" OnClick="addFeatures" runat="server" Text="Submit" /><br /> <br />

                                        </div>
                                    </div>
                                </div>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <!-- ./row -->
            </div>

            <!-- ./cotainer -->
        </div>
     
     <div id="page-content-wrapper">


        <!--EDIT TESTIMONIALS-->
        <div class="page-content">
            <!-- Content Header (Page header) -->
           
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
                                    <p>Add Payment Plan and Location Link </p>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div class="col s12 m-t-20">
                                            <div class="row">


                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">home</i>
                                                    <asp:TextBox ID="proppid" class="validate"  onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" runat="server"></asp:TextBox>
                                                    <label for="pnameTxt">Enter Id Number  </label>
                                                </div>

                                                </div>
                                            <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="locationTxt" TextMode="MultiLine" Width="1000" Height="100" runat="server" placeholder="Please Remove (Starting) <iframe   (Ending) ><iframe/>" class="validate" ></asp:TextBox>
                                                    <label>Location Link</label>
                                                </div>
                                                
                                            </div>

                                            <div class="card-header">
                                    <i class="fa fa-file-text"></i>
                                    <h2>File Upload</h2>
                                </div>
                                <div class="card-content">
                                    <p class="m-b-15">Upload Images Payment Plan Of property</p>
                                      <div action="#" class="dropzone" id="dropzoneForm3">
                                        <div class="fallback">
                                            <asp:FileUpload ID="FileUpload2" AllowMultiple="true" runat="server" />
                                        </div>
                                    </div>
                                    </div>
                                    <br>

                                        
                                            &nbsp;&nbsp;    <asp:Button ID="Button4" class="btn btn-success" OnClick="addLocationPP" runat="server" Text="Submit" /><br /> <br />

                                        </div>
                                    </div>
                                </div>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <!-- ./row -->
            </div>

            <!-- ./cotainer -->
        </div>

     <div id="page-content-wrapper">


        <!--EDIT TESTIMONIALS-->
        <div class="page-content">
            <!-- Content Header (Page header) -->
           
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
                                    <p>Add Agents </p>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div class="col s12 m-t-20">
                                            <div class="row">


                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">home</i>
                                                    <asp:TextBox ID="agpid" class="validate"  onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" runat="server"></asp:TextBox>
                                                    <label for="pnameTxt">Enter Id Number  </label>
                                                </div>

                                                 <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="agentName" runat="server"  class="validate" ></asp:TextBox>
                                                    <label>Agent Name</label>
                                                </div>

                                                </div>
                                            <div class="row">


                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="agentMob" runat="server"  class="validate" ></asp:TextBox>
                                                    <label>Agent Mobile Number</label>
                                                </div>



                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="fblink" runat="server" class="validate" ></asp:TextBox>
                                                    <label>Agent Facebook Link</label>
                                                </div>

                                                
                                            </div>

                                            <div class="card-header">
                                    <i class="fa fa-file-text"></i>
                                    <h2>File Upload</h2>
                                </div>
                                <div class="card-content">
                                    <p class="m-b-15">Upload Image Agent</p>
                                      <div action="#" class="dropzone" id="dropzoneForm3">
                                        <div class="fallback">
                                            <asp:FileUpload ID="FileUpload3" AllowMultiple="true" runat="server" />
                                        </div>
                                    </div>
                                    </div>
                                    <br>

                                        
                                            &nbsp;&nbsp;    <asp:Button ID="Button3" class="btn btn-success" OnClick="addAgents" runat="server" Text="Submit" /><br /> <br />

                                        </div>
                                    </div>
                                </div>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <!-- ./row -->
            </div>

            <!-- ./cotainer -->
        </div>

     <div id="page-content-wrapper">


        <!--EDIT TESTIMONIALS-->
        <div class="page-content">
            <!-- Content Header (Page header) -->
           
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
                                    <p>Add Booking Office Detail </p>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div class="col s12 m-t-20">
                                            <div class="row">


                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">home</i>
                                                    <asp:TextBox ID="probookId" class="validate"  onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" runat="server"></asp:TextBox>
                                                    <label for="pnameTxt">Enter Id Number  </label>
                                                </div>

                                                 <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="OfficeNameTxt" runat="server"  class="validate" ></asp:TextBox>
                                                    <label>Booking Office Name</label>
                                                </div>

                                                </div>
                                            <div class="row">


                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="baddTxt" runat="server"   class="validate" ></asp:TextBox>
                                                    <label>Office Address</label>
                                                </div>



                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="tphtxt" runat="server" class="validate" ></asp:TextBox>
                                                    <label>Contact</label>
                                                </div>

                                                
                                            </div>
                                            <div class="row">


                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="tphtxt1" runat="server"   class="validate" ></asp:TextBox>
                                                    <label>Contact</label>
                                                </div>



                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="tphtxt2" runat="server" class="validate" ></asp:TextBox>
                                                    <label>Contact</label>
                                                </div>

                                                
                                            </div>


                                    <br>

                                        
                                            &nbsp;&nbsp;    <asp:Button ID="Button5" class="btn btn-success" OnClick="addOfficeDetail" runat="server" Text="Submit" /><br /> <br />

                                        </div>
                                    </div>
                                </div>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <!-- ./row -->
            </div>

            <!-- ./cotainer -->
        </div>


















</asp:Content>
