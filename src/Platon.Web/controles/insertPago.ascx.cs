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

public partial class controles_insertPago : System.Web.UI.UserControl
{
    Decimal CargosApagar;
    Decimal pagomatricula;
    Decimal balancependiente;
    Decimal monto;
    Decimal TotalPagado;

    AcuerdoPagoTableAdapter acuerdopago = new AcuerdoPagoTableAdapter();


    tblPagoMatriculacionTableAdapter pagoMatri = new tblPagoMatriculacionTableAdapter();

    EstudianteCarreraDATATableAdapter estCarr = new EstudianteCarreraDATATableAdapter();
    Vista_Estudiante_CreditosTableAdapter estcredit = new Vista_Estudiante_CreditosTableAdapter();

    dsUniversidad.EstudianteCarreraDATADataTable estCarrdt = new dsUniversidad.EstudianteCarreraDATADataTable();
    dsUniversidad.Vista_Estudiante_CreditosDataTable estcreditdt = new dsUniversidad.Vista_Estudiante_CreditosDataTable();

    Suma_de_CreditosTableAdapter suma = new Suma_de_CreditosTableAdapter();
    dsUniversidad.Suma_de_CreditosDataTable sumadt = new dsUniversidad.Suma_de_CreditosDataTable();

    BalancePendienteTableAdapter balanceta = new BalancePendienteTableAdapter();
    tblPagoTableAdapter pagota = new tblPagoTableAdapter();

    Secciones_ActivasTableAdapter seccionesta = new Secciones_ActivasTableAdapter();
    dsUniversidad.Secciones_ActivasDataTable sessiondt = new dsUniversidad.Secciones_ActivasDataTable();

    BalancePorInscripcionTableAdapter balanceInscta = new BalancePorInscripcionTableAdapter();
    dsUniversidad.BalancePorInscripcionDataTable balancedt = new dsUniversidad.BalancePorInscripcionDataTable();

    CargosAPagarTableAdapter CargosApagarta = new CargosAPagarTableAdapter();
    dsUniversidad.CargosAPagarDataTable CargosApagardt = new dsUniversidad.CargosAPagarDataTable();

    View_PagoMatriculacionTableAdapter vistapago = new View_PagoMatriculacionTableAdapter();
    dsUniversidad.View_PagoMatriculacionDataTable vistapagodt = new dsUniversidad.View_PagoMatriculacionDataTable();

