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

public partial class copiarprogramacion : System.Web.UI.Page
{

    SessionTableAdapter sessionTA = new SessionTableAdapter();
    dsUniversidad.SessionDataTable sessionDT = new dsUniversidad.SessionDataTable();

    Session_StudentTableAdapter studentTA = new Session_StudentTableAdapter();
    dsUniversidad.Session_StudentDataTable studentDT = new dsUniversidad.Session_StudentDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            sessionTA.FillByCicloActivo(sessionDT, DropDownList4.SelectedItem.Value);
            if (sessionDT.Rows.Count.Equals(0))
            {
                sessionDT.Clear();

                sessionTA.FillByCicloActivo(sessionDT, DropDownList1.SelectedItem.Value);
                foreach (dsUniversidad.SessionRow fila in sessionDT.Rows)
                {
                    //guardando las secciones en el nuevo ciclo
                    sessionTA.Insert(fila.session_cod.ToString(), DropDownList4.SelectedItem.Value, Convert.ToInt32(fila.session_materia), Convert.ToInt32(fila.session_profesor), Convert.ToInt32(fila.capacidad), 1, Convert.ToInt32(fila.id_recinto), fila.horario, null, null);
                }

                lblmsg.Text = "Las secciones han sido copiadas";
                lblmsg.ForeColor = System.Drawing.Color.Blue;
            }
            else
            {
                lblmsg.Text = "Este ciclo ya tiene secciones";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error pasando las secciones." + ex.ToString();
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        studentTA.FillBySession(studentDT, Convert.ToInt32(GridView1.SelectedDataKey.Value));
        if (studentDT.Rows.Count.Equals(0))
        {
            //eliminando la seccion
            sessionTA.Delete(Convert.ToInt32(GridView1.SelectedDataKey.Value));
            GridView1.DataBind();
            
        }
        else
        {
            lblmsg.Text = "La sección no se puede eliminar porque algún estudiante la ha seleccionado";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}
