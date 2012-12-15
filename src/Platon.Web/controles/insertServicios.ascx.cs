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

public partial class controles_insertServicios : System.Web.UI.UserControl
{

    dsUniversidadTableAdapters.ServiciosTableAdapter serviciosTA = new dsUniversidadTableAdapters.ServiciosTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
  
    void Limpiar()
    {
        txtcosto.Text = "";
        txtnombre.Text = "";
        lblmsg.Text = "";
        gvServicios.DataBind();
    }
    protected void btnGuardar_Click1(object sender, ImageClickEventArgs e)
    {
        bool form;

        if(CheckBox1.Checked == true)
        {
            form = true;
        }
        else
        {
            form = false;
        }

        try
        {
            serviciosTA.Insert(txtnombre.Text, Convert.ToDecimal(txtcosto.Text), true,form);

            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "Los datos han sido insertados";
            gvServicios.DataBind();
            txtcosto.Text = "";
            txtnombre.Text = "";

        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error insertando los datos";
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
    }
}
