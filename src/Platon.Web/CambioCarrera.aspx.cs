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

public partial class CambioCarrera : System.Web.UI.Page
{
    EstudianteCarreraDATATableAdapter estudiantecarrera = new EstudianteCarreraDATATableAdapter();
    dsUniversidad.EstudianteCarreraDATADataTable estcarrdt = new dsUniversidad.EstudianteCarreraDATADataTable();
    Estdiante_CarreraTableAdapter estCarrerata = new Estdiante_CarreraTableAdapter();
    dsUniversidad.Estdiante_CarreraDataTable estCarreraDataT = new dsUniversidad.Estdiante_CarreraDataTable();

    viewEstudianteCarreraTableAdapter estCarreraTA = new viewEstudianteCarreraTableAdapter();
    dsUniversidad.viewEstudianteCarreraDataTable estCarreraDT = new dsUniversidad.viewEstudianteCarreraDataTable();


    PensumTableAdapter pensumta = new PensumTableAdapter();
    dsUniversidad.PensumDataTable pensumdt = new dsUniversidad.PensumDataTable();

    tblReg_StudentTableAdapter regstudentta = new tblReg_StudentTableAdapter();
    dsUniversidad.tblReg_StudentDataTable regstudentdt = new dsUniversidad.tblReg_StudentDataTable();

    Vista_Dt_EstudianteTableAdapter vistaestudianteta = new Vista_Dt_EstudianteTableAdapter();
    dsUniversidad.Vista_Dt_EstudianteDataTable vistaestudiantedt = new dsUniversidad.Vista_Dt_EstudianteDataTable();
    
    Int32 carrera;
    int pensum;
    int codstu;
    Int32 NoCambio = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {        
        try
        {
            estCarreraTA.FillByMatricula(estCarreraDT, txtmatricula.Text);
            
            foreach (dsUniversidad.viewEstudianteCarreraRow row in estCarreraDT.Rows)
            {
                lblcarrera.Text = row.carrera_nombre.ToString();
                //lblnoinsc.Text = row.id_stud_carr.ToString();
                //lblidstudent.Text = row.cod_stu.ToString();

            }
            
            lblmsg.Text = "";

        }
        catch (Exception ex)
        {
            lblmsg.Text = "Ha ocurrido un error buscando al estudiante";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void btnInscribir_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            //busca el ultimo pensum de la nueva carrera
            pensumta.FillByultimopensum(pensumdt, Convert.ToInt32(DropDownList1.SelectedValue));
            foreach (dsUniversidad.PensumRow row in pensumdt.Rows)
            {
                pensum = row.no_pensum;
            }

            //buscando el id del estudiante
            vistaestudianteta.FillByMatricula(vistaestudiantedt, txtmatricula.Text);
            foreach (dsUniversidad.Vista_Dt_EstudianteRow row in vistaestudiantedt.Rows)
            {
                codstu = row.cod_stu;
            }

            //busca la inscripcion en la carrera
            estCarrerata.FillByEstudianteActivo(estCarreraDataT, codstu);
            foreach (dsUniversidad.Estdiante_CarreraRow filaest in estCarreraDataT.Rows)
            {
                lblnoinsc.Text = filaest.id_stud_carr.ToString();
                NoCambio = filaest.NoCambio;
                NoCambio = NoCambio + 1;
            }

            if (NoCambio <= 3 || CkkCambio.Checked == true)
            {
                //cambiando el pensum
                regstudentta.UpdatePensum(pensum, codstu);

                //cambia la carrera
                estCarrerata.Insert(codstu, Convert.ToInt32(DropDownList1.SelectedItem.Value), DateTime.Today, "1", null, null, NoCambio);
                estCarrerata.DesactivarCarrera(txtmotivo.Text, Convert.ToInt32(Session["idUsuario"]), Convert.ToInt32(lblnoinsc.Text));


                lblmsg.ForeColor = System.Drawing.Color.Blue;
                lblmsg.Text = "La carrera ha sido cambiada.";

                DetailsView1.DataBind();

                lblcarrera.Text = DropDownList1.SelectedItem.Text;

                btnInscribir.Enabled = false;
                DropDownList1.Enabled = false;
                CkkCambio.Enabled = false;
                CkkCambio.Checked = false;
            }
            else if (NoCambio > 3 && CkkCambio.Checked == false)
            {
                lblmsg.Text = "Este estudiante ya se ha cambiado 3 veces de carrera confirme para el cambio";
                CkkCambio.Enabled = true;
            }

        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error cambiando la carrera." + ex.ToString();
        }
    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList1.Items.Insert(0, "- Seleccione la carrera -");
    }
}
