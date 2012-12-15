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

public partial class PagoOdontologia : System.Web.UI.Page
{
    Servicios_OdontologiaTableAdapter ServOdonTA = new Servicios_OdontologiaTableAdapter();
    dsUniversidad.Servicios_OdontologiaDataTable ServOdonDT = new dsUniversidad.Servicios_OdontologiaDataTable();

    Pago_Servicio_OdontologiaTableAdapter PagoOdonTA = new Pago_Servicio_OdontologiaTableAdapter();
    dsUniversidad.Pago_Servicio_OdontologiaDataTable PagoOdonDT = new dsUniversidad.Pago_Servicio_OdontologiaDataTable();

    Pago_Servicio_Odontologia_DetalleTableAdapter PagoOdonDetTA = new Pago_Servicio_Odontologia_DetalleTableAdapter();
    dsUniversidad.Pago_Servicio_Odontologia_DetalleDataTable PagoOdonDetDT = new dsUniversidad.Pago_Servicio_Odontologia_DetalleDataTable();
    
    DataSet objDS = new DataSet();
    DataTable objDT;
    DataColumn objDC;
    DataRow objDR;
    string servicio;
    string costo;
    public DataColumn colum;
    public DataRow rows;
    decimal sumCosto = 0;
   

    

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


        objDT = (DataTable)Session["PagoOdontologico"];
        if (objDT == null)
        {
            objDT = new DataTable("PagoOdontologico");
            objDC = new DataColumn("id_set_pago", Type.GetType("System.String"));
            objDC.AutoIncrement = true;
            objDC.AutoIncrementSeed = 1;
            objDC.AutoIncrementStep = 1;
            objDC.Unique = true;
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("id_pago_odont", Type.GetType("System.String"));
            objDC.Unique = true;
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("servicio", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            objDC = new DataColumn("costo", Type.GetType("System.String"));
            objDT.Columns.Add(objDC);

            Session["PagoOdontologico"] = objDT;

        }
        else
        {

        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int insertada;

        if (DetailsView1.Rows.Count.Equals(0))
        {
            lblmsg.Text = "Debe buscar un estudiante";
        }
        else
        {

            if (datalistOdontologia.Items.Count.Equals(0))
            {
                lblmsg.Text = "Debe agregar servicios para poder pagar";
                lblmsg.ForeColor = System.Drawing.Color.Black;
            }
            else
            {
                try
                {

                    foreach (DataRow objDR in objDT.Rows)
                    {
                        sumCosto = Convert.ToDecimal(objDR["costo"]) + sumCosto;
                    }

                    insertada = Convert.ToInt32(PagoOdonTA.InsertPagoOdon(txtMatricula.Text, txtpaciente.Text, sumCosto, DateTime.Now, true));

                    foreach (DataRow objDR in objDT.Rows)
                    {
                        PagoOdonDetTA.Insert(insertada, Convert.ToInt32(objDR["id_pago_odont"]), Convert.ToDecimal(objDR["costo"]));
                    }
                    lblmsg.Text = "El servicio ha sido pagado";
                    lblmsg.ForeColor = System.Drawing.Color.Blue;

                    Button2.Enabled = false;

                }
                catch (Exception ex)
                {
                    lblmsg.Text = "Ha ocurrido un error pagando el servicio";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

    }
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            ServOdonTA.FillByid_serv_odon(ServOdonDT, Convert.ToInt32(GridView1.SelectedDataKey.Value));

            foreach (dsUniversidad.Servicios_OdontologiaRow row in ServOdonDT.Rows)
            {

                servicio = row.servicio.ToString();
                costo = row.costo.ToString();
            }

            objDR = objDT.NewRow();
            objDR["id_pago_odont"] = Convert.ToInt32(GridView1.SelectedDataKey.Value);
            objDR["servicio"] = servicio;
            objDR["costo"] = costo;
              
            objDT.Rows.Add(objDR);
            datalistOdontologia.DataSource = objDT;
            datalistOdontologia.DataBind();

            foreach (DataRow objDR2 in objDT.Rows)
            {
                sumCosto = Convert.ToDecimal(objDR2["costo"]) + sumCosto;
                lblMonto.Text = sumCosto.ToString();
            }

        }
        catch (Exception ex)
        {
            lblmsg.Text = "No se pueden repetir los servicios";
        }
                    



     }

    protected void datalistOdontologia_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            objDT.Rows[e.Item.ItemIndex].Delete();
            datalistOdontologia.DataSource = objDT;
            datalistOdontologia.DataBind();

        }
        catch (Exception exc)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error eliminando este servicio";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["PagoOdontologico"] = null;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("PagoOdontologia.aspx");
    }
}