    CicloTableAdapter cicloTA = new CicloTableAdapter();
    dsUniversidad.CicloDataTable cicloDT = new dsUniversidad.CicloDataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime fecha;
        try
        {
            cicloTA.FillByActivoSinRecargo(cicloDT);
            foreach (dsUniversidad.CicloRow fila in cicloDT.Rows)
            {
                fecha = fila.fecha_recargo;
                if (fecha == DateTime.Today)
                {
                    PanelRecargo.Visible = true;
                    lblpanel.Text = "En el dia de hoy debe aplicar el recargo para el ciclo " + fila.nombre.ToString();
                }

            }
        }
        catch (Exception ex)
        {
        }

    }
    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        btnBuscar.Enabled = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {

            int idpago = Convert.ToInt32(pagota.InsertPago(txtmatricula.Text, Convert.ToInt32(GridView1.SelectedDataKey.Value), DateTime.Today, Convert.ToDecimal(GridView1.SelectedRow.Cells[3].Text)));

            balanceta.DesactivarBalance(Convert.ToInt32(GridView1.SelectedDataKey.Value));

            Session["ReciboServicio"] = idpago;

            GridView1.DataBind();

            HyperLink1.Visible = true;

            GridView4.DataBind();
        }

        catch (Exception ex)
        {

        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try{

        CargosApagarta.FillByMatricula(CargosApagardt, txtmatricula.Text);
        foreach (dsUniversidad.CargosAPagarRow row in CargosApagardt.Rows)
        {
            CargosApagar = row.Total;
        }

        vistapago.FillByMatricula(vistapagodt, txtmatricula.Text);

        foreach (dsUniversidad.View_PagoMatriculacionRow row in vistapagodt.Rows)
        {

            balancependiente = row.Balance;
            TotalPagado = row.Pagos;
        }

        if (GridView2.Rows.Count.Equals(0))

        {

            balancependiente = CargosApagar;
        
        }

        if (Convert.ToDecimal(txtmonto.Text) > balancependiente)
        {
            lblmsg.Text = "El monto a pagar no puede ser mayor de lo que debe";
        }

        else
        {
            try
            {
                DetailsViewRow columna = DetailsView1.Rows[0];
                String ciclo = columna.Cells[1].Text;

                //String totalbalance = GridView2.Rows[0].Cells[0].Text.ToString();

                int idpagoInsc = Convert.ToInt32(pagoMatri.InsertPago(txtmatricula.Text, ddlConcepto.SelectedValue + " " + ciclo.ToString(), DateTime.Today, Convert.ToDecimal(txtmonto.Text), ciclo));
                GridView2.DataBind();
                GridView3.DataBind();

                Session["ReciboInscripcion"] = idpagoInsc;

                HyperLink2.Visible = true;

                vistapago.FillByMatricula(vistapagodt, txtmatricula.Text);

                foreach (dsUniversidad.View_PagoMatriculacionRow row in vistapagodt.Rows)
                {
                    pagomatricula = row.Pagos;
                }

                if (Convert.ToString(CargosApagar) == Convert.ToString(pagomatricula))
                {
                    balanceInscta.DesactivarBalance(txtmatricula.Text, ciclo);
                    lblmsg.Text = "Los cargos por matriculacion han sido saldados";
                }
            }
            catch (Exception ex)
            {

            }
        }
            
       }
       catch (Exception ex)
       {
           lblmsg.Text = "Ha ocurrido un error aplicando el pago, intente nuevamente.";
           lblmsg.ForeColor = System.Drawing.Color.Red;
       }
   }
    protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Session["ReciboServicio"] = Convert.ToInt32(GridView4.SelectedDataKey.Value);
            //Response.Redirect("ReciboPagoServicio.aspx");
            Response.Write("<script>");
            Response.Write("window.open('ReciboPagoServicio.aspx','_blank')");
            Response.Write("</script>");
          
        }
        catch (Exception ex)
        {
        }
    }
    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Session["ReciboInscripcion"] = Convert.ToInt32(GridView3.SelectedDataKey.Value);
            //Response.Redirect("ReciboPagoInscripcion.aspx");
            Response.Write("<script>");
            Response.Write("window.open('ReciboPagoInscripcion.aspx','_blank')");
            Response.Write("</script>");
        }
        catch (Exception ex)
        { }
    }
    protected void btnNuevo_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("insertPago.aspx?");
    }

    protected void btnAcuerdoServ_Click(object sender, EventArgs e)
    {
        try
        {
            acuerdopago.Insert(txtmatricula.Text, DateTime.Today, Convert.ToDecimal(GridView1.SelectedRow.Cells[3].Text), true);

            balanceta.ActivarAcuerdoPago(Convert.ToInt32(GridView1.SelectedDataKey.Value));

            int idpago = Convert.ToInt32(pagota.InsertPago(txtmatricula.Text, Convert.ToInt32(GridView1.SelectedDataKey.Value), DateTime.Today, Convert.ToDecimal(GridView1.SelectedRow.Cells[3].Text)));

            balanceta.DesactivarBalance(Convert.ToInt32(GridView1.SelectedDataKey.Value));

            Session["ReciboServicio"] = idpago;

            GridView1.DataBind();

            HyperLink1.Visible = true;

            GridView4.DataBind();
        }

        catch (Exception ex)
        {

        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        aplicarRecargo();
    }

    public void aplicarRecargo()
    {
        DateTime fecha;
        decimal cargo;
        try
        {
            cicloTA.FillByActivoSinRecargo(cicloDT);
            foreach (dsUniversidad.CicloRow fila in cicloDT.Rows)
            {
                fecha = fila.fecha_recargo;
                if (fecha == DateTime.Today)
                {
                    vistapago.Fill(vistapagodt);
                    foreach (dsUniversidad.View_PagoMatriculacionRow row in vistapagodt.Rows)
                    {
                        cargo = Convert.ToDecimal(row.Balance) * Convert.ToDecimal(0.10);

                        balanceInscta.Insert(row.matricula, "Recargo por el ciclo " + fila.nombre.ToString(), cargo, 0, 0, DateTime.Today, true, fila.nombre.ToString(), false);
                    }
                    cicloTA.RecargoAplicado(fila.nombre.ToString());
                }

            }
        }
        catch (Exception ex)
        {
        }
    }

}
