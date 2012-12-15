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

public partial class controles_insertAula : System.Web.UI.UserControl
{
    dsUniversidadTableAdapters.AulaTableAdapter aulaTA = new dsUniversidadTableAdapters.AulaTableAdapter();
    dsUniversidad.AulaDataTable obdt = new dsUniversidad.AulaDataTable();
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    void Limpiar()
    {
        txtnombre.Text = "";
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        aulaTA.FillByID_aula(obdt, Convert.ToInt32(GridView1.SelectedDataKey.Value));

        foreach (dsUniversidad.AulaRow row in obdt.Rows)
        {
            txtModNombre.Text = row.nombre.ToString();
            ddlModRecinto.SelectedValue = row.recinto_id.ToString();
            txtModid_aula.Text = row.id_aula.ToString();
            txtcapacidadre.Text = row.capacidad.ToString();
           

        }
    }
   
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (txtnombre.Text == "")
        {
            lblmsg.Text = "Debe llenar los campos";
        }
        else
        {

            try
            {
                aulaTA.Insert(txtnombre.Text, Convert.ToInt32(ddlRecinto.SelectedItem.Value),Convert.ToInt32(txtcapacidad.Text));
                lblmsg.ForeColor = System.Drawing.Color.Blue;
                lblmsg.Text = "Los datos han sido insertados correctamente";
                Limpiar();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Ha ocurrido un error insertando los datos";
            }
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
        lblmsg.Text = "";
    }
    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {
        aulaTA.Update(txtModNombre.Text, Convert.ToInt32(ddlModRecinto.SelectedValue), Convert.ToInt32(txtcapacidadre.Text), Convert.ToInt32(txtModid_aula.Text));
        GridView1.DataBind();
    }
    protected void ddlRecinto_DataBound(object sender, EventArgs e)
    {
        try
        {
            ddlRecinto.Items.Insert(0, "-seleccionar recinto-");
        }
        catch (Exception ex)
        {
        }
    }
}
