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

public partial class controles_insertCarrera : System.Web.UI.UserControl
{

    dsUniversidadTableAdapters.CarreraTableAdapter carreraTA = new dsUniversidadTableAdapters.CarreraTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    void Limpiar()
    {
        txtcreditos.Text = "";
        txtnombre.Text = "";
        GridView1.DataBind();
        txtsiglas.Text = "";
        txttitulo.Text = "";
    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            carreraTA.Insert(txtnombre.Text, Convert.ToInt32(txtcreditos.Text), txtsiglas.Text,txttitulo.Text);
            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "Los datos han sido insertados correctamente";
            Limpiar();
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error insertando los datos";
        }
    }
    protected void btnCancelar_Click1(object sender, ImageClickEventArgs e)
    {
        Limpiar();
        lblmsg.Text = "";
    }
}
