using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using dsUniversidadTableAdapters;

public partial class ModificarBalance : System.Web.UI.Page
{
    CajaBalanceEstudiantesTableAdapter cajaBalanceTA = new CajaBalanceEstudiantesTableAdapter();
    dsUniversidad.CajaBalanceEstudiantesDataTable cajaBalanceDT = new dsUniversidad.CajaBalanceEstudiantesDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["rol"]) == 0 || Session["rol"].ToString() == "")
        {
            Response.Redirect("denegado.aspx");
        }

        if (Convert.ToInt32(Session["rol"]) != 3)
        {
            if (Convert.ToInt32(Session["rol"]) != 1)
            {
                Response.Redirect("denegado.aspx");
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            cajaBalanceTA.FillByBalance(cajaBalanceDT, Convert.ToInt32(GridView1.SelectedDataKey.Value));

            foreach (dsUniversidad.CajaBalanceEstudiantesRow fila in cajaBalanceDT.Rows)
            {
                txtservicio.Text = fila.monto.ToString();
                txtinscripcion.Text = fila.inscripcion.ToString();
                txtcreditos.Text = fila.cant_creditos.ToString();
                txtcargocredito.Text = fila.total_por_Creditos.ToString();
            }

            lblmsg.Text = "";
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error buscando el registro";
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtservicio.Text == "" || txtcargocredito.Text == "" || txtcreditos.Text == "" || txtinscripcion.Text == "")
            {
                lblmsg.Text = "Debe llenar todos los campos";
            }
            else
            {
                cajaBalanceTA.ModificarBalance(Convert.ToDecimal(txtservicio.Text), Convert.ToDecimal(txtinscripcion.Text), Convert.ToInt32(txtcreditos.Text), Convert.ToDecimal(txtcargocredito.Text),Convert.ToInt32(GridView1.SelectedDataKey.Value));
                lblmsg.Text = "";
                GridView1.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error modificando los datos";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        txtservicio.Text = "";
        txtinscripcion.Text = "";
        txtcreditos.Text = "";
        txtcargocredito.Text = "";
    }
}
