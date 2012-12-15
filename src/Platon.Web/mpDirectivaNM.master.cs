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

public partial class mpDirectiva : System.Web.UI.MasterPage
{
    CentroEstudioTableAdapter centroTA = new CentroEstudioTableAdapter();
    centroestudio.CentroEstudioDataTable centroDT = new centroestudio.CentroEstudioDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //buscando el centro
            centroTA.Fill(centroDT);
            foreach (centroestudio.CentroEstudioRow cenrow in centroDT.Rows)
            {
                lblcentro.Text = cenrow.siglas.ToString();
            }

            lblFecha.Text = "Fecha actual: " + DateTime.Today.ToShortDateString();
            lblusuariowr.Text = "Usuario: " + Session["nombre_login"].ToString() + " " + Session["apellido_login"].ToString();
            //lblRecintomp.Text = "Recinto: " + Session["RecintoUsuarioNombre"].ToString();
        }
        catch (Exception ex)
        {

        }
    }
}
