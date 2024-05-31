using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AltaCompania : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            this.LimpiarFormulario();
    }

    protected void LimpiarFormulario()
    {
        txtNombre.Text = "";
        txtTelefono.Text = "";
        txtDireccion.Text = "";
        lblError.Text = "";
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            Entidades_Compartidas.Compania unaCompania = null;
            unaCompania = new Entidades_Compartidas.Compania(txtNombre.Text.Trim(), txtTelefono.Text.Trim(), txtDireccion.Text.Trim());
            Logica.FabricaLogica.GetLogicaCompania().AltaComp(unaCompania);
            this.LimpiarFormulario();

            lblError.Text = "Alta con Éxito";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpiarFormulario();
    }
}