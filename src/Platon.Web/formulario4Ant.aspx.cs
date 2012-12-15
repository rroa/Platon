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
using centroestudioTableAdapters;
using Microsoft.Reporting.WebForms;

public partial class estudiantesenseccion : System.Web.UI.Page
{
    CentroEstudioTableAdapter centroTA = new CentroEstudioTableAdapter();
    centroestudio.CentroEstudioDataTable centroDT = new centroestudio.CentroEstudioDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["rol"]) == 0 || Session["rol"].ToString() == "")
        {
            Response.Redirect("denegado.aspx");
        }

        ReportParameter[] nombre = new ReportParameter[1];

        centroTA.Fill(centroDT);
        foreach (centroestudio.CentroEstudioRow fila in centroDT.Rows)
        {
            nombre[0] = new ReportParameter("nombre", fila.nombre.ToString());
        }

        ReportViewer1.LocalReport.SetParameters(nombre);
        //ReportViewer2.LocalReport.SetParameters(nombre);
        //ReportViewer3.LocalReport.SetParameters(nombre);
        //ReportViewer4.LocalReport.SetParameters(nombre);
        //ReportViewer5.LocalReport.SetParameters(nombre);
        //ReportViewer6.LocalReport.SetParameters(nombre);

        ReportViewer1.LocalReport.Refresh();
        //ReportViewer2.LocalReport.Refresh();
        //ReportViewer3.LocalReport.Refresh();
        //ReportViewer4.LocalReport.Refresh();
        //ReportViewer5.LocalReport.Refresh();
        //ReportViewer6.LocalReport.Refresh();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ReportViewer1.LocalReport.Refresh();
        //ReportViewer2.LocalReport.Refresh();
        //ReportViewer3.LocalReport.Refresh();
        //ReportViewer4.LocalReport.Refresh();
        //ReportViewer5.LocalReport.Refresh();
        //ReportViewer6.LocalReport.Refresh();
    }
    protected void gvSecciones_SelectedIndexChanged(object sender, EventArgs e)
    {
        ReportViewer1.LocalReport.Refresh();
    }
}
