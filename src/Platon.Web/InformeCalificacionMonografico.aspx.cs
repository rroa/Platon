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

public partial class InformeCalificacionFinal : System.Web.UI.Page
{

    CentroEstudioTableAdapter centroTA = new CentroEstudioTableAdapter();
    centroestudio.CentroEstudioDataTable centroDT = new centroestudio.CentroEstudioDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        ReportParameter[] nombre = new ReportParameter[1];

        centroTA.Fill(centroDT);
        foreach (centroestudio.CentroEstudioRow fila in centroDT.Rows)
        {
            nombre[0] = new ReportParameter("nombre", fila.nombre.ToString());
        }

        ReportViewer1.LocalReport.SetParameters(nombre);

        ReportViewer1.LocalReport.Refresh();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
    }
}
