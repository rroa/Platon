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

public partial class preseleccion : System.Web.UI.Page
{
    decimal costocredito;
    string matricula;
    string sessioncod;
    string sessionciclo;
    string materia;
    string profesor;
    string esta;
    string sessionesact;
    Decimal beca;
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

    BalancePorInscripcionTableAdapter balanceInsc = new BalancePorInscripcionTableAdapter();

    Secciones_ActivasTableAdapter seccionesactivas = new Secciones_ActivasTableAdapter();
    dsUniversidad.Secciones_ActivasDataTable seccionesactivasdt = new dsUniversidad.Secciones_ActivasDataTable();

    Estudiantes_ForSearchTableAdapter estudianteforsearchta = new Estudiantes_ForSearchTableAdapter();
    dsUniversidad.Estudiantes_ForSearchDataTable estudianteforsearchdt = new dsUniversidad.Estudiantes_ForSearchDataTable();

    Preseleccion_studentTableAdapter objta = new Preseleccion_studentTableAdapter();
    dsUniversidad.Preseleccion_studentDataTable obdtstudent = new dsUniversidad.Preseleccion_studentDataTable();
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

    creditoTableAdapter acreditarta = new creditoTableAdapter();
    dsUniversidad.creditoDataTable obdtacreditar = new dsUniversidad.creditoDataTable();

    CargosAPagarTableAdapter CargosApagarta = new CargosAPagarTableAdapter();
    dsUniversidad.CargosAPagarDataTable CargosApagardt = new dsUniversidad.CargosAPagarDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        //CREANDO UN DATATABLE Y CARGANDOLE UN DATASET
        //PARA ENTRAR TODOS LOS DATOS EN MEMORIA Y CARGAR EL GVPRODUCTO

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

            Session["Seleccion"] = objDT;

        }
        else
        {

        }
    }
    protected void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            Session["Seleccion"] = null;
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

        if (DataList1.Items.Count.Equals(0))
        {
            lblmsg.Text = "Debe agregar materias para poder inscribir";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
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

                        if (Convert.ToInt32(inscritos) >= Convert.ToInt32(capacidad))
                        {
                            lblcupo.Text = "La materia" + " " + mat_desc + " " + "tiene el cupo lleno";
                            lblcupo.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
                if (lblcupo.Text == "")
                {

                    foreach (DataRow objDR in objDT.Rows)
                    {
                        objta.Insert(Convert.ToInt32(objDR["session_id"]), Convert.ToInt32(Session["id_estudiante"]), DateTime.Today, true);
                    }

                    estCarr.FillByMatricula(estCarrdt, txtbuscar.Text);
                    estcredit.FillByMatricula(estcreditdt, txtbuscar.Text);
                    //comentado para ser revisado
                    //suma.FillByMatricula(sumadt, txtbuscar.Text);
                    studentbecata.FillByMatricula(studentbecadt, txtbuscar.Text);


                    Button1.Enabled = false;
                    lblmsg.Text = "Las materias han sido pre-matriculadas.";
                    lblmsg.ForeColor = System.Drawing.Color.Blue;

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
            objDT.Rows[e.Item.ItemIndex].Delete();
            DataList1.DataSource = objDT;
            DataList1.DataBind();

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
            Button1.Enabled = true;
            txtBusquedaSesion.Enabled = true;
            btnBuscarSeccion.Enabled = true;
            ImageButton1.Enabled = true;
            lblrecintoid.Text = dvBuscar.Rows[4].Cells[1].Text.ToString();
            lblMatricula.Text = txtbuscar.Text;
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("insertStudent_Seccion.aspx?");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("HojaInscripcion.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            lblmsg.Text = "";

            DetailsViewRow columna = dvBuscar.Rows[3];
            String cod_stu = columna.Cells[1].Text;

            objta.FillBystudent_id(obdtstudent, Convert.ToInt32(cod_stu));

            foreach (dsUniversidad.Session_StudentRow fila in obdtstudent.Rows)
            {
                esta = fila.esta.ToString();
            }

            //CargosApagarta.FillByMatricula(CargosApagardt, txtbuscar.Text);

            //foreach (dsUniversidad.CargosAPagarRow row in CargosApagardt.Rows)
            //{
            //    CargosApagar = row.Total;
            //}

            //if (CargosApagar != 0)
            //{
            //    lblmsg.Text = "No se puede inscribir con deuda pendiente";
            //    lblmsg.ForeColor = System.Drawing.Color.Black;
            //}

            //else
            //{
                if (Convert.ToBoolean(esta) == true)
                {
                    lblmsg.Text = "Esta persona ya esta inscrita si quiere hacerlo debe entrar a bajas y añadidas";
                }
                else
                {
                    seccionesactivas.FillByIdsession(seccionesactivasdt, Convert.ToInt32(gvSessiones.SelectedDataKey.Value));

                    foreach (dsUniversidad.Secciones_ActivasRow row in seccionesactivasdt.Rows)
                    {
                        sessioncod = row.session_cod.ToString();
                        materia = row.materia.ToString();
                        profesor = row.profesor.ToString();
                        creditsmat = Convert.ToInt32(row.mat_credit);
                        sessionciclo = row.session_ciclo.ToString();
                    }

                    objDR = objDT.NewRow();
                    objDR["session_id"] = Convert.ToInt32(gvSessiones.SelectedDataKey.Value);
                    objDR["session_cod"] = sessioncod;
                    objDR["ciclo"] = sessionciclo;
                    objDR["materia"] = materia;
                    objDR["creditos"] = creditsmat;
                    objDR["profesor"] = profesor;

                }

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
            //}
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error agregando esta materia, es posible que la misma ya se encuentre en el listado de selecci&oacute;n.";
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
