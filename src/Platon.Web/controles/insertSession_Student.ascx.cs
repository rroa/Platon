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

public partial class controles_insertSession_Student : System.Web.UI.UserControl
{
    decimal costocredito;
    string matricula;
    string sessionciclo;
    string sessioncod;
    string materia;
    string profesor;
    string esta;
    string sessionesact;
    Decimal beca = 0;
    Decimal becainscripcion = 0;
    Decimal calculobeca;
    Decimal restacalculobeca;
    int creditsmat;
    int ciclo;
    string cred;
    string inscripcion;
    string total;
    string inscritos;
    string capacidad;
    string mat_desc;
    string cupo_lleno;
    DataSet objDS = new DataSet();
    DataTable objDT;
    DataColumn objDC;
    DataRow objDR;
    public DataColumn colum;
    public DataRow rows;
    int inscritosNo;
    decimal acreditar;
    decimal hacercredito;
    decimal idcredito;
    Decimal CargosApagar;
    bool preseleccionactivo;
    int cod_Seccion;
    DateTime fecha;

    string horario;
    string fechainicio;
    string fechafin;

    int InscripcionId;

    decimal preciocarnet;
    string motivo;
    

    BalancePorInscripcionTableAdapter balanceInsc = new BalancePorInscripcionTableAdapter();

    Secciones_ActivasTableAdapter seccionesactivas = new Secciones_ActivasTableAdapter();
    dsUniversidad.Secciones_ActivasDataTable seccionesactivasdt = new dsUniversidad.Secciones_ActivasDataTable();

    Estudiantes_ForSearchTableAdapter estudianteforsearchta = new Estudiantes_ForSearchTableAdapter();
    dsUniversidad.Estudiantes_ForSearchDataTable estudianteforsearchdt = new dsUniversidad.Estudiantes_ForSearchDataTable();

    Preseleccion_studentTableAdapter preselectTA = new Preseleccion_studentTableAdapter();
    dsUniversidad.Preseleccion_studentDataTable preseleccionDT = new dsUniversidad.Preseleccion_studentDataTable();

    Session_StudentTableAdapter objta = new Session_StudentTableAdapter();
    dsUniversidad.Session_StudentDataTable obdtstudent = new dsUniversidad.Session_StudentDataTable();
    SessionTableAdapter objbusqueda = new SessionTableAdapter();

    EstudianteCarreraDATATableAdapter estCarr = new EstudianteCarreraDATATableAdapter();
    Vista_Estudiante_CreditosTableAdapter estcredit = new Vista_Estudiante_CreditosTableAdapter();

    dsUniversidad.EstudianteCarreraDATADataTable estCarrdt = new dsUniversidad.EstudianteCarreraDATADataTable();
    dsUniversidad.Vista_Estudiante_CreditosDataTable estcreditdt = new dsUniversidad.Vista_Estudiante_CreditosDataTable();

    Suma_de_CreditosTableAdapter suma = new Suma_de_CreditosTableAdapter();
    dsUniversidad.Suma_de_CreditosDataTable sumadt = new dsUniversidad.Suma_de_CreditosDataTable();

    Vista_Dt_EstudianteTableAdapter studentbecata = new Vista_Dt_EstudianteTableAdapter();
    dsUniversidad.Vista_Dt_EstudianteDataTable studentbecadt = new dsUniversidad.Vista_Dt_EstudianteDataTable();

    tblReg_StudentTableAdapter regstudenta = new tblReg_StudentTableAdapter();
    dsUniversidad.tblReg_StudentDataTable regstudendt = new dsUniversidad.tblReg_StudentDataTable();

    ServiciosTableAdapter serviciosTA = new ServiciosTableAdapter();
    dsUniversidad.ServiciosDataTable serviciosDT = new dsUniversidad.ServiciosDataTable();

    //creditoTableAdapter acreditarta = new creditoTableAdapter();
    //dsUniversidad.creditoDataTable obdtacreditar = new dsUniversidad.creditoDataTable();

