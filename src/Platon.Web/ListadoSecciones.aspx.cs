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

public partial class ListadoSecciones : System.Web.UI.Page
{
    CentroEstudioTableAdapter centroTA = new CentroEstudioTableAdapter();
    centroestudio.CentroEstudioDataTable centroDT = new centroestudio.CentroEstudioDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        ReportParameter[] nombre = new ReportParameter[1];
        ReportParameter[] direccion = new ReportParameter[1];
        ReportParameter[] telefono = new ReportParameter[1];
        ReportParameter[] siglas = new ReportParameter[1];

        centroTA.Fill(centroDT);
        foreach (centroestudio.CentroEstudioRow fila in centroDT.Rows)
        {
            nombre[0] = new ReportParameter("nombre", fila.nombre.ToString());
            direccion[0] = new ReportParameter("direccion", fila.direccion.ToString());
            telefono[0] = new ReportParameter("telefono", fila.telefono.ToString());
            siglas[0] = new ReportParameter("siglas", fila.siglas.ToString());
        }

        ReportViewer1.LocalReport.SetParameters(nombre);
        ReportViewer1.LocalReport.SetParameters(direccion);
        ReportViewer1.LocalReport.SetParameters(telefono);
        ReportViewer1.LocalReport.SetParameters(siglas);

        ReportViewer1.LocalReport.Refresh();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ReportViewer1.LocalReport.Refresh();
    }
}
