<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Uploaa.aspx.cs" Inherits="PakProperty.Uploaa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" AllowMultiple="true" runat="server" />
        <asp:Button ID="Button1" runat="server" OnClick="addtblImages"  Text="Button" />
    </div>
    </form>
</body>
</html>
