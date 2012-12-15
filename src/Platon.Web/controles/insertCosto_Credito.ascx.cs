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

public partial class controles_insertCosto_Credito : System.Web.UI.UserControl
{
    Costo_CreditoTableAdapter objta = new Costo_CreditoTableAdapter();
    dsUniversidad.Costo_CreditoDataTable obdt = new dsUniversidad.Costo_CreditoDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
   
    protected void ddlRecinto_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblCostoCredito.Text = "";
        Label2.Visible = true;
        objta.FillByRecinto(obdt, Convert.ToInt32(ddlRecinto.SelectedValue));

        foreach (dsUniversidad.Costo_CreditoRow row in obdt.Rows)
        {
  
            lblCostoCredito.Text = row.costo_credito.ToString();

        }

        if (lblCostoCredito.Text == "")
        {
            lblCostoCredito.Text = "Este recinto no tiene costo asignado";
        }
    }
    
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            objta.Insert(Convert.ToInt32(ddlRecinto.SelectedValue), Convert.ToDecimal(txtcosto.Text), DateTime.Today, "1", Convert.ToInt32(ddlCarrera.SelectedValue));

            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "El costo de los creditos ha sido guardado";
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
            objta.DesactivarCostoCredito(Convert.ToInt32(GridView2.SelectedDataKey.Value));

            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "El dato ha sido desactivado";

            GridView2.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error borrando los datos";
        }
    }
    protected void ddlRecinto_DataBound(object sender, EventArgs e)
    {
        ddlRecinto.Items.Insert(0, "-Recinto-");
    }
}
