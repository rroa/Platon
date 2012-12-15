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

public partial class controles_insertRecinto : System.Web.UI.UserControl
{
    dsUniversidadTableAdapters.RecintoTableAdapter recintoTa = new dsUniversidadTableAdapters.RecintoTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    void Limpiar()
    {
        txtnombre.Text = "";
        txtdireccion.Text = "";
        txtsiglas.Text = "";
        txttelefono.Text = "";
        lblmsg.Text = "";
        GridView1.DataBind();
    }


    protected void btnGuardar_Click(object sender, ImageClickEventArgs e)
    {
        if (txtnombre.Text != "")
        {
            try
            {


                recintoTa.Insert(txtnombre.Text, txtsiglas.Text, txtdireccion.Text, txttelefono.Text);
                lblmsg.ForeColor = System.Drawing.Color.Blue;
                lblmsg.Text = "Los datos han sido insertados correctamente";
                GridView1.DataBind();
                Limpiar();


            }
            catch (Exception ex)
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Ha ocurrido un error insertando los datos";
            }
        }
        else
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Debe llenar por lo menos el campo de Nombre";
        }
    }
    protected void tnCancelar_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
    }
}
