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

public partial class claveestudiante : System.Web.UI.Page
{
    LogIn_StudentTableAdapter loginTA = new LogIn_StudentTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            loginTA.UpdateClave(txtclave.Text, txtmatricula.Text);
            lblmsg.Text = "La clave ha sido modificada.";
            lblmsg.ForeColor = System.Drawing.Color.Blue;
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error modificando la clave.";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("claveestudiante.aspx");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        txtclave.Enabled = true;
    }
}
