<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaViaje.aspx.cs" Inherits="AltaViaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        .auto-style2 {
            width: 100%;
            margin-top: 0px;
        }
        .auto-style4 {
            height: 23px;
            width: 363px;
        }
        .auto-style6 {
            height: 23px;
            width: 426px;
        }
        .auto-style3 {
            height: 23px;
            width: 357px;
        }
        .auto-style5 {
            width: 363px;
        }
        .auto-style7 {
            width: 426px;
        }
        .auto-style8 {
            width: 357px;
        }
        .auto-style9 {
            width: 363px;
            height: 163px;
        }
        .auto-style10 {
            width: 426px;
            height: 163px;
        }
        .auto-style11 {
            width: 357px;
            height: 163px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="3" cellpadding="3" cellspacing="3" class="auto-style2" dir="ltr" frame="border" width="300">
        <tr>
            <td class="auto-style4">Cantidad de
                <br />
                Pasajeros:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtPasajeros" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="auto-style5">Anden:</td>
            <td class="auto-style7">
                <asp:TextBox ID="txtAnden" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Precio:</td>
            <td class="auto-style7">
                <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Fecha y Hora de Salida:</td>
            <td class="auto-style7">
                <asp:TextBox ID="txtSalida" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Fecha y Hora de Llegada:</td>
            <td class="auto-style7">
                <asp:TextBox ID="txtLlegada" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Compañía:</td>
            <td class="auto-style7">
                <asp:TextBox ID="txtCompania" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Empleado:</td>
            <td class="auto-style7">
                <asp:Label ID="lblCreador" runat="server"></asp:Label>
            </td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">Paradas:</td>
            <td class="auto-style10">
                Terminales disponibles<br />
                <asp:GridView ID="gvTodas" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:CommandField SelectText="Elegir Parada" ShowSelectButton="True" />
                        <asp:BoundField DataField="CodT" HeaderText="Codigo Terminal" />
                        <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" />
                    </Columns>
                </asp:GridView>
            </td>
            <td class="auto-style11">Paradas Asigandas al Viaje<br />
                <asp:GridView ID="gvElegidas" runat="server" AutoGenerateColumns="False" Height="127px" Width="315px">
                    <Columns>
                        <asp:BoundField HeaderText="Código de Terminal" DataField="CodT" />
                        <asp:BoundField HeaderText="Ciudad" DataField="Ciudad" />
                        <asp:BoundField HeaderText="Orden" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Alta" Width="90px" />
            </td>
            <td class="auto-style7">
                <asp:Button ID="btnAgregarParada" runat="server" Text="Agregar Parada" OnClick="btnAgregarParada_Click" />
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

