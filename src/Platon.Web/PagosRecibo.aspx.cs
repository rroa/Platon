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

public partial class PagosRecibo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //cargando el reporte (en reporting service)
        //ReportParameter recibo = new ReportParameter();

        //recibo.Name = "recibo";
        //recibo.Values.Add(Session["IdReciboImpresion"].ToString());

        //ReportViewer1.ServerReport.SetParameters(new ReportParameter[] { recibo });

        //ReportViewer1.ServerReport.Refresh();
    }
}
