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

public partial class cancelarpago : System.Web.UI.Page
{

    CajaPagoEstudiantesTableAdapter pagoTa = new CajaPagoEstudiantesTableAdapter();
    PagosCanceladosTableAdapter CanceladosTA = new PagosCanceladosTableAdapter();
    CajaBalanceEstudiantesTableAdapter balanceTA = new CajaBalanceEstudiantesTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Calendar1.SelectedDate = DateTime.Today;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt32(Session["idUsuario"]) == 0)
            {
                Response.Redirect("Denegado.aspx");
            }
            else
            {
                //cancelando el pago seleccionado
                pagoTa.CancelarPago(Convert.ToInt32(GridView1.SelectedDataKey.Value));

                //insertando el registro en la tabla de pagos cancelados
                CanceladosTA.Insert(Convert.ToInt32(GridView1.SelectedDataKey.Value), Convert.ToInt32(Session["idUsuario"]), DateTime.Now);

                //activando la deuda nuevamente
                balanceTA.ActivarDeuda(Convert.ToInt32(GridView1.SelectedRow.Cells[3].Text));

                GridView1.DataBind();

                lblmsg.Text = "El pago ha sido cancelado";
                lblmsg.ForeColor = System.Drawing.Color.Blue;

                Button1.Enabled = false;
            }

        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error cancelando el pago.";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("cancelarpago.aspx?");
    }
}
