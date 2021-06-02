<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="OrderBento.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span>
                <asp:TextBox ID="txtSrcGp" runat="server" placeholder="團名"></asp:TextBox>
            </span>
            <span>
                <asp:TextBox ID="txtSrcRes" runat="server" placeholder="店名"></asp:TextBox>
            </span>
            <span>
                <asp:Button ID="btnSrh" runat="server" Text="搜尋" OnClick="btnSrh_Click"/>
            </span>
            <span>
                <asp:Button ID="btnLogin" runat="server" Text="登入" OnClick="btnLogin_Click"/>
            </span>
            <span>
                <asp:Button ID="btnCreate" runat="server" Text="建立" OnClick="btnCreate_Click"/>
            </span>
            <asp:Literal ID="ltAccountName" runat="server" Visible="false"></asp:Literal>

        </div>
        <asp:Repeater ID="repGroup" runat="server">
            <ItemTemplate>
                <div>
                    <a href="OrderPage.aspx?GpName=<%# Eval("Name") %>&AccName=<%# Eval("AccountName") %>">
                        <%--<span>
                            <asp:Image ID="imgUser" runat="server" ImageUrl='<%# Eval("Image") %>'/>
                        </span>--%>
                        <span>
                            <asp:Label ID="lblGp" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </span>
                        <span>
                            <asp:Label ID="lblRe" runat="server" Text='<%# Eval("RestName") %>'></asp:Label>
                        </span>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Repeater ID="repPaging" runat="server">
            <ItemTemplate>
                <a href="<%# Eval("Link") %>" title="<%# Eval("Title") %>"><%# Eval("Name") %></a>
            </ItemTemplate>
        </asp:Repeater>
    </form>
</body>
</html>
