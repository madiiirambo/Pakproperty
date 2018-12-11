<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginAdminPanel.aspx.cs" Inherits="PakProperty.LoginAdminPanel" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pak Property Admin Panel</title>
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="AdminPanel/assets/dist/img/ico/Shaikhani.png">
    <!-- Start Global Mandatory Style
         =====================================================================-->
    <!-- Material Icons CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="AdminPanel/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Animation Css -->
    <link href="AdminPanel/assets/plugins/animate/animate.css" rel="stylesheet" />
    <!-- materialize css -->
    <link href="AdminPanel/assets/plugins/materialize/css/materialize.min.css" rel="stylesheet">
    <!-- custom CSS -->
    <link href="AdminPanel/assets/dist/css/stylematerial.css" rel="stylesheet">
</head>

<body class="sign-section">
    <form runat="server">
    <div class="container sign-cont animated zoomIn">
        <div class="row sign-row">
            <div class="sign-title">
                <h2 class="teal-text"><i class="fa fa-user-circle-o"></i></h2>
                <h2 class="teal-text">Login</h2>
            </div>
            <div class="col s12" id="reg-form">
                <div class="row sign-row">
                    <div class="input-field col s12">
                        <asp:TextBox ID="nametxt" class="validate" runat="server"></asp:TextBox>
                        <label for="u_name">User Name</label>
                    </div>
                </div>
                <div class="row sign-row">
                    <div class="input-field col s12">
                        <asp:TextBox ID="passtxt" TextMode="Password" class="validate" runat="server"></asp:TextBox>
                        <label for="password">Password</label>
                    </div>
                </div>
                
                <div class="row sign-row">
                    <div class="input-field col s6">
                        <div class="sign-confirm">
                            <input type="checkbox" id="sign-confirm" />
                            <label for="sign-confirm">Remember me!</label>
                        </div>
                    </div>
                    <div class="input-field col s6">
                        <asp:Button ID="Login" OnClick="login" class="btn btn-large btn-register waves-effect waves-light green" runat="server" Text="Login" />
                    </div>
                </div>
            </div>

        </div>
        <a title="Login" class="sign-btn btn-floating btn-large waves-effect waves-light green">
            <i class="material-icons">perm_identity</i></a>
    </div>

    <!-- Start Core Plugins
         =====================================================================-->
    <!-- jQuery -->
    <script src="AdminPanel/assets/plugins/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <!-- materialize  -->
    <script src="AdminPanel/assets/plugins/materialize/js/materialize.min.js" type="text/javascript"></script>
    <!-- End Core Plugins
         =====================================================================-->
    <script>
        $(document).ready(function() {
            $('select').material_select();
        });
    </script>
        </form>
</body>
</html>
