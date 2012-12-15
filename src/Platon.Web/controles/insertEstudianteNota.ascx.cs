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

public partial class controles_insertEstudianteNota : System.Web.UI.UserControl
{

    Estudiante_NotaTableAdapter objta = new Estudiante_NotaTableAdapter();
    Session_StudentTableAdapter sessionta = new Session_StudentTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }   
    
    protected void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
        lblmsg.Text = "";
        ddlNota.SelectedIndex = 0;
    }
    protected void btnRegistrar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (txtNotaNum.Text == "")
            {
                lblmsg.Text = "Debe escribir la nota en n&uacute;mero";
            }
            else
            {
                int idstud = Convert.ToInt32(dvDatos.DataKey.Value);
                //guardando la nota
                objta.Insert(idstud, Convert.ToInt32(gvSecciones.SelectedDataKey.Value), ddlNota.SelectedValue, Convert.ToInt32(txtNotaNum.Text), Convert.ToDecimal(txtppEE.Text), Convert.ToDecimal(txtppPR.Text), Convert.ToDecimal(txtspEE.Text), Convert.ToDecimal(txtspPR.Text), Convert.ToDecimal(txtef.Text));

                lblmsg.ForeColor = System.Drawing.Color.Blue;
                lblmsg.Text = "La Nota ha sido asignada";

                //desactivando la seccion al estudiante
                sessionta.SacarEstudiante(Convert.ToInt32(gvSecciones.SelectedDataKey.Value));

                btnBuscar.Enabled = false;

                gvSecciones.DataBind();

                txtNotaNum.Text = "";
                ddlNota.SelectedIndex = 0;
            }
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error insertando los datos";
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
    protected void ddlNota_DataBound(object sender, EventArgs e)
    {
        try
        {
            ddlNota.Items.Insert(0, "-NOTA-");
        }
        catch (Exception ex)
        {

        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            txtmatricula.Text = Session["copiarmatricula"].ToString();
        }
        catch (Exception ex)
        {

        }
    }
}
