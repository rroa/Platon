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

public partial class controles_insertCostoInscripcion : System.Web.UI.UserControl
{
    Costo_InscripcionTableAdapter objta = new Costo_InscripcionTableAdapter();
    dsUniversidad.Costo_InscripcionDataTable obdt = new dsUniversidad.Costo_InscripcionDataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
  
    protected void ddlcarreraexiste_SelectedIndexChanged(object sender, EventArgs e)
    {
      
    }

    protected void ddlRecinto_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            lblCostoCredito.Text = "";
            Label2.Visible = true;
            objta.FillByRecinto(obdt, Convert.ToInt32(ddlRecinto.SelectedValue));

            foreach (dsUniversidad.Costo_InscripcionRow row in obdt.Rows)
            {

                lblCostoCredito.Text = row.costo_inscripcion.ToString();

            }

            if (lblCostoCredito.Text == "")
            {
                lblCostoCredito.Text = "Este Recinto no tiene costo asignado";
            }

            lblmsg.Text = "";
        }
        catch (Exception ex)
        {

        }
    }
   
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            objta.Insert(Convert.ToInt32(ddlRecinto.SelectedValue), Convert.ToDecimal(txtcosto.Text), DateTime.Today, "1", Convert.ToInt32(ddlCarrera.SelectedValue));

            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "Los datos han sido insertados";

            txtcosto.Text = "";
            GridView2.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error insertando los datos";
        }
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            objta.DesactivarCostoInscripcion(Convert.ToInt32(GridView2.SelectedDataKey.Value));

            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "El costo de inscripci&oacute;n ha sido desactivado";

            GridView2.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error desactivando el costo";
        }
    }
    protected void ddlRecinto_DataBound(object sender, EventArgs e)
    {
        ddlRecinto.Items.Insert(0,"-Recintos-");
    }
}
