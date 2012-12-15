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
using System.Text;

public partial class NotaPensum : System.Web.UI.Page
{
    Vista_Dt_EstudianteTableAdapter estudianteTA = new Vista_Dt_EstudianteTableAdapter();
    dsUniversidad.Vista_Dt_EstudianteDataTable estudianteDT = new dsUniversidad.Vista_Dt_EstudianteDataTable();

    SessionTableAdapter sessionTA = new SessionTableAdapter();
    dsUniversidad.SessionDataTable sessionDT = new dsUniversidad.SessionDataTable();

    Session_StudentTableAdapter sessionStudentTA = new Session_StudentTableAdapter();
    dsUniversidad.Session_StudentDataTable sessionStudentDT = new dsUniversidad.Session_StudentDataTable();

    Estudiante_NotaTableAdapter estudianteNotaTA = new Estudiante_NotaTableAdapter();
    dsUniversidad.Estudiante_NotaDataTable estudianteNotaDT = new dsUniversidad.Estudiante_NotaDataTable();

    Inscripcion_EstudianteTableAdapter inscripcionTA = new Inscripcion_EstudianteTableAdapter();
    dsUniversidad.Inscripcion_EstudianteDataTable inscripcionDT = new dsUniversidad.Inscripcion_EstudianteDataTable();


    int id_session;
    int id_inscripcion;
    int inscripcion;
    int nuevasesion;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        lblidestudiante.Text = "";
        lblidcarrera.Text = "";
        lblrecinto.Text = "";

