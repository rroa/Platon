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

public partial class controles_retiroMaterias : System.Web.UI.UserControl
{
    DateTime fecha;

    Estudiante_NotaTableAdapter objta = new Estudiante_NotaTableAdapter();
    Session_StudentTableAdapter sessionta = new Session_StudentTableAdapter();

    CicloTableAdapter cicloTA = new CicloTableAdapter();
    dsUniversidad.CicloDataTable cicloDT = new dsUniversidad.CicloDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            cicloTA.FillByActivo(cicloDT);
            foreach (dsUniversidad.CicloRow fila in cicloDT.Rows)
            {
                fecha = Convert.ToDateTime(fila.fecha_retiro);
            }

            if (fecha < DateTime.Today)
            {
                lblmensaje.Text = "LA FECHA LIMITE DE RETIRO DE MATERIAS YA HA PASADO.";
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
        lblmsg.Text = "";
        ddlNota.SelectedIndex = 0;
    }
    protected void btnRegistrar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            int idstud = Convert.ToInt32(dvDatos.DataKey.Value);

            objta.Insert(idstud, Convert.ToInt32(gvSecciones.SelectedDataKey.Value), ddlNota.SelectedValue,0,0,0,0,0,0);

            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "La Nota ha sido asignada";

            sessionta.RetirarMateria(DateTime.Today, Convert.ToInt32(Session["idUsuario"]), Convert.ToInt32(gvSecciones.SelectedDataKey.Value));

            btnBuscar.Enabled = false;

            gvSecciones.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error insertando los datos";
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        lblmsg.Text = "";
        ddlNota.SelectedIndex = 0;
        txtmatricula.Text = "";
        btnBuscar.Enabled = true;
        btnRegistrar.Enabled = true;
    }
}
