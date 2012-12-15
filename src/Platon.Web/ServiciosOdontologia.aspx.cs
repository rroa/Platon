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

public partial class ServiciosOdontologia : System.Web.UI.Page
{
    Servicios_OdontologiaTableAdapter servicioodonto = new Servicios_OdontologiaTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            servicioodonto.Insert(TextBox1.Text, Convert.ToDecimal(TextBox2.Text));
            GridView1.DataBind();
            ImageButton1.Enabled = false;
        }
        catch (Exception ex)
        {

        }
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ServiciosOdontologia.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ServiciosOdontologia.aspx");
    }
}
