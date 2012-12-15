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

public partial class cambiarclave : System.Web.UI.Page
{
    tblUsrDataTableAdapter usrta = new tblUsrDataTableAdapter();
    dsUniversidad.tblUsrDataDataTable usrdt = new dsUniversidad.tblUsrDataDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            usrta.FillByIdUser(usrdt, Convert.ToInt32(Session["idUsuario"]));
            foreach (dsUniversidad.tblUsrDataRow fila in usrdt.Rows)
            {
                txtpregunta.Text = fila.scrt_qst.ToString();
                txtrespuesta.Text = fila.scrt_ans.ToString();
                Session["remclave"] = fila.pass_wd.ToString();
            }

        }
        catch (Exception ex)
        {

        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (txtrespuesta.Text == "" || txtpregunta.Text == "" || txtnuevaclave.Text == "")
        {
            lblmsg.Text = "Debe llenar todos los campos";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            try
            {
                if (Session["remclave"].ToString() == txtclaveant.Text)
                {
                    usrta.UpdateDataClave(txtnuevaclave.Text, txtpregunta.Text, txtrespuesta.Text, Convert.ToInt32(Session["idUsuario"]));
                    Session["remclave"] = "";
                    lblmsg.Text = "La clave ha sido modificada";
                    lblmsg.ForeColor = System.Drawing.Color.Blue;
                    ImageButton1.Enabled = false;

                }
                else
                {
                    lblmsg.Text = "La clave anterior no es la correcta";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch(Exception ex)
            {

            }
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("InicioStart.aspx");
    }
}
