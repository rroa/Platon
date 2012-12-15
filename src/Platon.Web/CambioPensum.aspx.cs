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

public partial class CambioPensum : System.Web.UI.Page
{

    Vista_Dt_EstudianteTableAdapter estudiante = new Vista_Dt_EstudianteTableAdapter();
    dsUniversidad.Vista_Dt_EstudianteDataTable estudianteDT = new dsUniversidad.Vista_Dt_EstudianteDataTable();

    tblReg_StudentTableAdapter regEstudiante = new tblReg_StudentTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            estudiante.FillByMatricula(estudianteDT, txtmatricula.Text);

            foreach (dsUniversidad.Vista_Dt_EstudianteRow fila in estudianteDT.Rows)
            {
                lblcarrera.Text = fila.carrera_nombre.ToString();
                lblcarreraid.Text = fila.id_carrera.ToString();
                lblpensum.Text = fila.pensum.ToString();
                lblcodstu.Text = fila.cod_stu.ToString();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnCambiar_Click(object sender, EventArgs e)
    {
        try
        {
            regEstudiante.UpdatePensum(Convert.ToInt32(GridView1.SelectedDataKey.Value), Convert.ToInt32(lblcodstu.Text));
            lblmsg.Text = "El pensum ha sido cambiado";
            lblmsg.ForeColor = System.Drawing.Color.Blue;

            lblpensum.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
            btnCambiar.Enabled = false;

        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error actualizando el pensum";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}
