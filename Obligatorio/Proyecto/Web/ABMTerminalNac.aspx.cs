using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades_Compartidas;
using Logica;
using Persistencia;

public partial class ABMTerminalNac : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)

        this.LimpioFormulario();
    }

    #region Auxiliares

    private void LimpioFormulario()
    {
        btnAltaTerm.Enabled = false;
        btnEliminarTerm.Enabled = false;
        btnModificar.Enabled = false;
        btnBuscarCod.Enabled = true;

        txtCiudad.Text = "";
        txtCiudad.Enabled = false;
        txtCodigo.Text = "";
        txtCodigo.Enabled = true;
        chkTaxi.Checked = false;
        lblError.Text = "";
    }

    private void ActivarBotones(bool esAlta = true)
    {
        btnAltaTerm.Enabled = esAlta;
        btnModificar.Enabled = !esAlta;
        btnEliminarTerm.Enabled = !esAlta;
        btnBuscarCod.Enabled = false;
        txtCiudad.Enabled = true;
    }

    private void DesactivarBotones()
    {
        btnAltaTerm.Enabled = false;
        btnEliminarTerm.Enabled = false;
        btnModificar.Enabled = false;
    }


    #endregion
    protected void btnAltaTerm_Click(object sender, EventArgs e)
    {
        try
        {
            TerminalNac terminal = new TerminalNac(Convert.ToBoolean(chkTaxi.Checked), txtCodigo.Text.Trim(), txtCiudad.Text.Trim());
            FabricaLogica.GetLogicaTerminal().AltaTerminal(terminal);
            this.LimpioFormulario();

            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Text = "Alta con Éxito";
        }
        catch (Exception ex)
        {
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            TerminalNac terminal = (TerminalNac)Session["Nacional"];

            terminal.Ciudad = txtCiudad.Text.Trim();
            terminal.Taxi = Convert.ToBoolean(chkTaxi.Checked);

            Logica.FabricaLogica.GetLogicaTerminal().ModificarT(terminal);
            LimpioFormulario();

            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Text = "Modificación Existosa";
        }
        catch (Exception ex)
        {
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = ex.Message;
        }
    }
    protected void btnEliminarTerm_Click(object sender, EventArgs e)
    {
        try
        {
            TerminalNac terminal = (TerminalNac)Session["Nacional"];

            Logica.FabricaLogica.GetLogicaTerminal().EliminarT(terminal);
            this.DesactivarBotones();
            this.LimpioFormulario();


            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Text = "Eliminación exitosa";
        }
        catch (Exception ex)
        {
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = ex.Message;
        }
    }

    protected void btnBuscarCod_Click(object sender, EventArgs e)
    {
        try
        {
            Terminal terminal = null;
            terminal = FabricaLogica.GetLogicaTerminal().BuscarTermAct(txtCodigo.Text.Trim());

            if (terminal == null)
            {
                this.ActivarBotones();
                txtCodigo.Enabled = false;
            }
            else if (terminal is TerminalInt)
                throw new Exception("Ese código de terminal pertence a una terminal internacional");

            else
            {
                btnEliminarTerm.Enabled = true;
                btnModificar.Enabled = true;
                Session["Nacional"] = terminal;
                txtCodigo.Text = terminal.CodT;
                txtCodigo.Enabled = false;
                txtCiudad.Text = terminal.Ciudad;
                txtCiudad.Enabled = true;
                chkTaxi.Checked = ((TerminalNac)terminal).Taxi;
            }
        }
        catch (Exception ex)
        {
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = ex.Message;
        }

    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioFormulario();
    }
}