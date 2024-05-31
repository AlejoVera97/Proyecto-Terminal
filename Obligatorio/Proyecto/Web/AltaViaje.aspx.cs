using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades_Compartidas;
using Logica;
using Persistencia;

public partial class AltaViaje : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["EmpLog"] != null)
            {
                Empleado empleado = (Empleado)Session["EmpLog"];
                lblCreador.Text = empleado.NombreCompleto;
            }
            Session["Todas"] = Logica.FabricaLogica.GetLogicaTerminal().ListarTodasTerm();
            Session["Elegidas"] = new List<PasaPor>();

            gvTodas.DataSource = (List<Terminal>)Session["Todas"];
            gvTodas.DataBind();
            gvElegidas.DataSource = (List<PasaPor>)Session["Paradas"];
            gvElegidas.DataBind();
        }
    }

    private void LimpioFormulario()
    {
        txtAnden.Text = "";
        txtCompania.Text = "";
        txtLlegada.Text = "";
        txtPasajeros.Text = "";
        txtPrecio.Text = "";
        txtSalida.Text = "";
        lblError.Text = "";
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {

    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioFormulario();
    }

    protected void btnAgregarParada_Click(object sender, EventArgs e)
    {
       
    }
}