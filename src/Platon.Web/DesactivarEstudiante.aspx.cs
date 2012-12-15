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

public partial class DesactivarEstudiante : System.Web.UI.Page
{

    tblUsuarioTableAdapter objusuario = new tblUsuarioTableAdapter();
    ProfesoresTableAdapter objprofesor = new ProfesoresTableAdapter();
    Vista_Dt_EstudianteTableAdapter estudianteta = new Vista_Dt_EstudianteTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void btnEstudianteDesactivar_Click(object sender, EventArgs e)
    {
        try
        {
            estudianteta.UpdateEstudiante(false, Convert.ToInt32(GridView1.SelectedDataKey.Value));
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {

            estudianteta.UpdateEstudiante(true, Convert.ToInt32(GridView1.SelectedDataKey.Value));
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
        }
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            GridView1.SelectedIndex = 0;
        }
        catch (Exception ex)
        {
        }
    }
}
