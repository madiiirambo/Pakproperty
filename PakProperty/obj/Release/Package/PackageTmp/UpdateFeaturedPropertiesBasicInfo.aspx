<%@ Page Title="" Language="C#" MasterPageFile="~/AP.Master" AutoEventWireup="true" CodeBehind="UpdateFeaturedPropertiesBasicInfo.aspx.cs" Inherits="PakProperty.UpdateFeaturedPropertiesBasicInfo" %>
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
                    <h1> Update Featured Properties</h1>
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
                                    <h2>Editor</h2>
                                    <p>Update Property info</p>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div class="col s12 m-t-20">

                                            <div class="row">
                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">assignment</i>
                                                     <asp:TextBox ID="propertyId" runat="server" ReadOnly="true" class="validate" ></asp:TextBox>
                                                    <label>Property Id</label>
                                                </div>
                                                
                                            </div>

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


                                                </div>
                                            

                                        </div>
                                    </div>
                                </div>

                               

 &nbsp;&nbsp;&nbsp;    <asp:Button ID="btn" class="btn btn-success" OnClick="update" runat="server" Text="Update" /><br /> <br />

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
</asp:Content>
