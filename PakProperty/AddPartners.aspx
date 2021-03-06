﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AP.Master" AutoEventWireup="true" CodeBehind="AddPartners.aspx.cs" Inherits="PakProperty.AddPartners" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--EDIT TESTIMONIALS-->
        <div class="page-content">
            <!-- Content Header (Page header) -->
            <br />
            <section class="content-header z-depth-1">
                <div class="header-icon">
                    <i class="fa fa-file-o"></i>
                </div>
                <div class="header-title">
                    <h1> Add Partners</h1>
                    <small></small>
                    <ul class="link hidden-xs">
                        <li><a href="Dashboard.aspx"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="AddPartners.aspx">Add Partners</a></li>
                        <li><a href="ViewPartners.aspx">View Partners</a></li>
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
                                    
                                    <h2>Add Partners</h2>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <div class="col s12 m-t-20">
                                            <div class="input-field form-input col s6">
                                                <i class="material-icons prefix">account_circle</i>
                                                <asp:TextBox ID="icon_prefix" runat="server"></asp:TextBox>
                                                <label for="icon_prefix">Partner Name</label>
                                            </div>

                                            
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
                                    <asp:Button ID="Button1" class="btn btn-success" runat="server" OnClick="addPartner" Text="Upload" />
                                    
                                    <br /><br />
<asp:Label ID="lblMessage" runat="server"></asp:Label>
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


</asp:Content>