        try
        {   
            //buscando al estudiante y sus datos
            estudianteTA.FillByMatricula(estudianteDT, txtmatricula.Text);

            foreach (dsUniversidad.Vista_Dt_EstudianteRow filaestudiante in estudianteDT.Rows)
            {
                lblidcarrera.Text = filaestudiante.id_carrera.ToString();
                lblidestudiante.Text = filaestudiante.cod_stu.ToString();
                lblrecinto.Text = filaestudiante.id_recinto.ToString();
            }
        }
        catch (Exception ex)
        {
            lblidestudiante.Text = "";
            lblidcarrera.Text = "";
            lblrecinto.Text = "";
        }
    }
    protected void gvPensum_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //clic en el boton guardar del gridview
        if (e.CommandName == "guardar")
        {
            //limpiando todo
            lblidmateria.Text = "";
            lblciclo.Text = "";
            lblnota.Text = "";
            lblnotalit.Text = "";
            lblnotanum.Text = "";
            lblidsession.Text = "";
            lblmatcod.Text = "";

            //tomo el indice de la fila donde esta ese boton
            int index = Convert.ToInt32(e.CommandArgument);

            //busco la fila completa con ese indice
            GridViewRow row = gvPensum.Rows[index];

            //Creamos una lista con los valores de la fila     
            ListItem item = new ListItem();
            item.Text = Server.HtmlDecode(row.Cells[0].Text);

            //tomamos el ciclo, la nota y la materia
            DropDownList ciclogv = (DropDownList)row.FindControl("ddlciclo");
            TextBox notagv = (TextBox)row.FindControl("txtnota");
            Label materia = (Label)row.FindControl("Label1");

            lblidmateria.Text = item.Text;
            lblciclo.Text = ciclogv.SelectedItem.Text;
            lblnota.Text = notagv.Text;
            lblmatcod.Text = materia.Text;

            //validando la nota y el literal
            try
            {
                lblnota.Text.ToUpper();

                if (lblnota.Text == "I" || lblnota.Text == "i")
                {
                    lblnotalit.Text = "I";
                    lblnotanum.Text = "0";
                }
                if (lblnota.Text == "R" || lblnota.Text == "r")
                {
                    lblnotalit.Text = "R";
                    lblnotanum.Text = "0";
                }
                if (lblnota.Text == "E" || lblnota.Text == "e")
                {
                    lblnotalit.Text = "E";
                    lblnotanum.Text = "0";
                }
                if (lblnota.Text == "V" || lblnota.Text == "v")
                {
                    lblnotalit.Text = "VAL";
                    lblnotanum.Text = "0";
                }
                if (lblnota.Text == "VAL" || lblnota.Text == "val")
                {
                    lblnotalit.Text = "VAL";
                    lblnotanum.Text = "0";
                }
                if (lblnota.Text == "VA" || lblnota.Text == "va")
                {
                    lblnotalit.Text = "VAL";
                    lblnotanum.Text = "0";
                }
                if ((lblnota.Text == "CONV" || lblnota.Text == "conv"))
                {
                    lblnotalit.Text = "CONV";
                    lblnotanum.Text = "0";
                }
                if ((lblnota.Text == "CO" || lblnota.Text == "co"))
                {
                    lblnotalit.Text = "CONV";
                    lblnotanum.Text = "0";
                }
                if (Convert.ToInt32(lblnota.Text) < 60)
                {
                    lblnotalit.Text = "F";
                    lblnotanum.Text = lblnota.Text;
                }
                if (Convert.ToInt32(lblnota.Text) > 59 && Convert.ToInt32(lblnota.Text) < 70)
                {
                    lblnotalit.Text = "D";
                    lblnotanum.Text = lblnota.Text;
                }
                if (Convert.ToInt32(lblnota.Text) > 69 && Convert.ToInt32(lblnota.Text) < 80)
                {
                    lblnotalit.Text = "C";
                    lblnotanum.Text = lblnota.Text;
                }
                if (Convert.ToInt32(lblnota.Text) > 79 && Convert.ToInt32(lblnota.Text) < 90)
                {
                    lblnotalit.Text = "B";
                    lblnotanum.Text = lblnota.Text;
                }
                if (Convert.ToInt32(lblnota.Text) > 89 && Convert.ToInt32(lblnota.Text) < 101)
                {
                    lblnotalit.Text = "A";
                    lblnotanum.Text = lblnota.Text;
                }
            }
            catch (Exception ex)
            {
                
            }

            //buscando el id de la seccion con ese ciclo y esa materia en ese recinto
            try
            {
                sessionTA.FillByNotaPensum(sessionDT, lblciclo.Text, Convert.ToInt32(lblidmateria.Text), Convert.ToInt32(lblrecinto.Text));

                foreach (dsUniversidad.SessionRow sessionfila in sessionDT.Rows)
                {
                    lblidsession.Text = sessionfila.id_session.ToString();
                }

                //si no aparece la seccion crea la seccion, de lo contrario haz la inscripcion
                if (lblidsession.Text == "")
                {
                    //creando la seccion
                    nuevasesion = Convert.ToInt32(sessionTA.InsertSession(lblmatcod.Text + "-01", lblciclo.Text, Convert.ToInt32(lblidmateria.Text), 1, 40, 1, 1, "", null, null));

                    lblidsession.Text = nuevasesion.ToString();

                }

                //buscar si el estudiante tiene inscripcion en ese ciclo
                inscripcionTA.FillByEstudianteCiclo(inscripcionDT, Convert.ToInt32(lblidestudiante.Text), lblciclo.Text);
                foreach (dsUniversidad.Inscripcion_EstudianteRow filrow in inscripcionDT.Rows)
                {
                    inscripcion = filrow.id_inscripcion;
                }
                //si no tenia inscripcion, creamos una
                if (inscripcionDT.Rows.Count.Equals(0))
                {
                    //guardando la inscripcion del estudiante
                    inscripcion = Convert.ToInt32(inscripcionTA.InsertInscripcion(Convert.ToInt32(lblidestudiante.Text), lblciclo.Text, DateTime.Today, 1020, false));
                }

                //guardando la seccion al estudiante
                id_inscripcion = Convert.ToInt32(sessionStudentTA.InsertNotaPensum(inscripcion, Convert.ToInt32(lblidsession.Text), DateTime.Today, false, null, null, null, null));

                //guardando la nota
                estudianteNotaTA.Insert(Convert.ToInt32(lblidestudiante.Text), id_inscripcion, lblnotalit.Text, Convert.ToInt32(lblnotanum.Text),0,0,0,0,0);
            }
            catch (Exception ex)
            {
                lblidmateria.Text = "";
                lblciclo.Text = "";
                lblnota.Text = "";
                lblnotalit.Text = "";
                lblnotanum.Text = "";
                lblidsession.Text = "";

                string strMessage = "Ha ocurrido un error registrando la nota, es posible que la sección no exista o la nota ya esté registrada";
                StringBuilder sb = new StringBuilder("");
                sb.Append("<script language='javascript'>");
                sb.AppendFormat("alert(\"{0}\");", strMessage);
                sb.Append("</script>");
                Page.RegisterClientScriptBlock("AlertScript", sb.ToString());
            } 
            
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Session["matriculaprint"] = txtmatricula.Text;
        Response.Redirect("NotaPensumPrint.aspx");
    }
}
