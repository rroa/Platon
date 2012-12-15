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

public partial class controles_modificacionCalificaciones : System.Web.UI.UserControl
{
    Estudiante_NotaTableAdapter notata = new Estudiante_NotaTableAdapter();
    dsUniversidad.Estudiante_NotaDataTable notaDT = new dsUniversidad.Estudiante_NotaDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            lblmsg.Text = "";
            ddlNota.SelectedIndex = 0;
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnRegistrar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {

            notata.CambiarNota(ddlNota.SelectedItem.Text, Convert.ToInt32(txtNotaNum.Text), Convert.ToDecimal(txtppEE.Text), Convert.ToDecimal(txtppPR.Text), Convert.ToDecimal(txtspEE.Text), Convert.ToDecimal(txtspPR.Text), Convert.ToDecimal(txtef.Text), Convert.ToInt32(gvSecciones.SelectedDataKey.Value));
            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "La nota ha sido cambiada.";
            gvSecciones.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error cambiando la nota.";
            gvSecciones.DataBind();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        lblmsg.Text = "";
        ddlNota.SelectedIndex = 0;
        txtmatricula.Text = "";
        btnBuscar.Enabled = true;
        btnRegistrar.Enabled = true;
        txtNotaNum.Text = "";
    }
    protected void gvSecciones_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            notata.FillByIdNota(notaDT, Convert.ToInt32(gvSecciones.SelectedDataKey.Value));
            foreach (dsUniversidad.Estudiante_NotaRow fila in notaDT.Rows)
            {
                ddlNota.SelectedItem.Value = fila.nota;
                txtNotaNum.Text = fila.nota_num.ToString();
                txtppEE.Text = fila.PrimerParcialEE.ToString();
                txtppPR.Text = fila.PrimerParcialPR.ToString();
                txtspEE.Text = fila.SegundoParcialEE.ToString();
                txtspPR.Text = fila.SegundoParcialPR.ToString();
                txtef.Text = fila.ExamenFinal.ToString();
            }
        }
        catch (Exception ex)
        {

        }
    }
}
