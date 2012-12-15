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

public partial class insertServicioOdontologia : System.Web.UI.Page
{
    Servicios_OdontologiaTableAdapter servicioodont = new Servicios_OdontologiaTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("insertServicioOdontologia.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            servicioodont.Insert(txtservicio.Text, Convert.ToDecimal(txtcosto.Text));
            lblmsg.Text = "El servicio ha sido guardado";
            lblmsg.ForeColor = System.Drawing.Color.Blue;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error insertando los datos";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}