    CargosAPagarTableAdapter CargosApagarta = new CargosAPagarTableAdapter();
    dsUniversidad.CargosAPagarDataTable CargosApagardt = new dsUniversidad.CargosAPagarDataTable();

    CajaBalanceEstudiantesTableAdapter balanceTA = new CajaBalanceEstudiantesTableAdapter();

    Inscripcion_EstudianteTableAdapter inscripcionTA = new Inscripcion_EstudianteTableAdapter();
    dsUniversidad.Inscripcion_EstudianteDataTable inscripcionDT = new dsUniversidad.Inscripcion_EstudianteDataTable();

    CicloTableAdapter cicloTA = new CicloTableAdapter();
    dsUniversidad.CicloDataTable cicloDT = new dsUniversidad.CicloDataTable();

    becaTableAdapter becaTA = new becaTableAdapter();
    dsUniversidad.becaDataTable becaDT = new dsUniversidad.becaDataTable();

    ExtraCreditoTableAdapter ExtraCredTA = new ExtraCreditoTableAdapter();
    dsUniversidad.ExtraCreditoDataTable ExtraCredDT = new dsUniversidad.ExtraCreditoDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            cicloTA.FillByActivo(cicloDT);
            foreach (dsUniversidad.CicloRow fila in cicloDT.Rows)
            {
                fecha = Convert.ToDateTime(fila.fecha_inscripcion);
            }

