using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AltaEmpleado : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            this.LimpioFormulario();

    }

    protected void LimpioFormulario()
    {
        txtContraseña.Text = "";
        txtNomComp.Text = "";
        txtNomUsu.Text = "";
        lblError.Text = "";
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        Entidades_Compartidas.Empleado unEmpleado = null;
        try
        {
            unEmpleado = new Entidades_Compartidas.Empleado(txtNomUsu.Text.Trim(), txtContraseña.Text.Trim(), txtNomComp.Text.Trim());
            Logica.FabricaLogica.GetLogicaEmpleado().AltaE(unEmpleado);
            this.LimpioFormulario();
            lblError.Text = "Alta con Éxito";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioFormulario();
    }
}