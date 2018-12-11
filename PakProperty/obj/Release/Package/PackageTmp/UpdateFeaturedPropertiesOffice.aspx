<%@ Page Title="" Language="C#" MasterPageFile="~/AP.Master" AutoEventWireup="true" CodeBehind="UpdateFeaturedPropertiesOffice.aspx.cs" Inherits="PakProperty.UpdateFeaturedPropertiesOffice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                    <p>Update Booking Office Detail </p>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div class="col s12 m-t-20">
                                            <div class="row">


                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">home</i>
                                                    <asp:TextBox ID="probookId" class="validate" ReadOnly="true"  onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90 ) && event.keyCode!=32);" runat="server"></asp:TextBox>
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

                                        
                                            &nbsp;&nbsp;    <asp:Button ID="Button5" class="btn btn-success" OnClick="update" runat="server" Text="Update" /><br /> <br />

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
