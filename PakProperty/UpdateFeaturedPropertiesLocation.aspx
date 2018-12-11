<%@ Page Title="" Language="C#" MasterPageFile="~/AP.Master" AutoEventWireup="true" CodeBehind="UpdateFeaturedPropertiesLocation.aspx.cs" Inherits="PakProperty.UpdateFeaturedPropertiesLocation" %>
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
                                    <p>Update Location Link </p>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div class="col s12 m-t-20">
                                            <div class="row">


                                                <div class="input-field form-input col s6">
                                                    <i class="material-icons prefix">home</i>
                                                    <asp:TextBox ID="proppid" class="validate" ReadOnly="true"  onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90 ) && event.keyCode!=32);" runat="server"></asp:TextBox>
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

                                          
                                    <br>

                                        
                                            &nbsp;&nbsp;    <asp:Button ID="Button4" class="btn btn-success" OnClick="update" runat="server" Text="update" /><br /> <br />

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
