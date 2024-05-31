using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Entidades_Compartidas;
using Persistencia;
using Logica;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["EmpLog"] != null)
            {
                Empleado Usu = (Empleado)Session["EmpLog"];
                lblAdmin.Text = Usu.NombreCompleto;
            }
        }
    }

    protected void BtnSalir_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}
