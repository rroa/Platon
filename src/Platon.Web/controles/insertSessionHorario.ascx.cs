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

public partial class controles_insertSessionHorario : System.Web.UI.UserControl
{
    DataSet objDS = new DataSet();
    DataTable objDT;
    DataColumn objDC;
    DataRow objDR;
    Session_HorarioTableAdapter objta = new Session_HorarioTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        //CREANDO UN DATATABLE Y CARGANDOLE UN DATASET
        //PARA ENTRAR TODOS LOS DATOS EN MEMORIA Y CARGAR EL GVPRODUCTO

        if (!IsPostBack)
        {
            gvSessiones.DataSourceID = ObjSeccAct.ID;
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

            objDC = new DataColumn("session_id", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("session", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("ciclo", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("id_dia", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("dia", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("hora", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("id_aula", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("recinto", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("aula", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            Session["Seleccion"] = objDT;

        }
        else
        {

        }

    }
    
    protected void btnGuardar_Click1(object sender, ImageClickEventArgs e)
    {
        if (DataList1.Items.Count.Equals(0))
        {
            lblmsg.Text = "Debe agregar horarios para poder guardar";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            try
            {
                foreach (DataRow objDR in objDT.Rows)
                {
                    objta.Insert(Convert.ToInt32(objDR["session_id"]), Convert.ToInt32(objDR["id_dia"]), Convert.ToInt32(objDR["id_aula"]), objDR["ciclo"].ToString());
                    lblmsg.ForeColor = System.Drawing.Color.Blue;
                    lblmsg.Text = "Los datos han sido insertados";
                }

                btnGuardar.Enabled = false;
            }
            catch (Exception ex)
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Ha ocurrido un error insertando los datos";
            }
        }
    }
    protected void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
        if (txtSecciones.Text == "")
        {
            gvSessiones.DataSourceID = ObjSeccAct.ID;
        }
        else
        {
            try
            {

                gvSessiones.DataSourceID = ObjSeccBusqueda.ID;
            }

            catch (Exception ex)
            {
                
            }
        }
        
        
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        lblmsg.Text = "";
        try
        {
            objDR = objDT.NewRow();
            objDR["session_id"] = Convert.ToInt32(gvSessiones.SelectedDataKey.Value);
            objDR["session"] = gvSessiones.SelectedRow.Cells[1].Text;
            objDR["ciclo"] = gvSessiones.SelectedRow.Cells[4].Text;
            objDR["id_dia"] = Convert.ToInt32(gvHorario.SelectedDataKey.Value);
            objDR["dia"] = gvHorario.SelectedRow.Cells[1].Text;
            objDR["hora"] = gvHorario.SelectedRow.Cells[2].Text;
            objDR["id_aula"] = Convert.ToInt32(gvAulas.SelectedDataKey.Value);
            objDR["recinto"] = gvAulas.SelectedRow.Cells[2].Text;
            objDR["aula"] = gvAulas.SelectedRow.Cells[1].Text;

            objDT.Rows.Add(objDR);

            DataList1.DataSource = objDT;
            DataList1.DataBind();
        }
        catch (Exception ex)
        {

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
            lblmsg.Text = "Ha ocurrido un error eliminando este horario";
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("insertSessionHorario.aspx?");
    }
}
