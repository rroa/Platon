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
using System.Data.SqlClient;

public partial class controles_insertUsuario : System.Web.UI.UserControl
{
    dsUniversidadTableAdapters.tblUsrDataTableAdapter usrdataTA = new dsUniversidadTableAdapters.tblUsrDataTableAdapter();

    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings.Get("dbRegClassConnStr"));
    SqlCommand objCmd;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
   void Limpiar()
    {
        txtapellido.Text = "";
        txtcedula.Text = "";
        txtclave.Text = "";
        txtdireccion.Text = "";
        txtlugarnacimiento.Text = "";
        txtnombre.Text = "";
        txtpregunta.Text = "";
        txtrespuesta.Text = "";
        txttelefono.Text = "";
        txtusername.Text = "";
        fnac_ano.Text = "";
        fnac_dia.Text = "";
        fnac_mes.Text = "";
        lblmsg.Text = "";
    }

    protected void btnGuardar_Click(object sender, ImageClickEventArgs e)
    {
        if (txtnombre.Text == "" || txtapellido.Text == "" || txtcedula.Text == "" || txttelefono.Text == "" || txtusername.Text == "" || txtclave.Text == "")
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Debe llenar todos los campos que estan en negrita.";
        }
        else
        {

            int usrid;

            string fechanac = (fnac_mes.Text + '/' + fnac_dia.Text + '/' + fnac_ano.Text);

            try
            {
                objCmd = new SqlCommand("insert_tblUsuario", conn);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@f_ingreso_1", DateTime.Today);
                objCmd.Parameters.AddWithValue("@nombre_2", txtnombre.Text);
                objCmd.Parameters.AddWithValue("@apellido_3", txtapellido.Text);
                objCmd.Parameters.AddWithValue("@cedula_4", txtcedula.Text);
                objCmd.Parameters.AddWithValue("@sexo_5", rblsexo.SelectedValue);
                objCmd.Parameters.AddWithValue("@telefono_6", txttelefono.Text);
                objCmd.Parameters.AddWithValue("@direccion_7", txtdireccion.Text);
                objCmd.Parameters.AddWithValue("@lugar_nacimiento_8", txtlugarnacimiento.Text);
                objCmd.Parameters.AddWithValue("@fecha_nacimiento_9", fechanac);
                objCmd.Parameters.AddWithValue("@estado_civil_10", ddlestadocivil.SelectedValue);
                objCmd.Parameters.AddWithValue("@rol_11", ddlrol.SelectedValue);
                objCmd.Parameters.AddWithValue("@activo", true);

                SqlParameter par = new SqlParameter("@codigo", SqlDbType.Int, 4);
                par.Direction = ParameterDirection.Output;
                objCmd.Parameters.Add(par);

                conn.Open();

                objCmd.ExecuteNonQuery();
                usrid = (int)objCmd.Parameters["@codigo"].Value;


                usrdataTA.Insert(usrid, txtusername.Text, txtclave.Text, txtpregunta.Text, txtrespuesta.Text);

                conn.Close();

                lblmsg.ForeColor = System.Drawing.Color.Blue;
                lblmsg.Text = "Los datos han sido insertados con exito";

                txtapellido.Enabled = false;
                txtcedula.Enabled = false;
                txtclave.Enabled = false;
                txtdireccion.Enabled = false;
                txtlugarnacimiento.Enabled = false;
                txtnombre.Enabled = false;
                txtpregunta.Enabled = false;
                txtrespuesta.Enabled = false;
                txttelefono.Enabled = false;
                txtusername.Enabled = false;
                rblsexo.Enabled = false;
                ddlestadocivil.Enabled = false;
                ddlrol.Enabled = false;
                fnac_ano.Enabled = false;
                fnac_dia.Enabled = false;
                fnac_mes.Enabled = false;
            }
            catch (Exception ex)
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Ha ocurrido un error insertando los datos";
            }
        }
    }
    protected void btnCancelar_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("insertUsuario.aspx?");
    }
}
