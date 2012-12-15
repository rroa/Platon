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
using Microsoft.Reporting.WebForms;

public partial class HojaInscripcion : System.Web.UI.Page
{

    Matricula_EstudianteTableAdapter matriculaTA = new Matricula_EstudianteTableAdapter();
    dsUniversidad.Matricula_EstudianteDataTable matriculaDT = new dsUniversidad.Matricula_EstudianteDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblid.Text = "";
            try
            {
                txtmatricula.Text = Session["matriculainscripcion"].ToString();
            }
            catch (Exception ex)
            {

            }
        }
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            lblid.Text = "";

            matriculaTA.FillByMatricula(matriculaDT, txtmatricula.Text);
            foreach (dsUniversidad.Matricula_EstudianteRow fila in matriculaDT.Rows)
            {
                lblid.Text = fila.id_estudiante.ToString();
            }

            //cargando el reporte
            ReportParameter matricula = new ReportParameter();
            ReportParameter ciclo = new ReportParameter();

            matricula.Name = "matricula";
            matricula.Values.Add(txtmatricula.Text);

            ciclo.Name = "ciclo";
            ciclo.Values.Add(DropDownList1.SelectedValue);

            //ReportViewer1.ServerReport.SetParameters(new ReportParameter[] { matricula,ciclo });

            //ReportViewer1.ServerReport.Refresh();

            ReportViewer1.LocalReport.Refresh();


        }
        catch (Exception ex)
        {

        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //cargando el reporte
            ReportParameter matricula = new ReportParameter();
            ReportParameter ciclo = new ReportParameter();

            matricula.Name = "matricula";
            matricula.Values.Add(txtmatricula.Text);

            ciclo.Name = "ciclo";
            ciclo.Values.Add(DropDownList1.SelectedValue);

            //ReportViewer1.ServerReport.SetParameters(new ReportParameter[] { matricula, ciclo });

            //ReportViewer1.ServerReport.Refresh();

            ReportViewer1.LocalReport.Refresh();
        }
        catch (Exception ex)
        {
        }
    }
}
