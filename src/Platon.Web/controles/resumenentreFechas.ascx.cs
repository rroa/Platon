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

        //        pagoServicio.FillByRangoFecha(pagoServiciodt, Cal1.SelectedDate,Cal2.SelectedDate);

        //        foreach (dsUniversidad.tblPagoRow row in pagoServiciodt.Rows)
        //        {
        //            balancependiente = balancependiente + row.monto;
        //        }

        //        pagoMatricula.FillByRangoFechas(pagoMatriculadt, Cal1.SelectedDate,Cal2.SelectedDate);

        //        foreach (dsUniversidad.tblPagoMatriculacionRow row in pagoMatriculadt.Rows)
        //        {
        //            balanceInscripcion = balanceInscripcion + row.monto;
        //        }

        //        lblbalancePendiente.Text = Convert.ToString(balancependiente);
        //        lblBalanceInscipcion.Text = Convert.ToString(balanceInscripcion);

        //        lblbalancePendiente.Text = "RD$" + string.Format(" {0:0.00} ", balancependiente);
        //        lblBalanceInscipcion.Text = "RD$" + string.Format(" {0:0.00} ", balanceInscripcion);

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

            

     //      pagoServicio.FillByRangoFecha(pagoServiciodt, Cal1.SelectedDate,Cal2.SelectedDate);

     //       foreach (dsUniversidad.tblPagoRow row in pagoServiciodt.Rows)
     //       {
     //           balancependiente = balancependiente + row.monto;
     //       }

     //       pagoMatricula.FillByRangoFechas(pagoMatriculadt, Cal1.SelectedDate,Cal2.SelectedDate);
            
     //       foreach(dsUniversidad.tblPagoMatriculacionRow row in pagoMatriculadt.Rows)
     //       {
     //           balanceInscripcion = balanceInscripcion + row.monto;
     //       }
           
     //       lblbalancePendiente.Text = Convert.ToString(balancependiente);
     //       lblBalanceInscipcion.Text = Convert.ToString(balanceInscripcion);

     //       lblbalancePendiente.Text = "RD" + string.Format(" {0:C} ", balancependiente);
     //       lblBalanceInscipcion.Text = "RD" + string.Format(" {0:C} ", balanceInscripcion);

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
            Session["fechasel1"] = Cal1.SelectedDate;
            Session["fechasel2"] = Cal2.SelectedDate;
            Response.Redirect("ImprimirResumenEntreFechas.aspx");
        }
        catch (Exception ex)
        {
        }
    }
}
