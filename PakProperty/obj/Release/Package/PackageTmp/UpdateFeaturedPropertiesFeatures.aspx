<%@ Page Title="" Language="C#" MasterPageFile="~/AP.Master" AutoEventWireup="true" CodeBehind="UpdateFeaturedPropertiesFeatures.aspx.cs" Inherits="PakProperty.UpdateFeaturedPropertiesFeatures" %>
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
                                    <p>Update Properties Features </p>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div class="col s12 m-t-20">
                                            <div class="row">


                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">home</i>
                                                    <asp:TextBox ID="proId" class="validate" ReadOnly="true"  onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90 ) && event.keyCode!=32);" runat="server"></asp:TextBox>
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
                                        
                                            &nbsp;&nbsp;    <asp:Button ID="Button1" class="btn btn-success" OnClick="update" runat="server" Text="Update" /><br /> <br />

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
