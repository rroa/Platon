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

public partial class moverSeccion : System.Web.UI.Page
{
    Session_StudentTableAdapter sessionta = new Session_StudentTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
  
    protected void btnRegistrar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            for (int y = 0; y < DataList1.Items.Count; y++)
            {
                CheckBox Seleccionado = (CheckBox)DataList1.Items[y].FindControl("CheckBox1");
                Label codstudiante = (Label)DataList1.Items[y].FindControl("cod_stu");
                Label idseccionstudent = (Label)DataList1.Items[y].FindControl("id_seccion_stud");

                //si esta seleccionado hago el cambio
                if (Seleccionado.Checked)
                {
                    sessionta.CambiarSeccion(Convert.ToInt32(gvNuevaSeccion.SelectedDataKey.Value), Convert.ToInt32(idseccionstudent.Text));
                }
            }


            lblmsg.Text = "El cambio ha sido realizado";
            lblmsg.ForeColor = System.Drawing.Color.Blue;

            gvNuevaSeccion.SelectedIndex = -1;
            gvSeccion.SelectedIndex = -1;

            gvSeccion.DataBind();
            gvNuevaSeccion.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error realizando el cambio";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        lblmsg.Text = "";
        txtseccion.Text = "";
        lblmateria.Text = "0";
        btnBuscar.Enabled = true;
        btnRegistrar.Enabled = true;
    }

    protected void gvSeccion_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            lblmateria.Text = gvSeccion.SelectedRow.Cells[4].Text;

            gvNuevaSeccion.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    
}
