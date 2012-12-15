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

public partial class controles_insertPensum : System.Web.UI.UserControl
{
    int no_pensum = 0;
    PensumTableAdapter objta = new PensumTableAdapter();
    MateriaTableAdapter objbusqueda = new MateriaTableAdapter();
    MateriaTableAdapter objbusquedaPre = new MateriaTableAdapter();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //gvMateria.DataSource = ObjectMateria;
        //gvMateria.DataBind();
        //gvPrereq.DataSource = ObjectMateria;
        //gvPrereq.DataBind();
    }

    protected void btnGuardar_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (chkNuevo.Checked == true)
            {
                no_pensum = (Convert.ToInt32(gvNoPensum.Rows.Count) + 1);
            }
            else
            {

                //asignando el numero de pensum de la carrera
                if (gvNoPensum.Rows.Count.Equals(0))
                {
                    no_pensum = 1;
                }
                else
                {
                    no_pensum = Convert.ToInt32(gvNoPensum.SelectedDataKey.Value);
                }
            }

                //guardando el pensum
                objta.Insert(Convert.ToInt32(ddlcarrera.SelectedValue), Convert.ToInt32(gvMateria.SelectedDataKey.Value), Convert.ToInt32(gvPrereq.SelectedDataKey.Value), Convert.ToInt32(ddlsemestre.SelectedValue), no_pensum);

                lblmsg.ForeColor = System.Drawing.Color.Blue;
                lblmsg.Text = "Los datos han sido insertados";

                gvPensum.DataBind();
            
        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error guardando el pensum, int&eacute;ntelo nuevamente.";
        }
    
    
    }
    protected void btnBuscar_Click1(object sender, ImageClickEventArgs e)
    {
        gvMateria.DataSourceID = objBuscar.ID;
        gvMateria.DataBind();

        objbusqueda.GetDataByCod_Mat(txtBuscar.Text);
    }
    protected void btnVer_Click1(object sender, ImageClickEventArgs e)
    {
        gvMateria.DataSourceID = ObjectMateria.ID;
        gvMateria.DataBind();
        txtBuscar.Text = "";
    }
    protected void btnBuscarPre_Click1(object sender, ImageClickEventArgs e)
    {
        gvPrereq.DataSourceID = objBuscarPre.ID;
        gvPrereq.DataBind();

        objbusquedaPre.GetDataByCod_Mat(txtBuscarPre.Text);
    }
    protected void btnVerPre_Click1(object sender, ImageClickEventArgs e)
    {
        gvPrereq.DataSourceID = ObjectMateria.ID;
        gvPrereq.DataBind();
        txtBuscarPre.Text = "";
    }
    protected void ddlcarrera_SelectedIndexChanged(object sender, EventArgs e)
    {
        //gvNoPensum.EmptyDataText = "Esta carrera no tiene un Pensum definido.";
        gvNoPensum.DataBind();
    }

    //protected void gvNoPensum_DataBound(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        gvNoPensum.SelectedIndex = 0;
    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //}
   
}
