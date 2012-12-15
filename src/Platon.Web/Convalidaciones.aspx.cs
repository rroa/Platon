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

public partial class Convalidaciones : System.Web.UI.Page
{
    string matricula;

    ConvalidacionestblTableAdapter convalidacionesTA = new ConvalidacionestblTableAdapter();

    Estudiantes_ForSearchTableAdapter estudianteforsearchta = new Estudiantes_ForSearchTableAdapter();
    dsUniversidad.Estudiantes_ForSearchDataTable estudianteforsearchdt = new dsUniversidad.Estudiantes_ForSearchDataTable();

    EstudianteCarreraDATATableAdapter estCarr = new EstudianteCarreraDATATableAdapter();
    dsUniversidad.EstudianteCarreraDATADataTable estCarrdt = new dsUniversidad.EstudianteCarreraDATADataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["rol"]) == 0 || Session["rol"].ToString() == "")
        {
            Response.Redirect("denegado.aspx");
        }

        if (Convert.ToInt32(Session["rol"]) != 2)
        {
            if (Convert.ToInt32(Session["rol"]) != 1)
            {
                Response.Redirect("denegado.aspx");
            }
        }

        if (!IsPostBack)
        {
            Session["id_estudiante"] = null;
        }
    }
    protected void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            Session["id_estudiante"] = null;

            //buscando el id del estudiante
            estudianteforsearchta.FillByMatricula(estudianteforsearchdt, txtbuscar.Text);
            foreach (dsUniversidad.Estudiantes_ForSearchRow fila in estudianteforsearchdt.Rows)
            {
                matricula = fila.matricula.ToString();
                Session["id_estudiante"] = fila.cod_stu;
                Session["id_Carreraconv"] = fila.id_carrera;
                lblidcarrera.Text = fila.id_carrera.ToString();
            }

            //buscando la carrera
            estCarr.FillByMatricula(estCarrdt, txtbuscar.Text);
            foreach (dsUniversidad.EstudianteCarreraDATARow row in estCarrdt.Rows)
            {
                lblidcarrera.Text = row.id_carrera.ToString();
            }
            
            if (estudianteforsearchdt.Rows.Count.Equals(0))
            {
                lblEstudianteNo.Visible = true;
            }
            else
            {
                lblEstudianteNo.Visible = false;
            }

            ReportViewer1.LocalReport.Refresh();

        }
        catch (Exception ex)
        {

        }
    }

    protected void btnConvalidar_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtmateria.Text == "" || txtcreditos.Text == "")
            {
                lblmsg.Text = "Debe llenar todos los campos";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                convalidacionesTA.Insert(Convert.ToInt32(Session["id_estudiante"]), txtuniversidad.Text, txtmateria.Text, Convert.ToInt32(txtcreditos.Text), Convert.ToInt32(ddlmateria.SelectedItem.Value), DateTime.Today, Convert.ToInt32(Session["id_Carreraconv"]));
                GridView1.DataBind();
                lblmsg.Text = "Convalidada";
                lblmsg.ForeColor = System.Drawing.Color.Blue;
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Error: " + ex.ToString(); ;
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void ddlmateria_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtmateria.Text = "";
        txtcreditos.Text = "";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            convalidacionesTA.Delete(Convert.ToInt32(GridView1.SelectedDataKey.Value));
            GridView1.DataBind();

            lblmsg.Text = "Eliminada";
            lblmsg.ForeColor = System.Drawing.Color.Blue;
        }
        catch (Exception ex)
        {

        }
    }
}
