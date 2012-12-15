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
using centroestudioTableAdapters;

public partial class RecordNotas : System.Web.UI.Page
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        ReportViewer1.LocalReport.Refresh();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            TextBox1.Text = Session["copiarmatricula"].ToString();
        }
        catch (Exception ex)
        {

        }
    }
}
