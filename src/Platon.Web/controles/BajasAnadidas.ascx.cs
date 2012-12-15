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

public partial class controles_BajasAnadidas : System.Web.UI.UserControl
{
    decimal costocredito;
    int materia;
    string sessionesact;
    decimal costoxcredito;
    string ciclo;
    decimal beca = 0;
    decimal becaresultado;
    decimal restacalculobeca;
    int idstud;
    int InscripcionID;
    int cantidadcreditos;
    decimal totalactual = 0;
    decimal totalbajar = 0;
    decimal totalfinal;
    decimal costomensual;
    DateTime fecha;

    Session_StudentTableAdapter objta = new Session_StudentTableAdapter();
    creditoTableAdapter creditota = new creditoTableAdapter();
    SessionTableAdapter objbusqueda = new SessionTableAdapter();
    BalancePorInscripcionTableAdapter balanceta = new BalancePorInscripcionTableAdapter();
    Secciones_ActivasTableAdapter seccionesta = new Secciones_ActivasTableAdapter();
    EstudianteCarreraDATATableAdapter estCarr = new EstudianteCarreraDATATableAdapter();
    Vista_Estudiante_CreditosTableAdapter estcredit = new Vista_Estudiante_CreditosTableAdapter();
    MateriaTableAdapter materiata = new MateriaTableAdapter();
    
    dsUniversidad.EstudianteCarreraDATADataTable estCarrdt = new dsUniversidad.EstudianteCarreraDATADataTable();
    dsUniversidad.Vista_Estudiante_CreditosDataTable estcreditdt = new dsUniversidad.Vista_Estudiante_CreditosDataTable();
    
    dsUniversidad.MateriaDataTable materiadt = new dsUniversidad.MateriaDataTable();
    dsUniversidad.Secciones_ActivasDataTable sessiondt = new dsUniversidad.Secciones_ActivasDataTable();
    
    Vista_Dt_EstudianteTableAdapter studentbecata = new Vista_Dt_EstudianteTableAdapter();
    dsUniversidad.Vista_Dt_EstudianteDataTable studentbecadt = new dsUniversidad.Vista_Dt_EstudianteDataTable();

    CajaBalanceEstudiantesTableAdapter CajaBalanceTA = new CajaBalanceEstudiantesTableAdapter();

    Inscripcion_EstudianteTableAdapter inscripcionTA = new Inscripcion_EstudianteTableAdapter();
    dsUniversidad.Inscripcion_EstudianteDataTable inscripcionDT = new dsUniversidad.Inscripcion_EstudianteDataTable();

    viewCajaBalanceEstudianteTableAdapter cajaTA = new viewCajaBalanceEstudianteTableAdapter();
    dsUniversidad.viewCajaBalanceEstudianteDataTable cajaDT = new dsUniversidad.viewCajaBalanceEstudianteDataTable();

    CicloTableAdapter cicloTA = new CicloTableAdapter();
    dsUniversidad.CicloDataTable cicloDT = new dsUniversidad.CicloDataTable();

    becaTableAdapter becaTA = new becaTableAdapter();
    dsUniversidad.becaDataTable becaDT = new dsUniversidad.becaDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            cicloTA.FillByActivo(cicloDT);
            foreach (dsUniversidad.CicloRow fila in cicloDT.Rows)
            {
                fecha = Convert.ToDateTime(fila.fecha_bajasanadidas);
            }

            if (fecha < DateTime.Today)
            {
                lblmensaje.Text = "LA FECHA LIMITE DE BAJAS Y AÑADIDAS DE MATERIAS YA HA PASADO.";
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            gvBuscar.EmptyDataText = "No se han encontrado los datos";

            if (RadioButtonList1.SelectedIndex == 0)
            {
                gvBuscar.DataSourceID = objBuscar_Matri.ID;
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                gvBuscar.DataSourceID = objBuscar_Apell.ID;
            }

            lblmsg.Text = "";
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Debe seleccionar el estudiante.";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void gvBuscar_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMatricula.Text = gvBuscar.SelectedRow.Cells[4].Text.ToString();
    }
    protected void btnBuscarSeccion_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            gvSessiones.DataSource = objBusquedaSession;
            gvSessiones.DataBind();