            if (fecha < DateTime.Today)
            {
                lblmensaje.Text = "LA FECHA LIMITE DE INSCRIPCION DE MATERIAS YA HA PASADO.";
            }
        }
        catch (Exception ex)
        {
        }

        //CREANDO UN DATATABLE Y CARGANDOLE UN DATASET
        //PARA ENTRAR TODOS LOS DATOS EN MEMORIA Y CARGAR EL GVPRODUCTO

        if (!IsPostBack)
        {
            Session["Seleccion"] = null;
            Session["CreditoAcumulado"] = 0;
        }

        objDT = (DataTable)Session["Seleccion"];
        if (objDT == null)
        {
            objDT = new DataTable("Seleccion");
            objDC = new DataColumn("orden", Type.GetType("System.String"));
            objDC.AutoIncrement = true;
            objDC.AutoIncrementSeed = 1;
            objDC.AutoIncrementStep = 1;
            objDC.Unique = true;
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("session_id", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("session_cod", Type.GetType("System.String"));
            objDC.Unique = true;
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("ciclo", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("materia", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("creditos", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("profesor", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("inscritos", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("horario", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("fechainicio", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("fechafin", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            Session["Seleccion"] = objDT;
                        
        }
        else
        {

        }
    }

    public void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
       
            try
            {
                
                Session["id_estudiante"] = null;

                dsUniversidad.Vista_Dt_EstudianteDataTable tabladata = new dsUniversidad.Vista_Dt_EstudianteDataTable();

                studentbecata.FillByFaltaDatosMatricula(tabladata, txtbuscar.Text);
                if (tabladata.Rows.Count.Equals(0))
                {
                    lblfaltadatos.Text = "";
                }
                else
                {
                    lblfaltadatos.Text = "A ESTE ESTUDIANTE LE FALTAN REQUISITOS ACADEMICOS. PARA MAS INFORMACION IR A - ADMISIONES/EDITAR DATOS -";
                }

                estudianteforsearchta.FillByMatricula(estudianteforsearchdt, txtbuscar.Text);

                foreach (dsUniversidad.Estudiantes_ForSearchRow fila in estudianteforsearchdt.Rows)
                {
                    matricula = fila.matricula.ToString();
                    Session["id_estudiante"] = fila.cod_stu;
                }

                if (estudianteforsearchdt.Rows.Count.Equals(0))
                {
                    lblEstudianteNo.Visible = true;
                }
                else
                {
                    lblEstudianteNo.Visible = false;
                }


               
            }
            catch (Exception ex)
            {

            }
        
        
    }
    protected void btnBuscarSeccion_Click(object sender, ImageClickEventArgs e)
    {
        gvSessiones.DataSource = objBusquedaSession;
        gvSessiones.DataBind();

        objbusqueda.GetDataByBusquedaSession(txtBusquedaSesion.Text);
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        gvSessiones.DataSource = objSecc_Act;
        gvSessiones.DataBind();
        txtBusquedaSesion.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        lblcupo.Text = "";
        costocredito = 300;
        Label1.Text = "500";
        inscripcion = "500";

            //verificando si hay materias seleccionadas
            if (DataList1.Items.Count.Equals(0))
            {
                lblmsg.Text = "Debe agregar materias para poder inscribir";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                
                try
                {
                    //desactivando la inscripcion anterior
                    string ciclodes;
                    inscripcionTA.FillByEstudianteActivo(inscripcionDT, Convert.ToInt32(Session["id_estudiante"]));
                    foreach (dsUniversidad.Inscripcion_EstudianteRow desrow in inscripcionDT.Rows)
                    {
                        ciclodes = desrow.ciclo.ToString();
                        if (ciclodes != lblciclo.Text)
                        {
                            inscripcionTA.DesactivarInscripcion(Convert.ToInt32(desrow.id_inscripcion));
                        }
                    }

                    //verificando si es la primer inscripcion para poner el carnet
                    inscripcionTA.FillByEstudiante(inscripcionDT, Convert.ToInt32(Session["id_estudiante"]));
                    if (inscripcionDT.Rows.Count.Equals(0))
                    {
                        
                        //nombre que va a buscar. Si cambia el nombre del carnet solamente
                        //hay que cambiar lo que esta entre comillas
                        serviciosTA.FillByDescripcion(serviciosDT, "Carnet");
                        foreach (dsUniversidad.ServiciosRow fila in serviciosDT.Rows)
                        {
                            preciocarnet = fila.costo;
                            motivo = fila.descripcion.ToString();
                        }
                        //guardando el balance del carnet
                        balanceTA.Insert(Convert.ToInt32(Session["id_estudiante"]), motivo, DateTime.Now, true, false, "Servicio", preciocarnet, 0, 0, 0, "0", Convert.ToInt32(Session["idUsuario"]), 0);
                    }
                }
                catch (Exception ex)
                {

                }
                try
                {
                    foreach (DataRow objDR in objDT.Rows)
                    {
                        seccionesactivas.FillByIdsession(seccionesactivasdt, Convert.ToInt32(objDR["session_id"]));

                        foreach (dsUniversidad.Secciones_ActivasRow row in seccionesactivasdt.Rows)
                        {
                            inscritos = row.Inscritos.ToString();
                            mat_desc = row.materia_desc.ToString();
                            capacidad = row.capacidad.ToString();

                            //verificando si el cupo esta lleno
                            if (Convert.ToInt32(inscritos) >= Convert.ToInt32(capacidad))
                            {
                                lblcupo.Text = "La materia" + " " + mat_desc + " " + "tiene el cupo lleno";
                                lblcupo.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                    }
                    if (lblcupo.Text == "")
                    {
                        //Realizando la nueva inscripcion
                        InscripcionId = Convert.ToInt32(inscripcionTA.InsertInscripcion(Convert.ToInt32(Session["id_estudiante"]), lblciclo.Text, DateTime.Today, Convert.ToInt32(Session["idUsuario"]), true));

                        //insertando en la tabla de Estudiante_Session
                        foreach (DataRow objDR in objDT.Rows)
                        {
                            objta.Insert(InscripcionId, Convert.ToInt32(objDR["session_id"]), DateTime.Today, true, false, false, null, null,null);
                        }

                        //Buscar los datos necesarios para calcular el cobro
                        //estCarr.FillByMatricula(estCarrdt, txtbuscar.Text);
                        //estcredit.FillByMatricula(estcreditdt, txtbuscar.Text);
                        suma.FillByMatriculaInscripcion(sumadt, txtbuscar.Text, InscripcionId);
                        studentbecata.FillByMatricula(studentbecadt, txtbuscar.Text);

                        //foreach (dsUniversidad.EstudianteCarreraDATARow row in estCarrdt.Rows)
                        //{
                        //    Label1.Text = row.costo_inscripcion.ToString();
                        //    costocredito = row.costo_credito;
                        //    inscripcion = row.costo_inscripcion.ToString();
                        //}

                        //calculando los creditos que tomo
                        foreach (dsUniversidad.Suma_de_CreditosRow fila in sumadt.Rows)
                        {
                            Label2.Text = fila.Creditos.ToString();
                            cred = fila.Creditos.ToString();
                        }

                        //buscando si tiene beca
                        becaTA.FillByEstudiante(becaDT, Convert.ToInt32(Session["id_estudiante"]));
                        foreach (dsUniversidad.becaRow becafila in becaDT.Rows)
                        {
                            beca = becafila.beca_creditos;
                            becainscripcion = becafila.beca_inscripcion;
                        }

                        //beca en la inscripcion
                        Decimal beca1 = Convert.ToDecimal(Label1.Text) * becainscripcion;
                        Decimal beca2 = Convert.ToDecimal(Label1.Text) - beca1;
                        Label1.Text = beca2.ToString();


                        //cuando la beca esta en tblreg_student
                        //foreach (dsUniversidad.Vista_Dt_EstudianteRow filas in studentbecadt.Rows)
                        //{
                        //    beca = filas.beca;
                        //}

                        //buscando si tiene credito pendiente
                        //acreditarta.FillById_student(obdtacreditar, Convert.ToInt32(dvBuscar.Rows[3].Cells[1].Text.ToString()));

                        //try
                        //{

                        //    foreach (dsUniversidad.creditoRow filas in obdtacreditar.Rows)
                        //    {
                        //        Label8.Text = "$" + " " + filas.monto.ToString();
                        //        acreditar = filas.monto;
                        //        idcredito = filas.id_credito;
                        //    }

                        //}
                        //catch (Exception ex)
                        //{
                        //    acreditar = 0;
                        //}

                        calculobeca = (costocredito * Convert.ToDecimal(Label2.Text) * beca);

                        restacalculobeca = (costocredito * Convert.ToDecimal(Label2.Text));

                        Label3.Text = Convert.ToString(restacalculobeca - calculobeca);

                        //hacercredito = Convert.ToDecimal(Label3.Text) - acreditar;
                        hacercredito = Convert.ToDecimal(Label3.Text);

                        lbltotal.Text = Convert.ToString(Convert.ToDecimal(hacercredito) + Convert.ToDecimal(Label1.Text));

                        total = lbltotal.Text;


                        //INSERTAR EN LA TABLA DE BALANCE DE INSCRIPCION (los 5 conceptos)
                        //inscripcion
                        balanceTA.Insert(Convert.ToInt32(Session["id_estudiante"]), "Pago por Inscripcion", DateTime.Now, true, false, "Inscripcion", 0, Convert.ToDecimal(Label1.Text),0,0, lblciclo.Text, Convert.ToInt32(Session["idUsuario"]), InscripcionId);
                        //mensualidades
                        for (int x = 1; x <= 4; x++)
                        {
                            Decimal mensualidad = (Convert.ToDecimal(hacercredito) / 4);
                            //balanceTA.Insert(Convert.ToInt32(Session["id_estudiante"]), "Pago por Mensualidad", DateTime.Now, true, false, "Inscripcion", 0, 0, Convert.ToInt32(Label2.Text), Convert.ToDecimal(Label3.Text), lblciclo.Text, Convert.ToInt32(Session["idUsuario"]), InscripcionId);
                            balanceTA.Insert(Convert.ToInt32(Session["id_estudiante"]), "Pago por Mensualidad " + x.ToString(), DateTime.Now, true, false, "Inscripcion", 0, 0, Convert.ToInt32(Label2.Text), mensualidad, lblciclo.Text, Convert.ToInt32(Session["idUsuario"]), InscripcionId);

                        }


                        //acreditarta.UpdateActivo(Convert.ToInt32(dvBuscar.Rows[3].Cells[1].Text));

                        //guardando en la tabla de credito
                        //if (hacercredito < 0)
                        //{
                        //    acreditarta.Insert(Convert.ToDecimal(total), "Sobrante de Credito" + " " + Convert.ToString(idcredito), Convert.ToInt32(dvBuscar.Rows[3].Cells[1].Text.ToString()), DateTime.Now, true, gvSessiones.SelectedRow.Cells[4].ToString(),0);
                        //}
                        //else
                        //{
                        //}

                        Button1.Enabled = false;

                        Label1.Text = "$" + string.Format(" {0:c} ", inscripcion);

                        Label3.Text = "$" + string.Format(" {0:c} ", restacalculobeca - calculobeca);

                        lbltotal.Text = "$" + string.Format(" {0:c} ", total);

                        //desactivando la preseleccion si tenia
                        //preselectTA.UpdateFalse(Convert.ToInt32(Session["id_estudiante"]));

                    }
                    else
                    {

                    }
                }
                catch (Exception ex)
                {

                }
            }
        }
    
    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            Int32 Index = 0;
            Index = Convert.ToInt32(e.Item.ItemIndex.ToString());

            Label credit = (Label)DataList1.Items[Index].FindControl("Label7");
            Int32 creditmatdel = Convert.ToInt32(credit.Text);

            objDT.Rows[e.Item.ItemIndex].Delete();
            DataList1.DataSource = objDT;
            DataList1.DataBind();



            //Contador Creditos
            Session["CreditoAcumulado"] = Convert.ToInt32(Session["CreditoAcumulado"]) - creditmatdel;

        }
        catch (Exception exc)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error eliminando esta materia";
        }
    }
    protected void gvSessiones_SelectedIndexChanged(object sender, EventArgs e)
    {
 
    }
    protected void dvBuscar_DataBound(object sender, EventArgs e)
    {
        if (dvBuscar.PageCount.Equals(0))
        {
            Button1.Enabled = false;
            txtBusquedaSesion.Enabled = false;
            btnBuscarSeccion.Enabled = false;
            ImageButton1.Enabled = false;
            
        }
        else
        {
            btnBuscar.Enabled = false;
            Button1.Enabled = true;
            txtBusquedaSesion.Enabled = true;
            btnBuscarSeccion.Enabled = true;
            ImageButton1.Enabled = true;
            lblrecintoid.Text = dvBuscar.Rows[4].Cells[1].Text.ToString();
            lblMatricula.Text = txtbuscar.Text;


           #region CargarPreseleccionEstudiante
           // //CARGAR LA PRESELECCION DEL ESTUDIANTE
           // try
           // {
                
           //     DetailsViewRow columna = dvBuscar.Rows[3];
           //     String cod_stu = columna.Cells[1].Text;
                
           //     preselectTA.FillBystudent_id(preseleccionDT, Convert.ToInt32(cod_stu));

           //     if (preseleccionDT.Rows.Count.Equals(0))
           //     {
                    
           //     }
           //     else
           //     {

           //         objta.FillBystudent_id(obdtstudent, Convert.ToInt32(cod_stu));

           //         foreach (dsUniversidad.Session_StudentRow fila in obdtstudent.Rows)
           //         {
           //             esta = fila.esta.ToString();
           //         }

           //         CargosApagarta.FillByMatricula(CargosApagardt, txtbuscar.Text);

           //         foreach (dsUniversidad.CargosAPagarRow row in CargosApagardt.Rows)
           //         {
           //             CargosApagar = row.Total;
           //         }

           //         if (CargosApagar != 0)
           //         {
           //             lblmsg.Text = "No se puede inscribir con deuda pendiente";
           //             lblmsg.ForeColor = System.Drawing.Color.Black;
           //         }

           //         else
           //         {
           //             if (Convert.ToBoolean(esta) == true)
           //             {
           //                 lblmsg.Text = "Esta persona ya esta inscrita si quiere hacerlo debe entrar a bajas y añadidas";
           //             }
           //             else
           //             {



           //                 foreach (dsUniversidad.Preseleccion_studentRow preselrow in preseleccionDT.Rows)
           //                 {
           //                     cod_Seccion = preselrow.session_id;

           //                     seccionesactivas.FillByIdsession(seccionesactivasdt, cod_Seccion);

           //                     foreach (dsUniversidad.Secciones_ActivasRow row in seccionesactivasdt.Rows)
           //                     {
           //                         sessioncod = row.session_cod.ToString();
           //                         materia = row.materia.ToString();
           //                         profesor = row.profesor.ToString();
           //                         creditsmat = Convert.ToInt32(row.mat_credit);
           //                         sessionciclo = row.session_ciclo.ToString();
           //                         lblciclo.Text = sessionciclo;
           //                     }

           //                     objDR = objDT.NewRow();
           //                     objDR["session_id"] = cod_Seccion;
           //                     objDR["session_cod"] = sessioncod;
           //                     objDR["ciclo"] = sessionciclo;
           //                     objDR["materia"] = materia;
           //                     objDR["creditos"] = creditsmat;
           //                     objDR["profesor"] = profesor;


           //                     try
           //                     {
           //                         //inscritosNo = Convert.ToInt32(gvSessiones.SelectedRow.Cells[5].Text);
           //                         inscritosNo = 0;
           //                     }
           //                     catch (Exception ex)
           //                     {
           //                         inscritosNo = 0;
           //                     }

           //                     objDR["inscritos"] = inscritosNo;

           //                     objDT.Rows.Add(objDR);
           //                 }
           //             }

                       

           //             DataList1.DataSource = objDT;
           //             DataList1.DataBind();
           //         }
           //     }
           // }
           // catch (Exception ex)
           // {
           //     lblmsg.ForeColor = System.Drawing.Color.Red;
           //     lblmsg.Text = "Ha ocurrido un error agregando esta materia, es posible que la misma ya se encuentre en el listado de selecci&oacute;n.";
           // }


           // //FIN DE CARGAR LA PRESELECCION 
            #endregion


        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("insertStudent_Seccion.aspx?");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Session["matriculainscripcion"] = lblMatricula.Text;
        Response.Redirect("HojaInscripcion.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {   
            lblmsg.Text = "";

            DetailsViewRow columna = dvBuscar.Rows[3];
            String cod_stu = columna.Cells[1].Text;

            lblciclo.Text = gvSessiones.SelectedRow.Cells[4].Text;
           
            //buscando si ya esta inscrito
            //inscripcionTA.FillByCiclo(inscripcionDT, lblciclo.Text);
            inscripcionTA.FillByEstudianteCiclo(inscripcionDT, Convert.ToInt32(cod_stu), lblciclo.Text);
            foreach (dsUniversidad.Inscripcion_EstudianteRow fila in inscripcionDT.Rows)
            {
                esta = fila.activo.ToString();
            }

            if (Convert.ToBoolean(esta) == true)
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Esta persona ya esta inscrita si quiere hacerlo debe entrar a bajas y añadidas";
            }
            else
            {
                //buscando los datos de la seccion
                seccionesactivas.FillByIdsession(seccionesactivasdt, Convert.ToInt32(gvSessiones.SelectedDataKey.Value));
                foreach (dsUniversidad.Secciones_ActivasRow row in seccionesactivasdt.Rows)
                {
                    sessioncod = row.session_cod.ToString();
                    materia = row.materia.ToString();
                    profesor = row.profesor.ToString();
                    creditsmat = Convert.ToInt32(row.mat_credit);
                    sessionciclo = row.session_ciclo.ToString();
                    horario = row.horario.ToString();
                    fechainicio = row.f_inicio.ToShortDateString();
                    fechafin = row.f_fin.ToShortDateString();
                }

                //Contador Creditos
                Int32 idCiclo = 0;
                cicloTA.FillByNombre(cicloDT, lblciclo.Text);
                foreach (dsUniversidad.CicloRow row in cicloDT.Rows)
                {
                    idCiclo = row.id_ciclo;
                }

                ExtraCredTA.FillByEstCiclo(ExtraCredDT, Convert.ToInt32(Session["id_estudiante"].ToString()), idCiclo);
                

                Session["CreditoAcumulado"] = Convert.ToInt32(Session["CreditoAcumulado"]) + creditsmat;
       

                if (Convert.ToInt32(Session["CreditoAcumulado"]) > 17)
                {
                    if (ExtraCredDT.Rows.Count > 0)
                    {                     
                        if (Convert.ToInt32(Session["CreditoAcumulado"]) <= 21)                      
                        {
                            //agregando la seccion al datalist
                            objDR = objDT.NewRow();
                            objDR["session_id"] = Convert.ToInt32(gvSessiones.SelectedDataKey.Value);
                            objDR["session_cod"] = sessioncod;
                            objDR["ciclo"] = sessionciclo;
                            objDR["materia"] = materia;
                            objDR["creditos"] = creditsmat;
                            objDR["profesor"] = profesor;
                            objDR["horario"] = horario;
                            objDR["fechainicio"] = fechainicio;
                            objDR["fechafin"] = fechafin;

                            //buscando la cantidad de inscritos
                            try
                            {
                                inscritosNo = Convert.ToInt32(gvSessiones.SelectedRow.Cells[5].Text);
                            }
                            catch (Exception ex)
                            {
                                inscritosNo = 0;
                            }

                            objDR["inscritos"] = inscritosNo;
                            objDT.Rows.Add(objDR);
                            DataList1.DataSource = objDT;
                            DataList1.DataBind();
                        }
                        else if (Convert.ToInt32(Session["CreditoAcumulado"]) > 21)
                        {
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                            lblmsg.Text = "Agregando esta materia excede los 21 creditos del extracredito";


                            //Contador Creditos
                            Session["CreditoAcumulado"] = Convert.ToInt32(Session["CreditoAcumulado"]) - creditsmat;
                        }
                    }
                    else
                    {
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                        lblmsg.Text = "Ya ha exedido los 17 creditos aprobados, debe crear un extracredito para poder elegir mas materias";

                        //Contador Creditos
                        Session["CreditoAcumulado"] = Convert.ToInt32(Session["CreditoAcumulado"]) - creditsmat;
                    }
                }
                else if (Convert.ToInt32(Session["CreditoAcumulado"]) <= 17)
                {
                    //agregando la seccion al datalist
                    objDR = objDT.NewRow();
                    objDR["session_id"] = Convert.ToInt32(gvSessiones.SelectedDataKey.Value);
                    objDR["session_cod"] = sessioncod;
                    objDR["ciclo"] = sessionciclo;
                    objDR["materia"] = materia;
                    objDR["creditos"] = creditsmat;
                    objDR["profesor"] = profesor;
                    objDR["horario"] = horario;
                    objDR["fechainicio"] = fechainicio;
                    objDR["fechafin"] = fechafin;
                    
                    //buscando la cantidad de inscritos
                    try
                    {
                        inscritosNo = Convert.ToInt32(gvSessiones.SelectedRow.Cells[5].Text);
                    }
                    catch (Exception ex)
                    {
                        inscritosNo = 0;
                    }

                    objDR["inscritos"] = inscritosNo;
                    objDT.Rows.Add(objDR);
                    DataList1.DataSource = objDT;
                    DataList1.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error agregando esta materia, es posible que la misma ya se encuentre en el listado de selecci&oacute;n.";

            //Contador Creditos
            Session["CreditoAcumulado"] = Convert.ToInt32(Session["CreditoAcumulado"]) - creditsmat;

        }
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            txtbuscar.Text = Session["copiarmatricula"].ToString();
        }
        catch (Exception ex)
        {

        }
    }

}
