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

public partial class estudiantesenseccionbalance : System.Web.UI.Page
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
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ReportViewer1.LocalReport.Refresh();
    }

}
