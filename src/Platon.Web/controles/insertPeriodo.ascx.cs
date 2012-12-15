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

public partial class controles_insertPeriodo : System.Web.UI.UserControl
{
    PeriodoTableAdapter objta = new PeriodoTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void btnInsertar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            objta.Insert(Convert.ToInt32(txtnumero.Text), txtdescripcion.Text, calinicio.SelectedDate.Month, calfin.SelectedDate.Month);
            lblmsg.Text = "Los datos han sido insertados";
            lblmsg.ForeColor = System.Drawing.Color.Blue;

            gvPeriodo.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error insertando los datos";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}
