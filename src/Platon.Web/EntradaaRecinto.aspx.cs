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

public partial class EntradaaRecinto : System.Web.UI.Page
{
    RecintoUsuarioTableAdapter recintousuarioTA = new RecintoUsuarioTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ddlRecinto_DataBound(object sender, EventArgs e)
    {
        ddlRecinto.Items.Insert(0, "--Recinto--");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        recintousuarioTA.Insert(Convert.ToInt32(ddlRecinto.SelectedItem.Value), Convert.ToInt32(GridView1.SelectedDataKey.Value));
    }
}
