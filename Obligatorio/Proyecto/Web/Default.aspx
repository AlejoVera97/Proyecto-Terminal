<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3 {
            width: 262px;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            width: 262px;
            text-align: right;
        }
        .auto-style6 {
            width: 171px;
        }
        .auto-style7 {
            width: 262px;
            height: 23px;
        }
        .auto-style8 {
            width: 171px;
            height: 23px;
        }
        .auto-style9 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style7"></td>
                <td class="auto-style8"></td>
                <td class="auto-style9">
    
                    </td>
            </tr>
            <tr>
                <td class="auto-style5">Usuario: </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtUsuario" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td rowspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:GridView ID="gvListadoViajes" runat="server" Width="599px">
                    </asp:GridView>
                &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Password:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="2">
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Logueo" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
