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
using dsEliminadasTableAdapters;
using System.Text;

public partial class eliminarinscripcion : System.Web.UI.Page
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

    CajaBalanceEstudiantesTableAdapter cajaTA = new CajaBalanceEstudiantesTableAdapter();
    dsUniversidad.CajaBalanceEstudiantesDataTable cajaDT = new dsUniversidad.CajaBalanceEstudiantesDataTable();

    CajaPagoEstudiantesTableAdapter pagoTA = new CajaPagoEstudiantesTableAdapter();
    dsUniversidad.CajaPagoEstudiantesDataTable pagoDT = new dsUniversidad.CajaPagoEstudiantesDataTable();

    Eliminada_CajaPagoEstudiantesTableAdapter eliminadapagoTA = new Eliminada_CajaPagoEstudiantesTableAdapter();
    Eliminada_CajaBalanceEstudiantesTableAdapter eliminadabalanceTA = new Eliminada_CajaBalanceEstudiantesTableAdapter();
    Eliminada_Inscripcion_EstudianteTableAdapter eliminadainscripcionTA = new Eliminada_Inscripcion_EstudianteTableAdapter();
    Eliminada_Session_StudentTableAdapter eliminadasessionTA = new Eliminada_Session_StudentTableAdapter();
    Eliminada_Estudiante_NotaTableAdapter eliminadanotaTA = new Eliminada_Estudiante_NotaTableAdapter();

    //tablas log
    

    int inscripcionID;
    int BalanceID;
    int PagoID;
    int SessionStudentID;
    int NotaID;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        lblidestudiante.Text = "";

        try
        {
            //buscando al estudiante y sus datos
            estudianteTA.FillByMatricula(estudianteDT, txtmatricula.Text);

            foreach (dsUniversidad.Vista_Dt_EstudianteRow filaestudiante in estudianteDT.Rows)
            {
                lblidestudiante.Text = filaestudiante.cod_stu.ToString();
            }
        }
        catch (Exception ex)
        {
            lblidestudiante.Text = "";
        }
    }

    protected void btnInscripcion_Click(object sender, EventArgs e)
    {
        try
        {
            //asignando la inscripcion
            inscripcionID = Convert.ToInt32(gvInscripcion.SelectedDataKey.Value);

            //buscando los balances
            cajaTA.FillByInscripcion(cajaDT, inscripcionID);
            foreach (dsUniversidad.CajaBalanceEstudiantesRow cajarow in cajaDT.Rows)
            {
                BalanceID = cajarow.id_balance;

                //viendo si ese balance tiene un pago
                pagoTA.FillByBalance(pagoDT, BalanceID);
                foreach (dsUniversidad.CajaPagoEstudiantesRow pagorow in pagoDT.Rows)
                {
                    PagoID = pagorow.id_pago;
                    //guardando el pago en la tabla log
                    eliminadapagoTA.Insert(pagorow.id_pago, pagorow.no_recibo, pagorow.id_balance, pagorow.id_student, pagorow.fecha, pagorow.monto, pagorow.ciclo, pagorow.usuario, pagorow.formapago, pagorow.activo, Convert.ToInt32(Session["idUsuario"]), DateTime.Now);

                    //eliminando el pago
                    pagoTA.Delete(PagoID);
                }

                //guardando el balance en la tabla log
                eliminadabalanceTA.Insert(cajarow.id_balance, cajarow.id_student, cajarow.concepto, cajarow.fecha, cajarow.activo, cajarow.acuerdopago, cajarow.tipo, cajarow.monto, cajarow.inscripcion, cajarow.cant_creditos, cajarow.total_por_Creditos, cajarow.ciclo, cajarow.usuario, cajarow.id_inscripcion, Convert.ToInt32(Session["idUsuario"]), DateTime.Now);


                //eliminando ese balance
                cajaTA.Delete(BalanceID);
            }

            //buscando las materias tomadas
            sessionStudentTA.FillByInscripcion(sessionStudentDT, inscripcionID);
            foreach (dsUniversidad.Session_StudentRow sessrow in sessionStudentDT.Rows)
            {
                SessionStudentID = sessrow.id_session_stud;

                estudianteNotaTA.FillBySession(estudianteNotaDT, SessionStudentID);
                foreach (dsUniversidad.Estudiante_NotaRow notarow in estudianteNotaDT.Rows)
                {
                    NotaID = notarow.id_nota;

                    //guardando la nota en la tabla log
                    eliminadanotaTA.Insert(notarow.id_student, notarow.id_session, notarow.nota, notarow.nota_num, notarow.PrimerParcialEE, notarow.PrimerParcialPR, notarow.SegundoParcialEE, notarow.SegundoParcialPR, notarow.ExamenFinal, Convert.ToInt32(Session["idUsuario"]), DateTime.Now);

                    //borrando la nota
                    estudianteNotaTA.Delete(NotaID);
                }

                //guardando la materia en el log
                eliminadasessionTA.Insert(sessrow.id_session_stud, sessrow.inscripcion_id, sessrow.session_id, sessrow.f_inscripcion, sessrow.esta, null, null, null, null, null, Convert.ToInt32(Session["idUsuario"]), DateTime.Now);

                //borrando la materia
                sessionStudentTA.Delete(SessionStudentID);
            }


            //eliminar inscripcion

            //guardar la inscripcion en el log
            eliminadainscripcionTA.Insert(Convert.ToInt32(lblidestudiante.Text), gvInscripcion.SelectedRow.Cells[2].Text, Convert.ToDateTime(gvInscripcion.SelectedRow.Cells[3].Text), Convert.ToInt32(gvInscripcion.SelectedRow.Cells[4].Text), true, Convert.ToInt32(Session["idUsuario"]), DateTime.Now);

            //borrando la inscripcion
            inscripcionTA.Delete(inscripcionID);
        }
        catch (Exception ex)
        {

        }
    }
}
