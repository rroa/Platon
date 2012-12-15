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

public partial class controles_insertSession : System.Web.UI.UserControl
{
    SessionTableAdapter objta = new SessionTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGuardar_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            //creando la seccion
            objta.Insert(txtcodigo.Text, gvCiclo.SelectedDataKey.Value.ToString(), Convert.ToInt32(ddlMateria.SelectedValue), Convert.ToInt32(ddlProfesor.SelectedValue), Convert.ToInt32(txtcapacidad.Text), 1, Convert.ToInt32(ddlRecintos.SelectedItem.Value),txthorario.Text, Convert.ToDateTime(txtfinicio.Text), Convert.ToDateTime(txtffin.Text));

            lblmsg.Text = "Los datos han sido insertados";
            lblmsg.ForeColor = System.Drawing.Color.Blue;

            btnGuardar.Enabled = false;

            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error insertando los datos";
            lblmsg.ForeColor = System.Drawing.Color.Red;


        }
    }
    protected void btnCancelar_Click(object sender, ImageClickEventArgs e)
    {
        txtcapacidad.Text = "";
        txtcodigo.Text = "";
        btnGuardar.Enabled = true;
        ddlMateria.SelectedIndex = 0;
        ddlProfesor.SelectedIndex = 0;
        lblmsg.Text = "";

        GridView1.DataBind();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("InsertSession.aspx?");
    }
}
