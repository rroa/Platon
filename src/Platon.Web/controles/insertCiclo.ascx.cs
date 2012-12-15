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
using System.Data.SqlTypes;

public partial class controles_insertCiclo : System.Web.UI.UserControl
{

    dsUniversidadTableAdapters.CicloTableAdapter cicloTa = new dsUniversidadTableAdapters.CicloTableAdapter();
    SessionTableAdapter sessionTa = new SessionTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
  
    protected void btnGuardar_Click1(object sender, ImageClickEventArgs e)
    {
        DateTime mes1, mes2, mes3, mes4, inscripcion, bajasanadidas, retiro;

        try
        {
            mes1 = DateTime.MaxValue;
            mes2 = DateTime.MaxValue;
            mes3 = DateTime.MaxValue;
            mes4 = DateTime.MaxValue;
            inscripcion = DateTime.MaxValue;
            bajasanadidas = DateTime.MaxValue;
            retiro = DateTime.MaxValue;

            try
            {
                inscripcion = Convert.ToDateTime(txtinscripcion.Text);
            }
            catch(Exception x)
            {
            }

            try
            {
                mes1 = Convert.ToDateTime(txtprimermes.Text);
             }
            catch(Exception x)
            {
            }
            try
            {

                mes2 = Convert.ToDateTime(txtsegundomes.Text);
         }
            catch(Exception x)
            {
            }
            try
            {
                mes3 = Convert.ToDateTime(txttercermes.Text);
     }
            catch(Exception x)
            {
            }
            try
            {
                mes4 = Convert.ToDateTime(txtcuartomes.Text);
 }
            catch(Exception x)
            {
            }
            try
            {
                bajasanadidas = Convert.ToDateTime(txtbajasanadidas.Text);
 }
            catch(Exception x)
            {
            }
            try
            {
                retiro = Convert.ToDateTime(txtretiro.Text);
 }
            catch(Exception x)
            {
            }
            
            
            
                cicloTa.Insert(Convert.ToInt32(Calendar1.SelectedDate.Year), Calendar1.SelectedDate, Calendar2.SelectedDate, true, txtnombreciclo.Text, mes1, false, mes2, mes3, mes4, bajasanadidas, retiro, inscripcion);

                lblmsg.ForeColor = System.Drawing.Color.Blue;
                lblmsg.Text = "Los datos han sido insertados correctamente";
                GridView1.DataBind();
            
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error insertando los datos";
            GridView1.DataBind();
        }
    }
    protected void btnCancelar_Click1(object sender, ImageClickEventArgs e)
    {
        lblmsg.Text = "";
        GridView1.DataBind();
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            cicloTa.DesactivarCiclo(GridView2.SelectedDataKey.Value.ToString());
            sessionTa.DesactivarPorCiclo(GridView2.SelectedDataKey.Value.ToString());
            GridView2.DataBind();
            GridView1.DataBind();
        }
        catch (Exception ex)
        { 
        }
    }
}
