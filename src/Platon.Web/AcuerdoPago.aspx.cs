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

public partial class AcuerdoPago : System.Web.UI.Page
{
    AcuerdoPagoTableAdapter acuerdoTA = new AcuerdoPagoTableAdapter();
    PagosAAcuerdosTableAdapter pagoAcuerdo = new PagosAAcuerdosTableAdapter();

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
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToDecimal(txtmontopago.Text) > Convert.ToDecimal(Session["BalanceAcuerdo"]))
            {
                lblmsg.Text = "El monto a pagar no puede ser mayor a lo que debe";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                pagoAcuerdo.Insert(Convert.ToInt32(GridView1.SelectedDataKey.Value), Convert.ToDecimal(txtmontopago.Text), DateTime.Today, true, txtmatricula.Text);
                lblmsg.Text = "El pago ha sido efectuado correctamente";
                lblmsg.ForeColor = System.Drawing.Color.Blue;
                
                Button1.Enabled = false;

                //if (Convert.ToDecimal(txtmontopago.Text) == Convert.ToDecimal(Session["BalanceAcuerdo"]))
                //{
                //    acuerdoTA.UpdateEstadoAcuerdo(false, Convert.ToInt32(GridView1.SelectedDataKey.Value));
                //}

                txtmontopago.Text = "";

                GridView2.DataBind();
                GridView1.DataBind();

               
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error efectuando el pago, intente nuevamente";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Session["PagoAcuerdo"] = Convert.ToInt32(GridView2.SelectedDataKey.Value);
            Response.Write("<script>");
            Response.Write("window.open('ReciboAcuerdoPago.aspx','_blank')");
            Response.Write("</script>");
        }
        catch (Exception ex)
        {

        }        
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AcuerdoPago.aspx?");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["BalanceAcuerdo"] = GridView1.SelectedRow.Cells[6].Text.Replace("$","");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton1.Enabled = false;
    }
}
