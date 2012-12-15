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

public partial class DesactUsuario : System.Web.UI.Page
{
    Secciones_ActivasTableAdapter objsession = new Secciones_ActivasTableAdapter();
 
    Session_StudentTableAdapter objsession_student = new Session_StudentTableAdapter();
    dsUniversidad.Session_StudentDataTable obdtsession_student = new dsUniversidad.Session_StudentDataTable();
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnUsuariosDesactivar_Click(object sender, EventArgs e)
    {
        try
        {
            //desactivando la seccion
            objsession.UpdateActivo(Convert.ToInt32(GridView3.SelectedDataKey.Value));

            //cerrando esa seccion a los estudiantes
            objsession_student.CerrarSesion(Convert.ToInt32(GridView3.SelectedDataKey.Value));

            GridView3.DataBind();
        }
        catch (Exception ex)
        { 
        }
    }
    protected void btnBuscarUsuario_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            GridView3.DataSource = ObjectDataSource3;
            GridView3.DataBind();
        }
        catch (Exception ex)
        {
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            GridView3.DataSource = ObjectDataSource1;
            GridView3.DataBind();
        }
        catch(Exception ex)
        {
        }
    }
}
