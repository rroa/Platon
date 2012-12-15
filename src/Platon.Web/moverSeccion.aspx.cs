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

public partial class moverSeccion : System.Web.UI.Page
{
    Session_StudentTableAdapter sessionta = new Session_StudentTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
        lblmsg.Text = "";
    }
    protected void btnRegistrar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            //CAMBIANDO LA SECCION DEL ESTUDIANTE
            sessionta.CambiarSession(Convert.ToInt32(GridView1.SelectedDataKey.Value), Convert.ToInt32(gvSecciones.SelectedDataKey.Value));
            GridView1.DataBind();
            gvSecciones.DataBind();

            lblmsg.Text = "El cambio ha sido realizado";
            lblmsg.ForeColor = System.Drawing.Color.Blue;

            GridView1.SelectedIndex = -1;
            gvSecciones.SelectedIndex = -1;
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error realizando el cambio";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        lblmsg.Text = "";
        txtmatricula.Text = "";
        lblmateria.Text = "0";
        btnBuscar.Enabled = true;
        btnRegistrar.Enabled = true;
    }

    protected void gvSecciones_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            lblmateria.Text = gvSecciones.SelectedRow.Cells[4].Text.ToString();
        }
        catch (Exception ex)
        {

        }
    }
}
