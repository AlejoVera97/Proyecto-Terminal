using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using Entidades_Compartidas;
using Persistencia;

public partial class ListadoDeViajes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            try
            {
                Session["_ListaDeViajes"] = FabricaLogica.GetLogicaViaje().ListarViajesProx();
                gvListado.DataSource = (List<Viaje>)Session["_ListaDeViajes"];
                gvListado.DataBind();

                Session["Companias"] = FabricaLogica.GetLogicaCompania().ListarComp();
                ddlCompania.DataSource = (List<Compania>)Session["Companias"];
                ddlCompania.DataTextField = "NombreC";
                ddlCompania.DataValueField = "NombreC";
                ddlCompania.DataBind();

                Session["Destinos"] = FabricaLogica.GetLogicaTerminal().ListarTodasTerm();
                ddlTerminal.DataSource = (List<Terminal>)Session["Destinos"];
                ddlTerminal.DataTextField = "Ciudad";
                ddlTerminal.DataValueField = "CodT";
                ddlTerminal.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
    }
}