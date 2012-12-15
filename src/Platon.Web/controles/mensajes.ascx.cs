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

public partial class controles_mensajes : System.Web.UI.UserControl
{

    tblMensajeTableAdapter mensajeta = new tblMensajeTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            mensajeta.Insert(DateTime.Now, txtTitulo.Text, txtMensaje.Text, Session["nombre_login"].ToString(), true);
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error agregando el mensaje.";
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            mensajeta.DesactivarMensaje(Convert.ToInt32(GridView1.SelectedDataKey.Value));
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error desactivando el mensaje.";
        }
    }
}
