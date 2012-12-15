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


public partial class MantProfesores : System.Web.UI.Page
{
    ProfesoresTableAdapter objusr = new ProfesoresTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Panel1.Visible = true;
            lblmsg.Text = "";

            dsUniversidad.ProfesoresDataTable objdt = new dsUniversidad.ProfesoresDataTable();
            objusr.FillByID_profesor(objdt, Convert.ToInt32(GridView1.SelectedDataKey.Value));

            foreach (dsUniversidad.ProfesoresRow Row in objdt.Rows)
            {
                txtnombre.Text = Row.prof_nombre.ToString();
                txtapellido.Text = Row.prof_apellido.ToString();
                txtdireccion.Text = Row.prof_direccion.ToString();
                txtelefono.Text = Row.prof_telefono.ToString();
                txtfechaIngreso.Text = Row.prof_f_ingreso.ToShortDateString();
                txtfechanac.Text = Row.prof_f_nac.ToShortDateString();
                txtcedula.Text = Row.prof_cedula.ToString();
                txtprofesion.Text = Row.profesion.ToString();
                txtespecialidad.Text = Row.especialidad.ToString();
                ddlestadocivil.SelectedItem.Value = Row.EstadoCivil.ToString();
                txtcelular.Text = Row.Celular.ToString();
                txtcorreo.Text = Row.Correo.ToString();
                txtescuela.Text = Row.CarreraPrincipal.ToString();
                rblSexo.SelectedItem.Value = Row.sexo.ToString();

            }
            btnGuardar.Enabled = true;
        }
            catch (Exception ex)
            {
                lblmsg.Text = "Ha ocurrido un error cargando los datos del profesor";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    protected void btnGuardar_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            objusr.UpdateProfesor(txtcedula.Text, txtnombre.Text, txtapellido.Text, Convert.ToDateTime(txtfechaIngreso.Text) , txtelefono.Text, txtdireccion.Text, txtprofesion.Text, txtespecialidad.Text, ddlestadocivil.SelectedItem.Value, txtcelular.Text, txtcorreo.Text, txtescuela.Text, rblSexo.SelectedItem.Value, Convert.ToDateTime(txtfechanac.Text), Convert.ToInt32(GridView1.SelectedDataKey.Value));
            GridView1.DataBind();
            lblmsg.Text = "Los datos han sido actualizados";
            lblmsg.ForeColor = System.Drawing.Color.Blue;
            btnGuardar.Enabled = false;
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error actualizando los datos";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void btnCancelar_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("MantProfesores.aspx");
    }
}


