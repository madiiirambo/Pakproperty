<%@ Page Title="" Language="C#" MasterPageFile="~/AP.Master" AutoEventWireup="true" CodeBehind="UpdateFeaturedPropertiesTypes.aspx.cs" Inherits="PakProperty.UpdateFeaturedPropertiesTypes" %>
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
                                    <p>Add Property Types</p>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div class="col s12 m-t-20">
                                            <div class="row">


                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">home</i>
                                                    <asp:TextBox ID="pid" class="validate" onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90 ) && event.keyCode!=32);" runat="server"></asp:TextBox>
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
                                            
                                            
                                                                            &nbsp;&nbsp;    <asp:Button ID="Button2" class="btn btn-success" OnClick="update" runat="server" Text="Update" /><br /> <br />

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
