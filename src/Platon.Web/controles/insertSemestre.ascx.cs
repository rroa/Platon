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

public partial class controles_insertSemestre : System.Web.UI.UserControl
{
    SemestreTableAdapter objta = new SemestreTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInsertar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            objta.Insert(txtperiodo.Text);
            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "Los datos han sido insertados correctamente";

            txtperiodo.Text = "";
            gvPeriodo.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error insertando los datos";
        }
    }
}
