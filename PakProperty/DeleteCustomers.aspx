<%@ Page Title="" Language="C#" MasterPageFile="~/AP.Master" AutoEventWireup="true" CodeBehind="DeleteCustomers.aspx.cs" Inherits="PakProperty.DeleteCustomers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-content-wrapper">
        <div class="page-content">
            <!-- Content Header (Page header) -->
            <br />
            <section class="content-header z-depth-1">
                <div class="header-icon">   
                    <i class="fa fa-table"></i>
                </div>
                <div class="header-title">
                    <h1> Update Customers </h1>
                    <small></small>
                    <ul class="link hidden-xs">

                        <li><a href="Dashboard.aspx"><i class="fa fa-home"></i>Dashboard</a></li>
                        <li><a href="ViewCustomers.aspx">View Customers</a></li>
                        <li><a href="UpdateCustomers.aspx">Update Customers</a></li>
                        <li><a href="DeleteCustomers.aspx">Delete Customers</a></li>
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
                                    
                                    <h2>Update Customers</h2>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div class="col s12 m-t-20">
                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">account_circle</i>
                                            <asp:TextBox ID="Cid" runat="server" onkeydown="return (!(event.keyCode>=65 && event.keyCode<=90 ) && event.keyCode!=32);"></asp:TextBox>
                                                
                                                <label for="Pid">Customer Id</label>
                                            </div>

                                            &nbsp;&nbsp;&nbsp;  <asp:Button ID="idBtn" OnClick="viewDate"  class="btn btn-success" Width="100" runat="server" Text="Show" />
                                            


                                        </div>
                                        <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">account_circle</i>
                                                <asp:TextBox   ID="Cname" runat="server"></asp:TextBox>
                                                 <label for="Pname">Customer Name</label>
                                            </div>
                                        <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">account_circle</i>
                                                <asp:TextBox   ID="Cdes" runat="server"></asp:TextBox>
                                                 <label for="Pname">Customer Description</label>
                                            </div>
                                    </div>
                                </div>
                                <!--File UPLOAD-->
                               
                                

                                <div class="card-header">
                                    <i class="fa fa-file-text"></i>
                                    <h2>Image Upload</h2>
                                </div>
                               
                                <div class="card-content">
                                    <p class="m-b-15">Upload Image</p>
                                    <div action="#" class="dropzone" id="dropzoneForm3">
                                        <div class="fallback">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </div>
                                    </div>
                                    <br>
                                    <asp:Button ID="Button1" class="btn btn-success" OnClick="delete" runat="server"  Text="Delete" />
                                    
                                </div>

                            </div>

                        </div>
                        <!-- Summernote -->
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="card">

                            </div>
                        </div>
                        <!-- ./Summernote -->

                        <!-- ./tabs -->
                        <!-- ./row -->
                    </div>
                </div>
                <!-- ./row -->
            </div> 
            <!-- ./cotainer -->

        </div>
        <!-- ./page-content -->
    </div>
</asp:Content>
