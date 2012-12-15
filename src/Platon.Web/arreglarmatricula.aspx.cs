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

public partial class arreglarmatricula : System.Web.UI.Page
{

    LogIn_StudentTableAdapter loginTA = new LogIn_StudentTableAdapter();
    Matricula_EstudianteTableAdapter matriculaTA = new Matricula_EstudianteTableAdapter();

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

    protected void btnNuevo_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("arreglarmatricula.aspx");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            matriculaTA.UpdateMatricula(txtnuevamatricula.Text, txtmatricula.Text);

            loginTA.UpdateMatricula(txtnuevamatricula.Text, txtnuevamatricula.Text, "Cual es mi matricula?", txtnuevamatricula.Text, txtmatricula.Text);

            lblmsg.Text = "La matrícula ha sido cambiada";
            lblmsg.ForeColor = System.Drawing.Color.Blue;
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error cambiando la matrícula. Es posible que la misma ya esté asignada a otro estudiante";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}
