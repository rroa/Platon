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

public partial class ModificarSession : System.Web.UI.Page
{

    Secciones_ActivasTableAdapter objta = new Secciones_ActivasTableAdapter();
    dsUniversidad.Secciones_ActivasDataTable obdt = new dsUniversidad.Secciones_ActivasDataTable();

    SessionTableAdapter sessionta = new SessionTableAdapter();
    dsUniversidad.SessionDataTable sessiondt = new dsUniversidad.SessionDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGuardar_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            //objta.FillByIdsession(obdt, Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text.ToString()));

            sessionta.UpdateSession(Convert.ToInt32(ddlprofesor.SelectedValue), Convert.ToInt32(txtCapacidad.Text), txthorario.Text, Convert.ToDateTime(txtfechainicio.Text), Convert.ToDateTime(txtfechafin.Text), Convert.ToInt32(GridView1.SelectedDataKey.Value));
            GridView1.DataBind();

            lblmsg.Text = "La secci&oacute;n ha sido actualizada";
            lblmsg.ForeColor = System.Drawing.Color.Blue;
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error actualizando la secci&oacute;n.";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
            
    }
    protected void btnCancelar_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ModificarSession.aspx?");
    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        try
        {
            objta.FillByIdsession(obdt, Convert.ToInt32(GridView1.SelectedDataKey.Value));

            foreach (dsUniversidad.Secciones_ActivasRow row in obdt.Rows)
            {
                ddlprofesor.SelectedValue = row.id_profesor.ToString();
                txtCapacidad.Text = row.capacidad.ToString();
                txthorario.Text = row.horario.ToString();
                txtfechainicio.Text = row.f_inicio.ToShortDateString();
                txtfechafin.Text = row.f_fin.ToShortDateString();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void ddlprofesor_DataBound(object sender, EventArgs e)
    {
        ddlprofesor.Items.Insert(0, "- Profesor -");
    }
}