            objbusqueda.GetDataByBusquedaSession(txtBusquedaSesion.Text);
        }
        catch (Exception ex)
        {
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            gvSessiones.DataSource = objSecc_Act;
            gvSessiones.DataBind();
            txtBusquedaSesion.Text = "";
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvSessiones_SelectedIndexChanged(object sender, EventArgs e)
    {
        int x = 0;

        try
        {

            costocredito = 300;

            //buscando la inscripcion
            inscripcionTA.FillByEstudianteCiclo(inscripcionDT, Convert.ToInt32(gvBuscar.SelectedRow.Cells[1].Text), ddlciclo.SelectedItem.Value);
            foreach (dsUniversidad.Inscripcion_EstudianteRow fila in inscripcionDT.Rows)
            {
                InscripcionID = fila.id_inscripcion;
            }

            //buscando la seccion
            seccionesta.FillByIdsession(sessiondt, Convert.ToInt32(gvSessiones.SelectedDataKey.Value));
            foreach (dsUniversidad.Secciones_ActivasRow row in sessiondt.Rows)
            {
                sessionesact = row.materia;
            }

            //estCarr.FillByMatricula(estCarrdt, gvBuscar.SelectedRow.Cells[4].Text);
            //estcredit.FillByMatricula(estcreditdt, gvBuscar.SelectedRow.Cells[4].Text);
            materiata.FillByid_materia(materiadt, Convert.ToInt32(gvSessiones.SelectedRow.Cells[2].Text));
            studentbecata.FillByMatricula(studentbecadt, gvBuscar.SelectedRow.Cells[4].Text);

            //foreach (dsUniversidad.EstudianteCarreraDATARow row in estCarrdt.Rows)
            //{
            //    costocredito = row.costo_credito;
            //}

            foreach (dsUniversidad.MateriaRow row in materiadt.Rows)
            {
                materia = row.mat_credit;
            }

            //buscando si tiene beca
            becaTA.FillByEstudiante(becaDT, Convert.ToInt32(Session["id_estudiante"]));
            foreach (dsUniversidad.becaRow becafila in becaDT.Rows)
            {
                beca = becafila.beca_creditos;
            }

            //foreach (dsUniversidad.Vista_Dt_EstudianteRow filas in studentbecadt.Rows)
            //{
            //    beca = filas.beca;
            //}

            costoxcredito = Convert.ToDecimal(costocredito * materia * beca);

            restacalculobeca = (costocredito * materia);

            //costo que se va a agregar
            becaresultado = (restacalculobeca - costoxcredito);

            //seccionesta.FillByIdsession(sessiondt, Convert.ToInt32(gvSessiones.SelectedRow.Cells[3].Text));
            seccionesta.FillByIdsession(sessiondt, Convert.ToInt32(gvSessiones.SelectedDataKey.Value));

            foreach (dsUniversidad.Secciones_ActivasRow row in sessiondt.Rows)
            {
                sessionesact = row.materia;
                ciclo = row.nombre;
            }

            //buscando la inscripcion
            inscripcionTA.FillByEstudianteCiclo(inscripcionDT, Convert.ToInt32(gvBuscar.SelectedRow.Cells[1].Text), ddlciclo.SelectedItem.Value.ToString());
            foreach (dsUniversidad.Inscripcion_EstudianteRow fila in inscripcionDT.Rows)
            {
                InscripcionID = fila.id_inscripcion;
            }

            //buscando los balances de esa inscripcion
            cajaTA.FillByMatriculaCicloMeses(cajaDT, lblMatricula.Text, ciclo);
            foreach (dsUniversidad.viewCajaBalanceEstudianteRow fila in cajaDT.Rows)
            {
                x = x + 1;
                totalactual = totalactual + fila.total_por_Creditos;
                cantidadcreditos = fila.cant_creditos;
            }

            //si ya saldo todos los balances y la busqueda no trae nada, le agregamos un monto mas
            if (cajaDT.Rows.Count.Equals(0))
            {
                //agregando la materia
                idstud = Convert.ToInt32(gvBuscar.SelectedRow.Cells[1].Text);
                objta.Insert(InscripcionID, Convert.ToInt32(gvSessiones.SelectedDataKey.Value), DateTime.Today, true, false, false, null, null, null);

                //recalculando el balance
                CajaBalanceTA.Insert(idstud, "Materia añadida" + " " + Convert.ToString(gvSessiones.SelectedRow.Cells[2].Text), DateTime.Now, true, false, "Inscripcion", 0, 0, materia, becaresultado, ciclo, Convert.ToInt32(Session["idUsuario"]),InscripcionID);

                lblmsg.ForeColor = System.Drawing.Color.Blue;
                lblmsg.Text = "La materia ha sido agregada.";
                lblmsg.ForeColor = System.Drawing.Color.Blue;

            }
            else
            {
                try
                {
                    //agregando la materia
                    idstud = Convert.ToInt32(gvBuscar.SelectedRow.Cells[1].Text);
                    objta.Insert(InscripcionID, Convert.ToInt32(gvSessiones.SelectedDataKey.Value), DateTime.Today, true, false, false, null, null, null);

                    //recalculando el balance
                    //CajaBalanceTA.Insert(idstud, "Materia añadida" + " " + Convert.ToString(gvSessiones.SelectedRow.Cells[1].Text), DateTime.Now, true, false, "Inscripcion", 0, 0, materia, becaresultado, ciclo, Convert.ToInt32(Session["idUsuario"]));

                    //precio como quedó
                    totalfinal = totalactual + becaresultado;

                    //dividir el nuevo precio entre los meses activos
                    costomensual = totalfinal / x;

                    //nueva cantidad de creditos
                    int creditototal = cantidadcreditos + materia;

                    //actualizando los balances
                    cajaTA.FillByMatriculaCicloMeses(cajaDT, lblMatricula.Text, ciclo);
                    foreach (dsUniversidad.viewCajaBalanceEstudianteRow fila in cajaDT.Rows)
                    {
                        CajaBalanceTA.ModificarBalance(0, 0, creditototal, costomensual, Convert.ToInt32(fila.id_balance));
                    }

                    lblmsg.ForeColor = System.Drawing.Color.Blue;
                    lblmsg.Text = "La materia ha sido agregada.";
                    lblmsg.ForeColor = System.Drawing.Color.Blue;
                }
                catch (Exception ex)
                {

                }
            }

            GridView1.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int x = 0;
        costocredito = 300;

        try
        {
            //buscando los datos de la seccion seleccionada
            seccionesta.FillByIdsession(sessiondt, Convert.ToInt32(GridView1.SelectedRow.Cells[7].Text));
            foreach (dsUniversidad.Secciones_ActivasRow row in sessiondt.Rows)
            {
                sessionesact = row.materia;
                ciclo = row.nombre;
            }

            //buscando los datos generales del estudiante
            estCarr.FillByMatricula(estCarrdt, gvBuscar.SelectedRow.Cells[4].Text);
            //estcredit.FillByMatricula(estcreditdt, gvBuscar.SelectedRow.Cells[4].Text);
            materiata.FillByid_materia(materiadt, Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text));
            studentbecata.FillByMatricula(studentbecadt, gvBuscar.SelectedRow.Cells[4].Text);

            foreach (dsUniversidad.EstudianteCarreraDATARow row in estCarrdt.Rows)
            {
                costocredito = row.costo_credito;
            }

            foreach (dsUniversidad.MateriaRow row in materiadt.Rows)
            {
                materia = row.mat_credit;
            }

            //buscando si tiene beca
            becaTA.FillByEstudiante(becaDT, Convert.ToInt32(Session["id_estudiante"]));
            foreach (dsUniversidad.becaRow becafila in becaDT.Rows)
            {
                beca = becafila.beca_creditos;
                //becainscripcion = becafila.beca_inscripcion;
            }

            //foreach (dsUniversidad.Vista_Dt_EstudianteRow filas in studentbecadt.Rows)
            //{
            //    beca = filas.beca;
            //}

            costoxcredito = Convert.ToDecimal(costocredito * materia * beca);

            restacalculobeca = (costocredito * materia);

            //costo que se va a rebajar
            becaresultado = (restacalculobeca - costoxcredito);

            //buscando la inscripcion
            inscripcionTA.FillByEstudianteCiclo(inscripcionDT, Convert.ToInt32(gvBuscar.SelectedRow.Cells[1].Text), ddlciclo.SelectedItem.Value);
            foreach (dsUniversidad.Inscripcion_EstudianteRow fila in inscripcionDT.Rows)
            {
                InscripcionID = fila.id_inscripcion;
            }

            //buscando los balances de esa inscripcion
            cajaTA.FillByMatriculaCicloMeses(cajaDT, lblMatricula.Text, ciclo);
            foreach (dsUniversidad.viewCajaBalanceEstudianteRow fila in cajaDT.Rows)
            {
                x = x + 1;
                totalactual = totalactual + fila.total_por_Creditos;
                cantidadcreditos = fila.cant_creditos;
            }

            if (becaresultado > totalactual)
            {
                //se le aplica un credito y se le rebaja todo
                creditota.Insert(becaresultado, "Credito por baja a materia", Convert.ToInt32(gvBuscar.SelectedRow.Cells[1].Text), DateTime.Now, true, ddlciclo.SelectedItem.Value, materia);

                //dando de baja a la materia
                objta.BajaMateria(DateTime.Today, Convert.ToInt32(Session["idUsuario"]), Convert.ToInt32(GridView1.SelectedDataKey.Value));

            }
            else
            {
                //precio como quedó
                totalfinal = totalactual - becaresultado;

                //dividir el nuevo precio entre los meses activos
                costomensual = totalfinal / x;

                //dando de baja a la materia
                objta.BajaMateria(DateTime.Today, Convert.ToInt32(Session["idUsuario"]), Convert.ToInt32(GridView1.SelectedDataKey.Value));

                //nueva cantidad de creditos
                int creditototal = cantidadcreditos - materia;

                //actualizando los balances
                cajaTA.FillByMatriculaCicloMeses(cajaDT, lblMatricula.Text, ciclo);
                foreach (dsUniversidad.viewCajaBalanceEstudianteRow fila in cajaDT.Rows)
                {
                    CajaBalanceTA.ModificarBalance(0, 0, creditototal, costomensual, Convert.ToInt32(fila.id_balance));
                }
            }

            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error dando de baja";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("HojaInscripcion.aspx");
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        GridView1.SelectedIndex = -1;
    }
}
