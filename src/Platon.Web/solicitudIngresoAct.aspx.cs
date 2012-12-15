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
    dsUniversidad.tblAdmision_StudentDataTable admisionDT = new dsUniversidad.tblAdmision_StudentDataTable();

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

                    //actualizando el estudiante
                    admisionTA.Update(Convert.ToInt32(txtano.Text), Convert.ToDateTime(txtfechaingreso.Text), txtnombre.Text, txtapellido.Text, rblsexo.SelectedValue, fechanac,
                                                                                    txttelefono.Text, txtcedula.Text, txtdireccion.Text, txtnombrepadre.Text, txtnombremadre.Text, Convert.ToInt32(ddlrecinto.SelectedItem.Value), Convert.ToInt32(ddlciclo.SelectedItem.Value), txtcorreo.Text,
                                                                                    txtNacionalidad.Text, txtPasaporte.Text, txtMedioEntero.Text, soladm, certnac, certmed, cop_cedula, foto, record, cert_edu, tituloSEESCYT, recordSEESCYT,
                                                                                    prueba, true, pensum, txttelefonopadre.Text, txttrabajopadre.Text, ddlestadocivil.SelectedItem.Value,
                                                                                    txtgraduobachiller.Text, txtactivextracurr.Text, txtaccidentenot.Text, txtprobdireccion.Text,
                                                                                    txtprobtelefono.Text, txtlugartrabajo.Text, Convert.ToInt32(txtanosservicio.Text), chkbuenaconducta.Checked, ddlprovincia.SelectedItem.Value, ddlmunicipio.SelectedItem.Value, txtsector.Text,
                                                                                    ddlprovincianacimiento.SelectedItem.Value, ddlmunicipionacimiento.SelectedItem.Value, txtsectornacimiento.Text, ddlTipoCentro.SelectedItem.Value, rblTipoIngreso.SelectedItem.Value, Convert.ToInt32(ddlcarrera.SelectedItem.Value), txtcelular.Text, txttelefonotrabajo.Text, Convert.ToInt32(gvAdmitidos.SelectedDataKey.Value));


                    lblmsg.ForeColor = System.Drawing.Color.Blue;
                    lblmsg.Text = "Los datos han sido actualizados con exito";
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
                lblmsg.Text = "Ha ocurrido un error actualizando los datos" + ex;
            }
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("solicitudIngresoAct.aspx?");
    }
    protected void btnCancelar_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("solicitudIngresoAct.aspx?");
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
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        admisionTA.FillByCod_Stu(admisionDT, Convert.ToInt32(gvAdmitidos.SelectedDataKey.Value));
        foreach (dsUniversidad.tblAdmision_StudentRow fila in admisionDT.Rows)
        {
            txtnombre.Text = fila.nombre.ToString();
            txtapellido.Text = fila.apellido.ToString();
            txtcedula.Text = fila.cedula.ToString();
            txtfechanac.Text = fila.f_nacimiento.ToString();
            txtNacionalidad.Text = fila.nacionalidad.ToString();
            txtdireccion.Text = fila.direccion.ToString();
            txttelefono.Text = fila.telefono.ToString();
            txtcelular.Text = fila.celular.ToString();
            txtcorreo.Text = fila.mail.ToString();
            txtgraduobachiller.Text = fila.graduo_bachiller.ToString();
            txtlugartrabajo.Text = fila.lugar_trabajo.ToString();
            txtaccidentenot.Text = fila.accidente_notificar.ToString();
            txtprobdireccion.Text = fila.prob_direccion.ToString();
            txtprobtelefono.Text = fila.prob_telefono.ToString();
            txtsector.Text = fila.sector.ToString();
            txtsectornacimiento.Text = fila.sectornacimiento.ToString();
            txtPasaporte.Text = fila.pasaporte.ToString();
            txtnombrepadre.Text = fila.n_padre.ToString();
            txtnombremadre.Text = fila.n_madre.ToString();
            txttelefonopadre.Text = fila.telefono_padre.ToString();
            txttrabajopadre.Text = fila.trabajo_padre.ToString();
            txtMedioEntero.Text = fila.Se_entero.ToString();
            txtactivextracurr.Text = fila.actividades_extra.ToString();
            txttelefonotrabajo.Text = fila.telefonotrabajo.ToString();

            rblsexo.SelectedValue = fila.sexo.ToString();
            ddlestadocivil.SelectedItem.Value = fila.estado_civil.ToString();
            ddlcarrera.SelectedValue = fila.id_carrera.ToString();
            ddlrecinto.SelectedValue = fila.id_recinto.ToString();
            ddlciclo.SelectedValue = fila.periodo_entrada.ToString();
            ddlTipoCentro.SelectedValue = fila.Tipo_Centro.ToString();
            rblTipoIngreso.SelectedValue = fila.tipoingreso.ToString();

            chkcertedu.Checked = fila.cert_educacion;
            chkrecord.Checked = fila.rec_notas;
            chkfoto.Checked = fila.fotos;
            chkrecordSEESCYT.Checked = fila.recordSEESCYT;
            chkcertnac.Checked = fila.cert_nac;
            chkced.Checked = fila.cop_cedula;
            chkcertmed.Checked = fila.cert_medico;
            chkbuenaconducta.Checked = fila.cert_buena_conducta;
            chksoladm.Checked = fila.sol_admision;
            chkTituloSEESCYT.Checked = fila.tituloSEESCYT;
        }
    }
}
