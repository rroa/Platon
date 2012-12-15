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

public partial class controles_mantUsusario : System.Web.UI.UserControl
{
    tblUsuarioTableAdapter objusr = new tblUsuarioTableAdapter();
    tblUsrDataTableAdapter objusrdata = new tblUsrDataTableAdapter();
    dsUniversidad.tblUsrDataDataTable usrdataDT = new dsUniversidad.tblUsrDataDataTable();
    int codusr;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Panel1.Visible = true;
            lblmsg.Text = "";

            dsUniversidad.tblUsuarioDataTable objdt = new dsUniversidad.tblUsuarioDataTable();
            objusr.FillById(objdt, Convert.ToInt32(GridView1.SelectedDataKey.Value));

            foreach (dsUniversidad.tblUsuarioRow Row in objdt.Rows)
            {
                codusr = Convert.ToInt32(Row.id_user.ToString());
                txtnombre.Text = Row.nombre.ToString();
                txtapellido.Text = Row.apellido.ToString();
                txtcedula.Text = Row.cedula.ToString();
                txtdireccion.Text = Row.direccion.ToString();
                txtfecha.Text = Row.fecha_nacimiento.ToShortDateString();
                txtlugar.Text = Row.lugar_nacimiento.ToString();
                txttelefono.Text = Row.telefono.ToString();
                rblsexo.SelectedValue = Row.sexo.ToString();
                ddlestado.SelectedValue = Row.estado_civil.ToString();
                ddlrol.SelectedValue = Row.rol.ToString();
            }

            objusrdata.FillByIdUser(usrdataDT, Convert.ToInt32(GridView1.SelectedDataKey.Value));
            foreach (dsUniversidad.tblUsrDataRow fila in usrdataDT.Rows)
            {
                Label1.Text = fila.usr_name.ToString();
            }
        }
        catch (Exception ex)
        {

        }
    }

    protected void btnGuardar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            objusr.Update(txtnombre.Text, txtapellido.Text, txtcedula.Text, rblsexo.SelectedValue, txttelefono.Text, txtdireccion.Text, txtlugar.Text, Convert.ToDateTime(txtfecha.Text), ddlestado.SelectedValue, Convert.ToInt32(ddlrol.SelectedValue), Convert.ToInt32(GridView1.SelectedDataKey.Value));
            GridView1.DataBind();
            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "Los datos han sido actualizados";

        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error actualizando los datos";
        }
    }
}
