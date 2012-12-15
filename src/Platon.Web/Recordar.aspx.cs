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

public partial class Recordar : System.Web.UI.Page
{
    string username;
    tblUsrDataTableAdapter usrdatata = new tblUsrDataTableAdapter();
    dsUniversidad.tblUsrDataDataTable usrdatatabla = new dsUniversidad.tblUsrDataDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
   
    protected void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            username = txtusername.Text;

            usrdatata.FillByUsuarioRecordar(usrdatatabla, username);

            foreach (dsUniversidad.tblUsrDataRow fila in usrdatatabla.Rows)
            {
                lblPregunta.Text = fila.scrt_qst.ToString();
            }

            if (usrdatatabla.Rows.Count.Equals(0))
            {
                lblmsg.Text = "NO EXISTE EL USUARIO";
            }
            else
            {
                lblmsg.Text = "";
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnVerClave_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            usrdatata.FillByRespuestaRecordar(usrdatatabla, txtusername.Text, txtrespuesta.Text);

            foreach (dsUniversidad.tblUsrDataRow filita in usrdatatabla.Rows)
            {
                lblclave.Text = filita.pass_wd.ToString();
            }

            if (usrdatatabla.Rows.Count.Equals(0))
            {
                lblmsg.Text = "RESPUESTA ERRONEA";
            }
            else
            {
                lblmsg.Text = "";
            }
        }
        catch (Exception ex)
        {
        }
    }
}
