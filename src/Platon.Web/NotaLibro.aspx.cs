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

public partial class NotaLibro : System.Web.UI.Page
{
    int inscripcionCod;
    string lblnotalit;
    string lblnotanum;
    //string lblnota;

    SessionTableAdapter sessionTA = new SessionTableAdapter();
    
    Vista_Dt_EstudianteTableAdapter estudianteTA = new Vista_Dt_EstudianteTableAdapter();
    dsUniversidad.Vista_Dt_EstudianteDataTable estudianteDT = new dsUniversidad.Vista_Dt_EstudianteDataTable();

    Session_StudentTableAdapter sessionStudentTA = new Session_StudentTableAdapter();
    dsUniversidad.Session_StudentDataTable sessionStudentDT = new dsUniversidad.Session_StudentDataTable();

    Estudiante_NotaTableAdapter notaTA = new Estudiante_NotaTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        btnConsulta.Attributes.Add("onclick", "window.open('ConsultaMatricula.aspx',null,'left=400, top=100, height=400, width= 820, status=n o, resizable= yes, scrollbars= yes, toolbar= yes,location= no, menubar= no');");
    }
    protected void btnPguardar_Click(object sender, EventArgs e)
    {
        try
        {
            //guardando la nueva seccion
            sessionTA.Insert(txtPcodigo.Text, ddlPciclo.SelectedItem.Text, Convert.ToInt32(ddlPmateria.SelectedItem.Value), 1, 50, 1, Convert.ToInt32(ddlPrecinto.SelectedItem.Value), "", null, null);
            gvSeccion.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnCrearSeccion_Click(object sender, EventArgs e)
    {
        pCrearSeccion.Visible = true;
    }
    protected void btnPcancelar_Click(object sender, EventArgs e)
    {
        pCrearSeccion.Visible = false;
    }
    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        lblidstudent.Text = "";
        txtmatricula.BackColor = System.Drawing.Color.White;
        txtmatricula.Text = "";
        lblNombre.Text = "";
        lblnota.Text = "";
        inscripcionCod = 0;
        lblnotalit = "";
        lblnotalit = "";
        btnGuardar.Enabled = true;
        txtmatricula.Focus();
    }
    protected void btnVerificar_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";

        //buscando los datos del estudiante
        try
        {
            if (txtmatricula.Text == "")
            {
                txtmatricula.BackColor = System.Drawing.Color.Pink;
            }
            else
            {
                txtmatricula.BackColor = System.Drawing.Color.White;

                estudianteTA.FillByMatricula(estudianteDT, txtmatricula.Text);
                foreach (dsUniversidad.Vista_Dt_EstudianteRow filaEst in estudianteDT.Rows)
                {
                    lblidstudent.Text = filaEst.cod_stu.ToString();
                    lblNombre.Text = filaEst.nombre.ToString() + " " + filaEst.apellido.ToString();
                }

                if (estudianteDT.Rows.Count.Equals(0))
                {
                    lblNombre.Text = "";
                    lblidstudent.Text = "";
                    lblnota.Text = "";
                }
                else
                {
                    lblnota.Focus();
                }
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        try
        {
            
            if (lblnota.Text == "")
            {
            }
            else
            {

                //validando la nota y el literal
                try
                {
                    lblnota.Text.ToUpper();

                    if (lblnota.Text == "I" || lblnota.Text == "i")
                    {
                        lblnotalit = "I";
                        lblnotanum = "0";
                    }
                    if (lblnota.Text == "R" || lblnota.Text == "r")
                    {
                        lblnotalit = "R";
                        lblnotanum = "0";
                    }
                    if (lblnota.Text == "E" || lblnota.Text == "e")
                    {
                        lblnotalit = "E";
                        lblnotanum = "0";
                    }
                    if (lblnota.Text == "V" || lblnota.Text == "v")
                    {
                        lblnotalit = "VAL";
                        lblnotanum = "0";
                    }
                    if (lblnota.Text == "VAL" || lblnota.Text == "val")
                    {
                        lblnotalit = "VAL";
                        lblnotanum = "0";
                    }
                    if (lblnota.Text == "VA" || lblnota.Text == "va")
                    {
                        lblnotalit = "VAL";
                        lblnotanum = "0";
                    }
                    if ((lblnota.Text == "CONV" || lblnota.Text == "conv"))
                    {
                        lblnotalit = "CONV";
                        lblnotanum = "0";
                    }
                    if ((lblnota.Text == "CO" || lblnota.Text == "co"))
                    {
                        lblnotalit = "CONV";
                        lblnotanum = "0";
                    }

                    if (Convert.ToInt32(lblnota.Text) < 60)
                    {
                        lblnotalit = "F";
                        lblnotanum = lblnota.Text;
                    }
                    if (Convert.ToInt32(lblnota.Text) > 59 && Convert.ToInt32(lblnota.Text) < 70)
                    {
                        lblnotalit = "D";
                        lblnotanum = lblnota.Text;
                    }
                    if (Convert.ToInt32(lblnota.Text) > 69 && Convert.ToInt32(lblnota.Text) < 80)
                    {
                        lblnotalit = "C";
                        lblnotanum = lblnota.Text;
                    }
                    if (Convert.ToInt32(lblnota.Text) > 79 && Convert.ToInt32(lblnota.Text) < 90)
                    {
                        lblnotalit = "B";
                        lblnotanum = lblnota.Text;
                    }
                    if (Convert.ToInt32(lblnota.Text) > 89 && Convert.ToInt32(lblnota.Text) < 101)
                    {
                        lblnotalit = "A";
                        lblnotanum = lblnota.Text;
                    }

                }
                catch (Exception ex)
                {

                }

                //buscando al estudiante si esta inscrito en esa seccion
                //revisar porque lo puse rapido para corregirlo
                sessionStudentTA.FillByInscripcionSession(sessionStudentDT, Convert.ToInt32(lblidstudent.Text), Convert.ToInt32(gvSeccion.SelectedDataKey.Value));
                foreach (dsUniversidad.Session_StudentRow filaSecc in sessionStudentDT.Rows)
                {
                    inscripcionCod = filaSecc.id_session_stud;
                }

                if (sessionStudentDT.Rows.Count.Equals(0))
                {
                    //inscribiendo al estudiante en caso de que no estuviera
                    inscripcionCod = Convert.ToInt32(sessionStudentTA.InsertNotaPensum(0,Convert.ToInt32(gvSeccion.SelectedDataKey.Value), DateTime.Today, false, null, null, null, null));
                }
                else
                {
                    //sacando al estudiante de esa seccion
                    //arreglar esto lo comente para que no diera error
                    //sessionStudentTA.SacarEstudiante_de_seccion(inscripcionCod);
                }

                //poniendo la nota
                notaTA.Insert(Convert.ToInt32(lblidstudent.Text), inscripcionCod, lblnotalit, Convert.ToInt32(lblnotanum),0,0,0,0,0);

                btnGuardar.Enabled = false;

                btnNuevo.Focus();
            }
        }
        catch (Exception ex)
        {
            lblnota.Text = "";

            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Es posible que este estudiante ya tenga una nota registrada. Abra la seccion de Modificar Calificaciones para verificar o arreglar la nota.";
        }
    }
    protected void ddlrecinto_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvSeccion.DataBind();
    }
    protected void ddlcarrera_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvSeccion.DataBind();
    }
    protected void ddlmateria_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvSeccion.DataBind();
    }
    protected void ddlciclo_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvSeccion.DataBind();
    }
    protected void gvSeccion_DataBinding(object sender, EventArgs e)
    {
        try
        {
            gvSeccion.SelectedIndex = 0;
        }
        catch (Exception ex)
        {
        }
    }
}
