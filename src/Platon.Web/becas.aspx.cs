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

public partial class becas : System.Web.UI.Page
{
    Estudiantes_ForSearchTableAdapter estudianteforsearchta = new Estudiantes_ForSearchTableAdapter();
    dsUniversidad.Estudiantes_ForSearchDataTable estudianteforsearchdt = new dsUniversidad.Estudiantes_ForSearchDataTable();

    becaTableAdapter becaTA = new becaTableAdapter();
    dsUniversidad.becaDataTable becaDT = new dsUniversidad.becaDataTable();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtfecha.Text = DateTime.Today.ToShortDateString();
        }
    }
    protected void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            Session["id_estudiante"] = null;
            estudianteforsearchta.FillByMatricula(estudianteforsearchdt, txtbuscar.Text);
            foreach (dsUniversidad.Estudiantes_ForSearchRow fila in estudianteforsearchdt.Rows)
            {
                //matricula = fila.matricula.ToString();
                Session["id_estudiante"] = fila.cod_stu;
            }

            if (estudianteforsearchdt.Rows.Count.Equals(0))
            {
                lblEstudianteNo.Visible = true;
            }
            else
            {
                lblEstudianteNo.Visible = false;
            }

            //buscando la beca
            becaTA.FillByEstudiante(becaDT, Convert.ToInt32(Session["id_estudiante"]));
            foreach (dsUniversidad.becaRow becafila in becaDT.Rows)
            {
                Session["idbeca"] = becafila.id_beca;
                txtinscripcion.Text = becafila.beca_inscripcion.ToString();
                txtcreditos.Text = becafila.beca_creditos.ToString();
                txtservicios.Text = becafila.beca_servicios.ToString();
                txtfecha.Text = becafila.fecha_otorgada.ToShortDateString();
                txtpatrocinador.Text = becafila.beca_emisor.ToString();
            }
            if (becaDT.Rows.Count.Equals(0))
            {
                btnGuardar.Text = "Guardar";
            }
            else
            {
                btnGuardar.Text = "Actualizar";
            }

        }
        catch (Exception ex)
        {

        }
    }
    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        try
        {
            if (btnGuardar.Text == "Guardar")
            {
                becaTA.Insert(Convert.ToInt32(Session["id_estudiante"]), Convert.ToDecimal(txtinscripcion.Text), Convert.ToDecimal(txtcreditos.Text), Convert.ToDecimal(txtservicios.Text), Convert.ToDateTime(txtfecha.Text), txtpatrocinador.Text, Convert.ToInt32(Session["idUsuario"]), true, null, null);
                lblmsg.Text = "La beca ha sido guardad";
                lblmsg.ForeColor = System.Drawing.Color.Blue;
            }
            else if (btnGuardar.Text == "Actualizar")
            {
                becaTA.Update(Convert.ToInt32(Session["id_estudiante"]), Convert.ToDecimal(txtinscripcion.Text), Convert.ToDecimal(txtcreditos.Text), Convert.ToDecimal(txtservicios.Text), Convert.ToDateTime(txtfecha.Text), txtpatrocinador.Text, Convert.ToInt32(Session["idUsuario"]), true, null, null, Convert.ToInt32(Session["idbeca"]));
                lblmsg.Text = "La beca ha sido actualizada";
                lblmsg.ForeColor = System.Drawing.Color.Blue;
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error guardando la beca";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void btnDesactivar_Click(object sender, EventArgs e)
    {
        try
        {
            becaTA.DesactivarBeca(DateTime.Today, Convert.ToInt32(Session["idUsuario"]), Convert.ToInt32(Session["idbeca"]));

            lblmsg.Text = "La beca ha sido desactivada";
            lblmsg.ForeColor = System.Drawing.Color.Blue;
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error desactivando la beca";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("beca.aspx?");
    }
}
