<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderPage.aspx.cs" Inherits="OrderBento.OrderPage" %>

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
                <asp:Image ID="imgOrg" runat="server" ImageUrl="~/Images/TaichungKim.jpg"/>
            </span>
            <span>
                <asp:Label ID="lblGp" runat="server" Text="團一"></asp:Label>
            </span>
            <span>
                狀態:
                <asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem Value="0" Text="未結團"></asp:ListItem>
                    <asp:ListItem Value="1" Text="結團"></asp:ListItem>
                    <asp:ListItem Value="2" Text="已到"></asp:ListItem>
                </asp:DropDownList>
            </span>
        </div>

        <hr />

        <div>
            店名:<asp:Label ID="lblRes" runat="server" Text="麥當勞"></asp:Label>&nbsp
            主揪:<asp:Label ID="lblOrg" runat="server" Text="達芬奇"></asp:Label>
        </div>

        <hr />

        <div>
            <span>小計:960</span>
            <span>排骨*8</span>
            <span>三杯*4</span>
        </div>

        <hr />

        <div>
            <asp:Repeater ID="repOrderMember" runat="server" OnItemDataBound="repOrderMember_ItemDataBound">
                <ItemTemplate>
                        <asp:Button ID="btnKickout" runat="server" Text="X" OnClick="btnKickout_Click"/>
                        <image src="<%# Eval("Image") %>" Width="70" Height="70"></image><br />

                        <asp:Repeater ID="repOrderMenu" runat="server" OnItemDataBound="repOrderMenu_ItemDataBound">
                            <ItemTemplate>
                                <%# Eval("DishName") %>:
                                <asp:DropDownList ID="ddlAmount" runat="server">
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:Repeater>
                    <hr />
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <hr />

        <div>
            <asp:Image ID="imgCurrent" runat="server"/>
            <asp:Repeater ID="repMenu" runat="server">
                <ItemTemplate>
                    <div>
                        品名:<asp:Literal ID="ltDishName" runat="server" Text='<%# Eval("DishName") %>'></asp:Literal>&nbsp 價格:<%# Eval("Price") %>
                        <asp:DropDownList ID="ddlOrderAmount" runat="server">
                            <asp:ListItem Value="0">0</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Button ID="btnOrder" runat="server" Text="OK" OnClick="btnOrder_Click"/>
        </div>
    </form>
</body>
</html>
