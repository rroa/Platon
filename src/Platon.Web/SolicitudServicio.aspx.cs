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
public partial class SolicitudServicio : System.Web.UI.Page
{
    dsUniversidadTableAdapters.BalancePendienteTableAdapter objta = new dsUniversidadTableAdapters.BalancePendienteTableAdapter();
    Estdiante_CarreraTableAdapter estCarrerata = new Estdiante_CarreraTableAdapter();
    dsUniversidad.EstudianteCarreraDATADataTable estcarrdt = new dsUniversidad.EstudianteCarreraDATADataTable();
    EstudianteCarreraDATATableAdapter estudiantecarrera = new EstudianteCarreraDATATableAdapter();
    dsUniversidadTableAdapters.BuscarEstudianteporMatriculaTableAdapter objtaest = new dsUniversidadTableAdapters.BuscarEstudianteporMatriculaTableAdapter();
    dsUniversidad.BuscarEstudianteporMatriculaDataTable obdt = new dsUniversidad.BuscarEstudianteporMatriculaDataTable();
    Vista_Dt_EstudianteTableAdapter objestudiante = new Vista_Dt_EstudianteTableAdapter();
    dsUniversidad.Vista_Dt_EstudianteDataTable estudiantedt = new dsUniversidad.Vista_Dt_EstudianteDataTable();
    CajaBalanceEstudiantesTableAdapter balanceTA = new CajaBalanceEstudiantesTableAdapter();
    
    int estudianteid;
    DateTime AnoIngreso;
    DateTime fecha_nac;
    string Carrera;
    string direccionestu;
    string nacionalidad;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            objtaest.Fill(obdt, txtMatricula.Text);

            foreach (dsUniversidad.BuscarEstudianteporMatriculaRow row in obdt.Rows)
            {
              estudianteid = row.cod_stu;
            }

            //guardando el monto al estudiante
            balanceTA.Insert(estudianteid, Convert.ToString(GridView1.SelectedRow.Cells[1].Text), DateTime.Now, true, false, "Servicio", Convert.ToDecimal(GridView1.SelectedRow.Cells[2].Text), 0, 0, 0, "0", Convert.ToInt32(Session["idUsuario"]),0);
            
            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "El servicio ha sido solicitado.";

            //ImageButton2.Enabled = false;
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error solicitando el servicio, intente nuevamente.";
        }
    }
    protected void gvServicios_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            objtaest.Fill(obdt, txtMatricula.Text);

            foreach (dsUniversidad.BuscarEstudianteporMatriculaRow row in obdt.Rows)
            {
                AnoIngreso = row.fecha_ingreso;
                
            }

            objestudiante.FillByMatricula(estudiantedt, txtMatricula.Text);

            foreach (dsUniversidad.Vista_Dt_EstudianteRow row in estudiantedt.Rows)
            {
                Carrera = row.carrera_nombre;
                fecha_nac = Convert.ToDateTime(row.f_nacimiento);
                nacionalidad = row.nacionalidad;
                direccionestu = row.direccion;

            }

            string direccion = "Form" + gvServicios.SelectedRow.Cells[1].Text.Replace(" ", "") + ".aspx";


            DetailsViewRow columna1 = dvEstudiante.Rows[1];
            String name = columna1.Cells[1].Text;
            DetailsViewRow columna4 = dvEstudiante.Rows[4];
            String telefono = columna4.Cells[1].Text;
            DetailsViewRow columna2 = dvEstudiante.Rows[2];
            String apellido = columna2.Cells[1].Text;
            DetailsViewRow columna5 = dvEstudiante.Rows[3];
            String cedula = columna5.Cells[1].Text;


            Session["id_servicio"] = Convert.ToInt32(gvServicios.SelectedDataKey.Value);
            Session["nombre_servicio"] = gvServicios.SelectedRow.Cells[1].Text;
            Session["costo_servicio"] = gvServicios.SelectedRow.Cells[2].Text;
            Session["nombre"] = name;
            Session["telefono"] = telefono;
            Session["carrera"] = Carrera;
            Session["matricula"] = txtMatricula.Text;
            Session["apellido"] = apellido;
            Session["fecha_nac"] = fecha_nac;
            Session["cedula"] = cedula;
            Session["ingreso"] = AnoIngreso;
            Session["nacionalidad"] = nacionalidad;
            Session["direccion"] = direccionestu;
            Response.Redirect(direccion);
        }
        catch (Exception ex)
        {
        }
    }
    protected void dvEstudiante_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
 
     }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            estudiantecarrera.FillByMatricula(estcarrdt, txtMatricula.Text);

            foreach (dsUniversidad.EstudianteCarreraDATARow row in estcarrdt.Rows)
            {
                lblcarrera.Text = row.carrera_nombre.ToString();
            }

         }
        catch (Exception ex)
        {
        }

        
    }
    protected void dvEstudiante_DataBound(object sender, EventArgs e)
    {
        if (!dvEstudiante.PageCount.Equals(0))
        {
            GridView1.Enabled = true;
            gvServicios.Enabled = true;
        }
        else
        {
            GridView1.Enabled = false;
            gvServicios.Enabled = false;
        }
    }
    protected void btnCancelar_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("SolicitudServicio.aspx?");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblmsg.Text = "";
    }
}

