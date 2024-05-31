<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ABMTerminalNac.aspx.cs" Inherits="ABMTerminalNac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            text-align: right;
        }
        .auto-style4 {
            margin-left: 0px;
        }
        .auto-style5 {
            text-align: left;
            width: 265px;
        }
        .auto-style6 {
            width: 265px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td colspan="4">Mantenimiento de Terminales Nacionales</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Código Terminal:</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtCodigo" runat="server" Width="178px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnBuscarCod" runat="server" Text="Buscar Codigo" OnClick="btnBuscarCod_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Ciudad:</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtCiudad" runat="server" CssClass="auto-style4" Width="177px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Tiene Taxi:</td>
            <td class="auto-style5">
                <asp:CheckBox ID="chkTaxi" runat="server" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAltaTerm" runat="server" Text="Agregar Terminal" OnClick="btnAltaTerm_Click" />
            </td>
            <td class="auto-style6">
                <asp:Button ID="btnModificar" runat="server" Text="Modificar Terminal" OnClick="btnModificar_Click" />
            </td>
            <td>
                <asp:Button ID="btnEliminarTerm" runat="server" Text="Eliminar Terminal" />
            </td>
            <td>
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar Formulario" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:HyperLink ID="HyperLink1" runat="server">Volver</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>