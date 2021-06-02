<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePage.aspx.cs" Inherits="OrderBento.CreatePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            團名:<asp:TextBox ID="txtGpName" runat="server"></asp:TextBox>
        </div>
        <div>
            店名:
            <asp:DropDownList ID="ddlShopName" runat="server">
                <asp:ListItem Value="0" Text="請選擇"></asp:ListItem>
                <asp:ListItem Value="1" Text="麥當勞"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <%--<div>
            <span>
                <asp:Image ID="Image1" runat="server" />
            </span>
            <span>
                <asp:Button ID="btnImg" runat="server" Text="上傳圖片" />
            </span>
        </div>--%>
        <div>
            <span>
                <asp:Button ID="btnOK" runat="server" Text="確認" OnClick="btnOK_Click"/>
            </span>
            <span>
                <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click"/>
            </span>
        </div>
    </form>
</body>
</html>
