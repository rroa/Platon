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

public partial class reportes_ExtraCredito : System.Web.UI.Page
{
    Estudiantes_ForSearchTableAdapter estudianteforsearchta = new Estudiantes_ForSearchTableAdapter();
    dsUniversidad.Estudiantes_ForSearchDataTable estudianteforsearchdt = new dsUniversidad.Estudiantes_ForSearchDataTable();

    EstudianteCarreraDATATableAdapter estCarr = new EstudianteCarreraDATATableAdapter();
    dsUniversidad.EstudianteCarreraDATADataTable estCarrdt = new dsUniversidad.EstudianteCarreraDATADataTable();

    ExtraCreditoTableAdapter extracreditoTA = new ExtraCreditoTableAdapter();
    dsUniversidad.ExtraCreditoDataTable extracreditoDT = new dsUniversidad.ExtraCreditoDataTable();

    String matricula;

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
            Session["id_estudiante"] = "";
        }
    }
    protected void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
        lblMsg.Text = "";

        try
        {
            Session["id_estudiante"] = "";
            gvextracredito.DataBind();

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

        }
        catch (Exception ex)
        {
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";

        try
        {

            if (Session["id_estudiante"].ToString() != "")
            {
                extracreditoTA.Insert(Convert.ToInt32(Session["id_estudiante"].ToString()), txtDescripcion.Text, Convert.ToInt32(Session["idUsuario"].ToString()), DateTime.Now, Convert.ToInt32(ddlCiclo.SelectedValue));
                gvextracredito.DataBind();
            }
            else
            {
                lblMsg.Text = "Debe de buscar un estudiante que exista antes de darle un extracredito";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Este extracredito para este estudiante ya esta creado";
        }
    }
}
