<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaEmpleado.aspx.cs" Inherits="AltaEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
            margin-top: 0px;
        }
        .auto-style3 {
            height: 23px;
            width: 357px;
        }
        .auto-style4 {
            height: 23px;
            width: 363px;
        }
        .auto-style5 {
            width: 363px;
        }
        .auto-style6 {
            height: 23px;
            width: 426px;
        }
        .auto-style7 {
            width: 426px;
        }
        .auto-style8 {
            width: 357px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="3" cellpadding="3" cellspacing="3" class="auto-style2" dir="ltr" frame="border" width="300">
        <tr>
            <td class="auto-style4">Nombre de Usuario</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtNomUsu" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="auto-style5">Nombre Completo</td>
            <td class="auto-style7">
                <asp:TextBox ID="txtNomComp" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Contraseña</td>
            <td class="auto-style7">
                <asp:TextBox ID="txtContraseña" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style7">
                <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Alta" Width="90px" />
            </td>
            <td class="auto-style8">
                <asp:Button ID="btnLimpiar" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar" Width="90px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style7">
                <asp:Label ID="lblError" runat="server" ForeColor="#FF3300"></asp:Label>
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

