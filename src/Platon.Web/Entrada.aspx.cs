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

public partial class Entrada : System.Web.UI.Page
{
    UserALLTableAdapter objta = new UserALLTableAdapter();
    dsUniversidad.UserALLDataTable tabla = new dsUniversidad.UserALLDataTable();
    LogLoginTableAdapter logTA = new LogLoginTableAdapter();

    int IdUser;

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        Session.Clear();
        txtnomusuar.Focus();
    }
   
   
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            objta.FillByUsrClave(tabla, txtnomusuar.Text, txtpasscla.Text);

            foreach (dsUniversidad.UserALLRow fila in tabla.Rows)
            {
                IdUser = fila.id_usuario;
                Session["rol"] = fila.rol;
                Session["nombre_login"] = fila.nombre.ToString();
                Session["apellido_login"] = fila.apellido.ToString();
                Session["idUsuario"] = fila.id_usuario;
                //Session["RecintoUsuario"] = Convert.ToInt32(DropDownList1.SelectedItem.Value);
                //Session["RecintoUsuarioNombre"] = DropDownList1.SelectedItem.Text;
            }
            //DropDownList1.DataBind();
            if (tabla.Rows.Count == 0)
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Usuario / clave incorrectos o el usuario ha sido desactivado";
            }
            else
            {
                logTA.Insert(IdUser, Session["nombre_login"].ToString(), DateTime.Now, 1 );
                Response.Redirect("InicioStart.aspx");
            }
        }
        catch (Exception ex)
        {
        }
       
    }
}
