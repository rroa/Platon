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

public partial class NotasSeccion : System.Web.UI.Page
{
    Notas_EstudiantesTableAdapter objta = new Notas_EstudiantesTableAdapter();
    dsUniversidad.Notas_EstudiantesDataTable notadt = new dsUniversidad.Notas_EstudiantesDataTable();

    Estudiante_NotaTableAdapter notata = new Estudiante_NotaTableAdapter();
   
    tblReg_StudentTableAdapter estudiante = new tblReg_StudentTableAdapter();
    dsUniversidad.tblReg_StudentDataTable estudiantedt = new dsUniversidad.tblReg_StudentDataTable();

    String notaletr;
    String notanum;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnBuscarSeccion_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
        gvSessiones.DataSource = objBusquedaSession;
        gvSessiones.DataBind();

       
    }
    catch (Exception ex)
    { 
    }
      }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            gvSessiones.DataSource = objSecc_Act;
            gvSessiones.DataBind();
            txtBusquedaSesion.Text = "";
        }
        catch (Exception ex)
        { }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void btnRegistrar_Click(object sender, ImageClickEventArgs e)
    {
        lblmsg.Text = "";
        try
        {

            for (int x = 0; x < DataList1.Items.Count; x++)
            {
                TextBox txtNotaver = (TextBox)DataList1.Items[x].FindControl("txtNota");

                if (Convert.ToInt32(txtNotaver.Text) < 0 || Convert.ToInt32(txtNotaver.Text) > 100)
                {
                    lblmsg.Text = "Hay notas fuera del rango permitido";
                }
                else
                {
                }
            }

            if(lblmsg.Text !="")
            {
            
            }
            else{
                    for (int y = 0; y < DataList1.Items.Count; y++)
                    {
                        Label lblNombreCompleto = (Label)DataList1.Items[y].FindControl("lblNombreCompleto");
                        Label lblMatricula = (Label)DataList1.Items[y].FindControl("lblMatricula");
                        DropDownList ddlNota = (DropDownList)DataList1.Items[y].FindControl("ddlNotas");
                        TextBox txtNota = (TextBox)DataList1.Items[y].FindControl("txtNota");
                        Label codstudiante = (Label)DataList1.Items[y].FindControl("cod_stu");

                        if (Convert.ToInt32(txtNota.Text) < 60)
                        {
                            ddlNota.SelectedValue = "F";
                        }
                        if (Convert.ToInt32(txtNota.Text) > 59 && Convert.ToInt32(txtNota.Text) < 70)
                        {
                            ddlNota.SelectedValue = "D";
                        }
                        if (Convert.ToInt32(txtNota.Text) > 69 && Convert.ToInt32(txtNota.Text) < 80)
                        {
                            ddlNota.SelectedValue = "C";
                        }
                        if (Convert.ToInt32(txtNota.Text) > 79 && Convert.ToInt32(txtNota.Text) < 90)
                        {
                            ddlNota.SelectedValue = "B";
                        }
                        if (Convert.ToInt32(txtNota.Text) > 89 && Convert.ToInt32(txtNota.Text) < 101)
                        {
                            ddlNota.SelectedValue = "A";
                        }
                        string NombreCompleto = lblNombreCompleto.Text;
                        string Matricula = lblMatricula.Text;
                        string Notas = ddlNota.SelectedValue.ToString();
                        string txtNotas = txtNota.Text;
                        string codStu = codstudiante.Text;

                        notata.Insert(Convert.ToInt32(codStu), Convert.ToInt32(gvSessiones.SelectedDataKey.Value), Notas, Convert.ToInt32(txtNotas),0,0,0,0,0);
                    }

                    lblmsg.Text = "Las notas han sido asignadas correctamente";
                    lblmsg.ForeColor = System.Drawing.Color.Blue;
                }
        }
        
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error asignando las notas";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    
    }
    
    protected void gvSessiones_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnRegistrar.Enabled = true;
        
             
        for (int x = 0; x < DataList1.Items.Count; x++)
        {
            notanum = "";
            notaletr = "A";


            Label codstudiante = (Label)DataList1.Items[x].FindControl("cod_stu");
            string codStu = codstudiante.Text;

            objta.FillById_Session(notadt, Convert.ToInt32(gvSessiones.SelectedDataKey.Value), Convert.ToInt32(codStu));

            foreach (dsUniversidad.Notas_EstudiantesRow row in notadt.Rows)
            {
                notaletr = row.nota;
                notanum = Convert.ToString(row.nota_num);
            }

            if (notanum  !="")
            {
                DropDownList ddlNota = (DropDownList)DataList1.Items[x].FindControl("ddlNotas");
                TextBox txtNota = (TextBox)DataList1.Items[x].FindControl("txtNota");

                ddlNota.SelectedValue = notaletr;
                txtNota.Text = Convert.ToString(notanum);

                btnRegistrar.Enabled = false;
                
            }
            else
            {
               
            }
        }
    }
}
