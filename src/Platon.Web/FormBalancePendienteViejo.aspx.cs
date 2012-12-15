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

public partial class Balance_Pendiente_Viejo : System.Web.UI.Page
{
    BalancePendienteTableAdapter balance = new BalancePendienteTableAdapter();
    CajaBalanceEstudiantesTableAdapter balanceTA = new CajaBalanceEstudiantesTableAdapter();

    String id_stud;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("FormBalancePendienteViejo.aspx?");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            
            decimal costo;

            costo = Convert.ToDecimal(txtmonto.Text);

            //recogiendo el id del estudiante del detaislview
            DetailsViewRow id_Stu = dvDatos.Rows[1];
            id_stud = id_Stu.Cells[1].Text;

            balanceTA.Insert(Convert.ToInt32(id_stud), txtconcepto.Text, DateTime.Now, true, false, "Servicio", costo, 0, 0, 0, "0", Convert.ToInt32(Session["idUsuario"]),0);
            lblmsg.Text = "La deuda ha sido generada en el sistema. Favor dirigirse al módulo de pago para saldar la cuenta";
            lblmsg.ForeColor = System.Drawing.Color.Blue;
            ImageButton2.Enabled = false;
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error generando la deuda. Intente nuevamente";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}
