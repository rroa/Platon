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

public partial class DesactivarProfesor : System.Web.UI.Page
{

    ProfesoresTableAdapter objprofesor = new ProfesoresTableAdapter();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView2.DataSourceID = ObjectDataSource2.ID;
            //GridView2.DataBind();           
        }
    }
    protected void btnBuscarProfesor_Click(object sender, ImageClickEventArgs e)
    {
        if (txtProfesor.Text == "")
        {
            GridView2.DataSourceID = ObjectDataSource2.ID;
        }
        else
        {
            try
            {

                GridView2.DataSourceID = ObjectDataSource5.ID;
            }

            catch (Exception ex)
            {
                GridView2.DataSourceID = ObjectDataSource2.ID;
            }
        }
    }
    protected void btnProfesoresDesactivar_Click(object sender, EventArgs e)
    {
        try
        {
            objprofesor.UpdateActivo(false, Convert.ToInt32(GridView2.SelectedDataKey.Value));
            GridView2.DataBind();
        }
        catch (Exception ex)
        {
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {

            objprofesor.UpdateActivo(true, Convert.ToInt32(GridView2.SelectedDataKey.Value));
            GridView2.DataBind();
        }
        catch (Exception ex)
        {
        }
    }
}
