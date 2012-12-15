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

public partial class eliminarnota : System.Web.UI.Page
{
    Estudiante_NotaTableAdapter notata = new Estudiante_NotaTableAdapter();
    dsUniversidad.Estudiante_NotaDataTable notaDT = new dsUniversidad.Estudiante_NotaDataTable();

    view_Notas_EstudiantesTableAdapter viewnotaTA = new view_Notas_EstudiantesTableAdapter();
    dsUniversidad.view_Notas_EstudiantesDataTable viewnotaDT = new dsUniversidad.view_Notas_EstudiantesDataTable();

    Session_StudentTableAdapter sessionTA = new Session_StudentTableAdapter();
    dsUniversidad.Session_StudentDataTable sessionDT = new dsUniversidad.Session_StudentDataTable();

    dsEliminadasTableAdapters.Eliminada_Estudiante_NotaTableAdapter eliminadaNotaTA = new dsEliminadasTableAdapters.Eliminada_Estudiante_NotaTableAdapter();
    dsEliminadasTableAdapters.Eliminada_Session_StudentTableAdapter eliminadaSeccionTA = new dsEliminadasTableAdapters.Eliminada_Session_StudentTableAdapter();


    int IdNota;
    int estudiante;
    int session;
    string nota;
    int notanum;
    decimal primerparcialEE;
    decimal primerparcialPR;
    decimal segundoparcialEE;
    decimal segundoparcialPR;
    decimal examenfinal;


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            lblmsg.Text = "";
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnRegistrar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {

            viewnotaTA.FillByIdNota(viewnotaDT, Convert.ToInt32(gvSecciones.SelectedDataKey.Value));
            foreach (dsUniversidad.view_Notas_EstudiantesRow fila in viewnotaDT.Rows)
            {
                IdNota = fila.id_session_nota;
                estudiante = fila.cod_stu;
                nota = fila.nota;
                notanum = fila.nota_num;
                primerparcialEE = fila.PrimerParcialEE;
                primerparcialPR = fila.PrimerParcialPR;
                segundoparcialEE = fila.SegundoParcialEE;
                segundoparcialPR = fila.SegundoParcialPR;
                examenfinal = fila.ExamenFinal;
            }

            //guardando en el log de las notas
            eliminadaNotaTA.Insert(estudiante, IdNota, nota, notanum, primerparcialEE, primerparcialPR, segundoparcialEE, segundoparcialPR, examenfinal, Convert.ToInt32(Session["idUsuario"]), DateTime.Now);

            //borrando la nota
            notata.Delete(Convert.ToInt32(gvSecciones.SelectedDataKey.Value));

            //guardando en el log de la seccion
            sessionTA.FillById_Session_Stud(sessionDT, IdNota);
            foreach (dsUniversidad.Session_StudentRow filas in sessionDT.Rows)
            {
                eliminadaSeccionTA.Insert(IdNota,filas.inscripcion_id, filas.session_id, filas.f_inscripcion, filas.esta, null, null, null, null, null, Convert.ToInt32(Session["idUsuario"]), DateTime.Now);
            }

            //borrando la seccion
            sessionTA.Delete(IdNota);


            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "La materia ha sido eliminada.";
            gvSecciones.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error eliminando la materia.";
            gvSecciones.DataBind();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("eliminarmateria.aspx");
    }
}
