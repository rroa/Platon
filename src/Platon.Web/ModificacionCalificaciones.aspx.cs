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

public partial class ModificacionCalificaciones : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["rol"]) == 0 || Session["rol"].ToString() == "")
        {
            Response.Redirect("denegado.aspx");
        }

        if (Convert.ToInt32(Session["rol"]) != 2)
        {
            if (Convert.ToInt32(Session["rol"]) != 1)
            {
                Response.Redirect("denegado.aspx");
            }
        }
    }
}
