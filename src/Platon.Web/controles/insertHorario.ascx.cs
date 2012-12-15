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

public partial class controles_insertHorario : System.Web.UI.UserControl
{
    HorarioTableAdapter objta = new HorarioTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void btnInsertar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            DateTime hora;
            DateTime horafin;
            hora = Convert.ToDateTime(horahora.Text + ":" + horaminuto.Text);
            horafin = Convert.ToDateTime(FinHora.Text + ":" + FinMinuto.Text);

            objta.Insert(txtdescripcion.Text, Convert.ToInt32(ddldia.SelectedValue), hora,horafin);
            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "Los datos han sido insertados correctamente";
            gvHorario.DataBind();

        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error insertando los datos";
        }
    }
   
}
