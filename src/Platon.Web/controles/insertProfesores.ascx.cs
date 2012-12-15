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

public partial class controles_insertProfesoresl : System.Web.UI.UserControl
{
    
    ProfesoresTableAdapter profesorTA = new ProfesoresTableAdapter();
    ProfesoresLoginTableAdapter profesorLoginTA = new ProfesoresLoginTableAdapter();

    int idprofesor;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    
    protected void btnGuardar_Click(object sender, ImageClickEventArgs e)
    {
        if (txtnombre.Text == "" || txtapellido.Text == "" || txtcedula.Text == "")
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Debe llenar los campos requeridos";
        }
        else
        {
            try
            {
                string f_nac = fnac_mes.Text + '/' + fnac_dia.Text + '/' + fnac_ano.Text;

                //insertando el profesor
                idprofesor = Convert.ToInt32(profesorTA.InsertProfesor(txtcedula.Text, txtnombre.Text, txtapellido.Text, Convert.ToDateTime(f_nac),Convert.ToDateTime(txtfechaIngreso.Text), txtelefono.Text, txtdireccion.Text, true,txtprofesion.Text, txtespecialidad.Text, ddlestadocivil.SelectedItem.Value, txtcelular.Text, txtcorreo.Text, txtescuela.Text, rblSexo.SelectedItem.Value));
                
                //datos del login
                profesorLoginTA.Insert(idprofesor, txtusername.Text, txtpasswd.Text);

                lblmsg.ForeColor = System.Drawing.Color.Blue;
                lblmsg.Text = "Los datos han sido insertados correctamente";
                btnGuardar.Enabled = false;
            }
            catch (Exception ex)
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Ha ocurrido un error insertando los datos" + ex.ToString();
            }
        }
    }
    protected void btnCancelar_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
    }

    public void Limpiar()
    {
        txtapellido.Text = "";
        txtcedula.Text = "";
        txtdireccion.Text = "";
        txtelefono.Text = "";
        txtnombre.Text = "";
        fnac_ano.Text = "";
        fnac_dia.Text = "";
        fnac_mes.Text = "";
        lblmsg.Text = "";
        
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("InsertProfesor.aspx?");
    }
}
