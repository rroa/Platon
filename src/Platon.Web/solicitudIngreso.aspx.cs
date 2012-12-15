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

public partial class solicitudIngreso : System.Web.UI.Page
{
    tblAdmision_StudentTableAdapter admisionTA = new tblAdmision_StudentTableAdapter();
    
    PensumTableAdapter pensumta = new PensumTableAdapter();
    dsUniversidad.PensumDataTable pensumdt = new dsUniversidad.PensumDataTable();

    decimal prueba;
    int pensum;

    protected void Page_Load(object sender, EventArgs e)
    {
        txtano.Text = DateTime.Today.Year.ToString();

        txtfechaingreso.Text = DateTime.Today.ToShortDateString();
    }
    protected void btnGuardar_Click(object sender, ImageClickEventArgs e)
    {
        if (txtnombre.Text == "" || txtapellido.Text == "" || ddlcarrera.SelectedIndex == 0 || ddlciclo.SelectedIndex == 0 || ddlrecinto.SelectedIndex == 0)
        {
            ListBox1.Visible = true;
            ListBox1.Items.Clear();

            if (txtnombre.Text == "")
            {
                ListBox1.Items.Add("El nombre esta vacio");
            }
            if (txtapellido.Text == "")
            {
                ListBox1.Items.Add("El apellido esta vacio");
            }
            if (ddlcarrera.SelectedIndex == 0)
            {
                ListBox1.Items.Add("Debe seleccionar la carrera");
            }
            if (ddlciclo.SelectedIndex == 0)
            {
                ListBox1.Items.Add("Debe seleccionar el ciclo");
            }
            if (ddlrecinto.SelectedIndex == 0)
            {
                ListBox1.Items.Add("Debe seleccionar el recinto");
            }
        }
        else
        {

            ListBox1.Visible = false;

            try
            {
                if (Convert.ToInt32(txtBeca.Text) > 100)
                {
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    lblmsg.Text = "La beca no puede ser mayor de 100";
                }
                else
                {
                    bool cop_cedula;
                    if (chkced.Checked == true)
                    {
                        cop_cedula = true;
                    }
                    else
                    {
                        cop_cedula = false;
                    }

                    bool cert_edu;
                    if (chkcertedu.Checked == true)
                    {
                        cert_edu = true;
                    }
                    else
                    {
                        cert_edu = false;
                    }

                    bool certmed;
                    if (chkcertmed.Checked == true)
                    {
                        certmed = true;
                    }
                    else
                    {
                        certmed = false;
                    }

                    bool certnac;
                    if (chkcertnac.Checked == true)
                    {
                        certnac = true;
                    }
                    else
                    {
                        certnac = false;
                    }

                    bool foto;
                    if (chkfoto.Checked == true)
                    {
                        foto = true;
                    }
                    else
                    {
                        foto = false;
                    }

                    bool record;
                    if (chkrecord.Checked == true)
                    {
                        record = true;
                    }
                    else
                    {
                        record = false;
                    }

                    bool soladm;
                    if (chksoladm.Checked == true)
                    {
                        soladm = true;
                    }
                    else
                    {
                        soladm = false;
                    }



                    bool recordSEESCYT;
                    if (chkrecordSEESCYT.Checked == true)
                    {
                        recordSEESCYT = true;
                    }
                    else
                    {
                        recordSEESCYT = false;
                    }


                    bool tituloSEESCYT;
                    if (chkTituloSEESCYT.Checked == true)
                    {
                        tituloSEESCYT = true;
                    }
                    else
                    {
                        tituloSEESCYT = false;
                    }


                    pensumta.FillByultimopensum(pensumdt, Convert.ToInt32(ddlcarrera.SelectedValue));

                    foreach (dsUniversidad.PensumRow row in pensumdt.Rows)
                    {

                        pensum = row.no_pensum;

                    }

                    //string fechanac = (ddlmes.SelectedItem.Value + '/' + ddldia.SelectedValue + '/' + ddlano.SelectedValue);
                    string fechanac = txtfechanac.Text;
                    prueba = Convert.ToDecimal(txtBeca.Text) / 100;

                    //insertando el estudiante
                    //admisionTA.Insert(Convert.ToInt32(txtano.Text), Convert.ToDateTime(txtfechaingreso.Text), txtnombre.Text, txtapellido.Text, rblsexo.SelectedValue, fechanac,
                    //                   txttelefono.Text, txtcedula.Text, txtdireccion.Text, txtnombrepadre.Text, txtnombremadre.Text, Convert.ToInt32(ddlrecinto.SelectedItem.Value), Convert.ToInt32(ddlciclo.SelectedItem.Value), txtcorreo.Text,
                    //                   txtNacionalidad.Text, txtPasaporte.Text, txtMedioEntero.Text, Convert.ToBoolean(soladm), Convert.ToBoolean(certnac), Convert.ToBoolean(certmed), Convert.ToBoolean(cop_cedula), Convert.ToBoolean(foto), Convert.ToBoolean(record), Convert.ToBoolean(cert_edu), Convert.ToBoolean(tituloSEESCYT), Convert.ToBoolean(recordSEESCYT),
                    //                   prueba, true, pensum, txttelefonopadre.Text, txttrabajopadre.Text, ddlestadocivil.SelectedItem.Value,
                    //                   txtgraduobachiller.Text, txtactivextracurr.Text, txtaccidentenot.Text, txtprobdireccion.Text,
                    //                   txtprobtelefono.Text, txtlugartrabajo.Text, Convert.ToInt32(txtanosservicio.Text), chkbuenaconducta.Checked, ddlprovincia.SelectedItem.Value, ddlmunicipio.SelectedItem.Value, txtsector.Text,
                    //                   ddlprovincianacimiento.SelectedItem.Value, ddlmunicipionacimiento.SelectedItem.Value, txtsectornacimiento.Text, ddlTipoCentro.SelectedItem.Value, rblTipoIngreso.SelectedItem.Value, Convert.ToInt32(ddlcarrera.SelectedItem.Value), txtcelular.Text);

                    admisionTA.Insert(Convert.ToInt32(txtano.Text), Convert.ToDateTime(txtfechaingreso.Text), txtnombre.Text, txtapellido.Text, rblsexo.SelectedValue, fechanac,
                                       txttelefono.Text, txtcedula.Text, txtdireccion.Text, txtnombrepadre.Text, txtnombremadre.Text, Convert.ToInt32(ddlrecinto.SelectedItem.Value), Convert.ToInt32(ddlciclo.SelectedItem.Value), txtcorreo.Text,
                                       txtNacionalidad.Text, txtPasaporte.Text, txtMedioEntero.Text, soladm, certnac,certmed, cop_cedula, foto, record, cert_edu, tituloSEESCYT, recordSEESCYT, prueba, true, pensum, txttelefonopadre.Text, txttrabajopadre.Text, ddlestadocivil.SelectedItem.Value,
                                       txtgraduobachiller.Text, txtactivextracurr.Text, txtaccidentenot.Text, txtprobdireccion.Text,
                                       txtprobtelefono.Text, txtlugartrabajo.Text, Convert.ToInt32(txtanosservicio.Text), chkbuenaconducta.Checked, ddlprovincia.SelectedItem.Value, ddlmunicipio.SelectedItem.Value, txtsector.Text,
                                       ddlprovincianacimiento.SelectedItem.Value, ddlmunicipionacimiento.SelectedItem.Value, txtsectornacimiento.Text, ddlTipoCentro.SelectedItem.Value, rblTipoIngreso.SelectedItem.Value, Convert.ToInt32(ddlcarrera.SelectedItem.Value), txtcelular.Text, txttelefonotrabajo.Text);


                    lblmsg.ForeColor = System.Drawing.Color.Blue;
                    lblmsg.Text = "Los datos han sido insertados con exito";
                    btnprint.Visible = true;
                    lblmsgimpresion.Visible = true;

                    btnGuardar.Enabled = false;
                    txtapellido.Enabled = false;
                    txtBeca.Enabled = false;
                    txtcedula.Enabled = false;
                    txtcorreo.Enabled = false;
                    txtdireccion.Enabled = false;
                    txtMedioEntero.Enabled = false;
                    txtnombre.Enabled = false;
                    txtnombremadre.Enabled = false;
                    txtnombrepadre.Enabled = false;
                    txttelefono.Enabled = false;
                    rblsexo.Enabled = false;
                    ddlcarrera.Enabled = false;
                    ddlciclo.Enabled = false;
                    ddlrecinto.Enabled = false;
                    chkced.Enabled = false;
                    chkcertedu.Enabled = false;
                    chkcertmed.Enabled = false;
                    chkcertnac.Enabled = false;
                    chkfoto.Enabled = false;
                    chkrecord.Enabled = false;
                    chksoladm.Enabled = false;
                    txtNacionalidad.Enabled = false;
                    txtPasaporte.Enabled = false;
                    txttelefonopadre.Enabled = false;
                    txttrabajopadre.Enabled = false;
                    ddlestadocivil.Enabled = false;
                    txtgraduobachiller.Enabled = false;
                    txtactivextracurr.Enabled = false;
                    txtaccidentenot.Enabled = false;
                    txtprobdireccion.Enabled = false;
                    txtprobtelefono.Enabled = false;
                    txtlugartrabajo.Enabled = false;
                    txtanosservicio.Enabled = false;
                    chkbuenaconducta.Enabled = false;
                    chkTituloSEESCYT.Enabled = false;
                    chkrecordSEESCYT.Enabled = false;

                }
            }
            catch (Exception ex)
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Ha ocurrido un error insertando los datos" + ex;
            }
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("solicitudIngreso.aspx?");
    }
    protected void btnCancelar_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("solicitudIngreso.aspx?");
    }
    protected void ddlcarrera_DataBound(object sender, EventArgs e)
    {
        ddlcarrera.Items.Insert(0, "--Carreras--");
    }
    protected void ddlrecinto_DataBound(object sender, EventArgs e)
    {
        ddlrecinto.Items.Insert(0, "--Seleccione--");
    }
    protected void ddlciclo_DataBound(object sender, EventArgs e)
    {
        ddlciclo.Items.Insert(0, "--Seleccione--");
    }
    protected void ddlprovincia_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {

    }
}
