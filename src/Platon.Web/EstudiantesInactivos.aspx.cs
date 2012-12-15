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
using Microsoft.Reporting.WebForms;
using dsUniversidadTableAdapters;

public partial class EstudiantesInactivos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        ReportParameter[] ciclo = new ReportParameter[1];
        ciclo[0] = new ReportParameter("ciclo", DropDownList1.SelectedItem.Value);
        ReportViewer1.LocalReport.SetParameters(ciclo);

        ReportViewer1.LocalReport.Refresh();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ReportViewer1.LocalReport.Refresh();
    }
}
