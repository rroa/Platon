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

public partial class controles_insertMateria : System.Web.UI.UserControl
{
    dsUniversidadTableAdapters.MateriaTableAdapter materiaTA = new dsUniversidadTableAdapters.MateriaTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvMateria.DataSourceID = objMaterias.ID;
            gvMateria.DataBind();
        }
    }
   
    void Limpiar()
    {
        txtcreditos.Text = "";
        txtnombre.Text = "";
        txtcodigo.Text = "";
        lblmsg.Text = "";
        txthp.Text = "";
        txtht.Text = "";
        gvMateria.DataBind();
    }

    protected void btnGuardar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            materiaTA.Insert(txtcodigo.Text, txtnombre.Text, Convert.ToInt32(txtcreditos.Text), Convert.ToInt32(txtht.Text), Convert.ToInt32(txthp.Text));
            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "Los datos han sido insertados correctamente";
            gvMateria.DataBind();

            Limpiar();
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error insertando los datos";
            gvMateria.DataBind();
        }
    }
    protected void btnCancelar_Click1(object sender, ImageClickEventArgs e)
    {
        Limpiar();
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            gvMateria.DataSourceID = ObjectDataSource1.ID;
            gvMateria.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
}
