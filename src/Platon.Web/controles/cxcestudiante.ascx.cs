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

public partial class controles_cxcestudiante : System.Web.UI.UserControl
{
    //BalancePendienteTableAdapter objta = new BalancePendienteTableAdapter();
    //dsUniversidad.BalancePendienteDataTable obdt = new dsUniversidad.BalancePendienteDataTable();

    //View_PagoMatriculacionTableAdapter pagomatri = new View_PagoMatriculacionTableAdapter();
    //dsUniversidad.View_PagoMatriculacionDataTable pagomatriobdt = new dsUniversidad.View_PagoMatriculacionDataTable();
    
    //Decimal TotalServicios = 0;
    //Decimal BalancePendiente;
    //Decimal Total;
   protected void Page_Load(object sender, EventArgs e)
    {
    
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        txtmatricula.Enabled = true;
        Response.Redirect("CxCestudiante.aspx?");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["matrireport"] = txtmatricula.Text;
            Response.Redirect("ImprimirCXCestudiante.aspx");
    }
}
