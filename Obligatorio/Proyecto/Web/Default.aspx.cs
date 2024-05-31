using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades_Compartidas;
using Persistencia;
using Logica;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["EmpLog"] = null;

        try
        {
            List<Viaje> listado = Logica.FabricaLogica.GetLogicaViaje().ListarViajesProx();
            List<object> _objeto = (from v in listado
                                    select new
                                    {
                                        CodigoI = v.CodInt,
                                        Salida = v.FechaHoraS,
                                        Anden = v.Anden,
                                        Final = v.Paradas.Last().UnaParada.Ciudad
                                    }
                                   ).ToList<object>();

            if (_objeto.Count > 0)
            {
                gvListadoViajes.DataSource = _objeto;
                gvListadoViajes.DataBind();
            }
            else
            {
                gvListadoViajes.DataSource = null;
                gvListadoViajes.DataBind();
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "No hay viajes disponibles";
            }
        }
        catch (Exception ex)
        {
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = ex.Message;
        }
    }

    private void LimpioFormulario()
    {
        txtUsuario.Text = "";
        txtPass.Text = "";
    }

    private void ActualizoGrilla()
    {
        try
        {
            gvListadoViajes.DataSource = Logica.FabricaLogica.GetLogicaViaje().ListarViajesProx();
            gvListadoViajes.DataBind();
        }
        catch (Exception ex)
        {
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = ex.Message;
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string pNomUsu = txtUsuario.Text.Trim();
        string pContraseña = txtPass.Text.Trim();

        Empleado usu = Logica.FabricaLogica.GetLogicaEmpleado().BuscarE(pNomUsu);

        try
        {
            if (usu == null)
                throw new Exception("No hay usuarios registrados con ese identificador");
        }
        catch (Exception ex)
        {
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = ex.Message;
        }

        if (usu != null)
        {

            try
            {
                if (usu.PassW != pContraseña)
                {
                    throw new Exception("La contraseña no es correcta");
                }
            }
            catch (Exception ex)
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = ex.Message;
            }
            if (usu.PassW == pContraseña)
            {
                txtUsuario.Text = usu.UsuLog;
                txtPass.Text = usu.PassW;
                Session["EmpLog"] = usu;

                Response.Redirect("~/PaginaInicialEmpleado.aspx");
            }
        }
    }


}