<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ABMTerminalInt.aspx.cs" Inherits="ABMTerminalInt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style6 {
            width: 265px;
        }
        .auto-style3 {
            text-align: right;
        }
        .auto-style5 {
            text-align: left;
            width: 265px;
        }
        .auto-style4 {
            margin-left: 0px;
        }
        .auto-style7 {
            text-align: right;
            height: 26px;
        }
        .auto-style8 {
            text-align: left;
            width: 265px;
            height: 26px;
        }
        .auto-style9 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td colspan="4">Mantenimiento de Terminales Internacionales</td>
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
                <asp:TextBox ID="txtCodigo" runat="server" Width="173px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnBuscarCod" runat="server" Text="Buscar Codigo" OnClick="btnBuscarCod_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">Ciudad:</td>
            <td class="auto-style8">
                <asp:TextBox ID="txtCiudad" runat="server" CssClass="auto-style4" Width="177px"></asp:TextBox>
            </td>
            <td class="auto-style9"></td>
            <td class="auto-style9"></td>
        </tr>
        <tr>
            <td class="auto-style3">País:</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtPais" runat="server" Width="177px"></asp:TextBox>
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
                <asp:Button ID="btnEliminarTerm" runat="server" Text="Eliminar Terminal" OnClick="btnEliminarTerm_Click" />
            </td>
            <td>
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar Formulario" OnClick="btnLimpiar_Click" />
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
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

