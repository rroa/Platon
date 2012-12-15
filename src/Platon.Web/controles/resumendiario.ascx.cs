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

public partial class controles_resumendiario : System.Web.UI.UserControl
{
    tblPagoTableAdapter pagoServicio = new tblPagoTableAdapter();
    tblPagoMatriculacionTableAdapter pagoMatricula = new tblPagoMatriculacionTableAdapter();

    dsUniversidad.tblPagoDataTable pagoServiciodt = new dsUniversidad.tblPagoDataTable();
    dsUniversidad.tblPagoMatriculacionDataTable pagoMatriculadt = new dsUniversidad.tblPagoMatriculacionDataTable();

    Decimal balancependiente = 0;
    Decimal balanceInscripcion = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    try
        //    {
        //        lblbalancePendiente.Text = "";
        //        lblBalanceInscipcion.Text = "";

        //        CalResumen.SelectedDate = DateTime.Today;

        //        lbldia.Text = "Ganancias del dia " + CalResumen.SelectedDate.ToShortDateString();

        //        pagoServicio.FillByFecha(pagoServiciodt, CalResumen.SelectedDate);

        //        foreach (dsUniversidad.tblPagoRow row in pagoServiciodt.Rows)
        //        {
        //            balancependiente = balancependiente + row.monto;
        //        }

        //        pagoMatricula.FillByFecha(pagoMatriculadt, CalResumen.SelectedDate);

        //        foreach (dsUniversidad.tblPagoMatriculacionRow row in pagoMatriculadt.Rows)
        //        {
        //            balanceInscripcion = balanceInscripcion + row.monto;
        //        }

        //        lblbalancePendiente.Text = Convert.ToString(balancependiente);
        //        lblBalanceInscipcion.Text = Convert.ToString(balanceInscripcion);

        //        lblbalancePendiente.Text = "RD" + string.Format(" {0:C} ", balancependiente);
        //        lblBalanceInscipcion.Text = "RD" + string.Format(" {0:C} ", balanceInscripcion);

        //    }

         
        //    catch (Exception ex)
        //    {

        //    }
        //}
    }

    protected void CalResumen_SelectionChanged1(object sender, EventArgs e)
    {
     //try
     //   {
     //       lblbalancePendiente.Text = "";
     //       lblBalanceInscipcion.Text = "";

     //       lbldia.Text = "Ganancias del dia " + CalResumen.SelectedDate.ToShortDateString();

     //      pagoServicio.FillByFecha(pagoServiciodt, CalResumen.SelectedDate);

     //       foreach (dsUniversidad.tblPagoRow row in pagoServiciodt.Rows)
     //       {
     //           balancependiente = balancependiente + row.monto;
     //       }

     //       pagoMatricula.FillByFecha(pagoMatriculadt, CalResumen.SelectedDate);
            
     //       foreach(dsUniversidad.tblPagoMatriculacionRow row in pagoMatriculadt.Rows)
     //       {
     //           balanceInscripcion = balanceInscripcion + row.monto;
     //       }
           
     //       lblbalancePendiente.Text = Convert.ToString(balancependiente);
     //       lblBalanceInscipcion.Text = Convert.ToString(balanceInscripcion);

     //       lblbalancePendiente.Text = "RD$" + string.Format(" {0:0.00} ", balancependiente);
     //       lblBalanceInscipcion.Text = "RD$" + string.Format(" {0:0.00} ", balanceInscripcion);

     //       GridView1.DataBind();
     //       GridView2.DataBind();
     //   }
     //   catch(Exception ex)
     //   {

     //   }
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            Session["fechasel"] = CalResumen.SelectedDate;
            Response.Redirect("ImprimirResumenDiario.aspx");
        }
        catch (Exception ex)
        {
        }
    }
}
