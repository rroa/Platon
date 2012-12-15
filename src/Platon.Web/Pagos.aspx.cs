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

public partial class Pagos : System.Web.UI.Page
{
    int recibono;
    DataSet objDS = new DataSet();
    DataTable objDT;
    DataColumn objDC;
    DataRow objDR;
    public DataColumn colum;
    public DataRow rows;

    string ciclo;
    string pagocodigo;
    string pagotipo;
    string pagomonto;
    string pagofecha;
    string student_id;

    decimal _balanceActual = 0;

    ReciboTableAdapter reciboTA = new ReciboTableAdapter();
    CajaPagoEstudiantesTableAdapter cajapagoTA = new CajaPagoEstudiantesTableAdapter();
    CajaBalanceEstudiantesTableAdapter cajaBalanceTA = new CajaBalanceEstudiantesTableAdapter();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["rol"]) == 0 || Session["rol"].ToString() == "")
        {
            Response.Redirect("denegado.aspx");
        }

        if (Convert.ToInt32(Session["rol"]) != 3)
        {
            if (Convert.ToInt32(Session["rol"]) != 1)
            {
                Response.Redirect("denegado.aspx");
            }
        }

        //CREANDO UN DATATABLE Y CARGANDOLE UN DATASET
        //PARA ENTRAR TODOS LOS DATOS EN MEMORIA Y CARGAR EL GVPRODUCTO
        if (!IsPostBack)
        {
            txtmatricula.Focus();
            Session["Seleccion"] = null;
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

            objDC = new DataColumn("codigo", Type.GetType("System.String"));
            objDC.Unique = true;
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("tipo", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("monto", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("fecha", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("tipo_pago", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("montoapagar", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("ciclo", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            Session["Seleccion"] = objDT;
        }
        else
        {

        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        try
        {
           //verificando la integridad de los datos pasados
            //1 verificando que haya algo escrito en los textbox
            //2 verificando que el monto escrito no sea mayor que la deuda
            //3 verificando que la cantidad escrita sea un numero
            for (int x = 0; x < DataList1.Items.Count; x++)
            {
                Label montoso = (Label)DataList1.Items[x].FindControl("Label7");
                TextBox txtMontoPagar = (TextBox)DataList1.Items[x].FindControl("TextBox3");
                string cantidad = txtMontoPagar.Text;
                string montoso2 = montoso.Text;

                if (cantidad == "")
                {
                    lblmsg.Text = "Debe escribir una cantidad";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
                try
                {
                    if (Convert.ToDecimal(cantidad) > Convert.ToDecimal(montoso2))
                    {
                        lblmsg.Text = lblmsg.Text + "- El monto a pagar no puede ser mayor de lo que debe";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    lblmsg.Text = "Debe escribir una cantidad válida";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }

            if (lblmsg.Text != "")
            {

            }
            else
            {

                //recogiendo el id del estudiante del detaislview
                DetailsViewRow id_Stu = dvDatos.Rows[0];
                student_id = id_Stu.Cells[1].Text;

                //crear un nuevo recibo
                recibono = Convert.ToInt32(reciboTA.InsertRecibo(Convert.ToInt32(student_id), DateTime.Now));



                for (int y = 0; y < DataList1.Items.Count; y++)
                {
                    Label codigo = (Label)DataList1.Items[y].FindControl("Label4");
                    Label tipo = (Label)DataList1.Items[y].FindControl("Label5");
                    Label monto = (Label)DataList1.Items[y].FindControl("Label7");
                    Label fecha = (Label)DataList1.Items[y].FindControl("Label6");
                    DropDownList ddltipopago = (DropDownList)DataList1.Items[y].FindControl("DropDownList1");
                    TextBox txtPago = (TextBox)DataList1.Items[y].FindControl("TextBox3");
                    Label ciclo = (Label)DataList1.Items[y].FindControl("Label8");

                    string codigos = codigo.Text;
                    string tipos = tipo.Text;
                    string tipopago = ddltipopago.SelectedValue.ToString();
                    string montos = monto.Text;
                    string fechas = fecha.Text;
                    string pago = txtPago.Text;
                    string ciclos = ciclo.Text;

                    //efectuar el pago
                    cajapagoTA.Insert(recibono, Convert.ToInt32(codigos), Convert.ToInt32(student_id), DateTime.Now, Convert.ToDecimal(pago), ciclos, Convert.ToInt32(Session["idUsuario"]),tipopago,true);

                    //desactivando las deudas saldadas
                    if (Convert.ToDecimal(pago) == Convert.ToDecimal(montos))
                    {
                        cajaBalanceTA.DesactivarDeuda(Convert.ToInt32(codigos));
                    }
                }

                lblmsg.Text = "El pago ha sido realizado correctamente";
                lblmsg.ForeColor = System.Drawing.Color.Blue;

                HyperLink1.Visible = true;

                Session["IdReciboImpresion"] = recibono;
                Button2.Enabled = false;

                GridView3.DataBind();
                GridView1.DataBind();
            }
        }

        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error realizando el pago";
            lblmsg.ForeColor = System.Drawing.Color.Red;
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
            lblmsg.Text = "Ha ocurrido un error eliminando esta cargo";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            lblmsg.Text = "";

            //asignandole valores a las variables segun el grid
            pagocodigo = GridView1.SelectedRow.Cells[1].Text.ToString();
            pagotipo = GridView1.SelectedRow.Cells[9].Text.ToString();

            //if (pagotipo == "Servicio")
            //{
                pagomonto = GridView1.SelectedRow.Cells[11].Text.ToString();
            //}
            //else if (pagotipo == "Inscripcion")
            //{
            //    pagomonto = GridView1.SelectedRow.Cells[7].Text.ToString();
            //}

            pagofecha = GridView1.SelectedRow.Cells[10].Text.ToString();
            ciclo = GridView1.SelectedRow.Cells[8].Text.ToString();
                
            //pasando estos valores a la tabla virtual
                    objDR = objDT.NewRow();
                    objDR["codigo"] = pagocodigo;
                    objDR["tipo"] = pagotipo;
                    objDR["monto"] = pagomonto;
                    objDR["fecha"] = pagofecha;
                    objDR["ciclo"] = ciclo;
                    
                objDT.Rows.Add(objDR);

                DataList1.DataSource = objDT;
                DataList1.DataBind();
            
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error agregando este cargo, es posible que el mismo ya se encuentre en el listado de selecci&oacute;n.";
        }
    }
    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            if (IsPostBack)
            {
                if (dvDatos.Rows.Count == 0)
                {
                    btnBuscar.Enabled = true;
                    Button2.Enabled = false;

                    txtmatricula.Enabled = true;

                }
                else if (dvDatos.Rows.Count != 0)
                {
                    btnBuscar.Enabled = false;

                    Button2.Enabled = true;
                    txtmatricula.Enabled = false;
                }
            }
        }
        catch(Exception ex)
        {

        }
        
    }
    protected void btnNuevo_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Pagos.aspx?");
    }
    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Session["IdReciboImpresion"] = GridView3.SelectedDataKey.Value;
            Response.Redirect("PagosRecibo.aspx");
        }
        catch (Exception ex)
        {

        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            dsUniversidad.viewCajaBalanceEstudianteRow balance = (dsUniversidad.viewCajaBalanceEstudianteRow)((System.Data.DataRowView)e.Row.DataItem).Row;
            if (!balance.IsBalanceNull())
                _balanceActual += balance.Balance;

        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[10].Text = "Balance:";
            e.Row.Cells[11].Text = _balanceActual.ToString();
        }
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            txtmatricula.Text = Session["copiarmatricula"].ToString();
        }
        catch (Exception ex)
        {

        }
    }
}
