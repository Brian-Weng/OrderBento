<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="OrderBento.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            aa帳號:<asp:TextBox ID="txtAccount" runat="server"></asp:TextBox>
        </div>
        <div>
            密碼:<asp:TextBox ID="txtPwd" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnLogin" runat="server" Text="登入" OnClick="btnLogin_Click"/>
        </div>
        <div>
            <asp:Label ID="lblMsg" runat="server" Text="帳號或密碼錯誤" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
