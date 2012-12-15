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

public partial class Desactivar : System.Web.UI.Page
{
    tblUsuarioTableAdapter objusuario = new tblUsuarioTableAdapter();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
         

            GridView3.DataSourceID = ObjectDataSource3.ID;
            //GridView3.DataBind();
        }
    }
    
  
    protected void btnUsuariosDesactivar_Click(object sender, EventArgs e)
    {
        try
        {

            objusuario.UpdateUsuario(false, Convert.ToInt32(GridView3.SelectedDataKey.Value));
            GridView3.DataBind();
        }
        catch (Exception ex)
        {
        }
    }
  
   
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            objusuario.UpdateUsuario(true, Convert.ToInt32(GridView3.SelectedDataKey.Value));
            GridView3.DataBind();
        }
        catch (Exception ex)
        {
        }
    }

    protected void btnBuscarUsuario_Click(object sender, ImageClickEventArgs e)
    {
        if (txtUsuario.Text == "")
        {
            GridView3.DataSourceID = ObjectDataSource3.ID;
        }
        else
        {
            try
            {

                GridView3.DataSourceID = ObjectDataSource6.ID;
            }

            catch (Exception ex)
            {
                GridView3.DataSourceID = ObjectDataSource3.ID;
            }
        }
    }
}
