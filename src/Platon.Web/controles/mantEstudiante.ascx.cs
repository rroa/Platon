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

public partial class controles_mantEstudiante : System.Web.UI.UserControl
{
    tblReg_StudentTableAdapter RegistroEstudiante = new tblReg_StudentTableAdapter();
    Vista_Dt_EstudianteTableAdapter estudianteta = new Vista_Dt_EstudianteTableAdapter();
    dsUniversidad.Vista_Dt_EstudianteDataTable estudiantedt = new dsUniversidad.Vista_Dt_EstudianteDataTable();
    
    decimal prueba;
    decimal beca;

    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    public void Limpiar()
    {
        txtnombre.Text = "";
        txtapellido.Text = "";
        txtcedula.Text = "";
        txttelefono.Text = "";
        txtdireccion.Text = "";
        txtnombremadre.Text = "";
        txtnombrepadre.Text = "";
        txtcorreo.Text = "";
        txtMedioEntero.Text = "";
        txtBeca.Text = "";
        lblmatricula.Text = "";
        lblIdStu.Text = "";
        ddlcarrera.SelectedIndex = 0;
        ddlciclo.SelectedIndex = 0;
        ddlrecinto.SelectedIndex = 0;
        rblsexo.SelectedIndex = 0;
        chkced.Checked = false;
        chkcertedu.Checked = false;
        chkcertmed.Checked = false;
        chkcertnac.Checked = false;
        chkfoto.Checked = false;
        chkrecord.Checked = false;
        chksoladm.Checked = false;
        lblmsg.Text = "";
        lblEncontrado.Text = "";
        txtPasaporte.Text = "";
        txtNacionalidad.Text = "";
    }


    
    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
        
        try
        {
            estudianteta.FillByMatricula(estudiantedt, txtmatricula.Text);

            foreach (dsUniversidad.Vista_Dt_EstudianteRow fila in estudiantedt.Rows)
            {
                txtfechaingreso.Text = fila.fecha_ingreso.ToShortDateString();
                txtano.Text = fila.ano_ingreso.ToString();
                txtnombre.Text = fila.nombre.ToString();
                txtapellido.Text = fila.apellido.ToString();
                txtcedula.Text = fila.cedula.ToString();
                txtcelular.Text = fila.celular.ToString();
                txttelefono.Text = fila.telefono.ToString();
                txtdireccion.Text = fila.direccion.ToString();
                txtsector.Text = fila.sector.ToString();
                txtfechanac.Text = fila.f_nacimiento.ToString();
                txtsectornac.Text = fila.sectornacimiento.ToString();
                ddlprovincia.SelectedValue = fila.provincia.ToString();
                ddlmunicipio.SelectedValue = fila.municipio.ToString();
                txtPasaporte.Text = fila.pasaporte.ToString();
                txtnombremadre.Text = fila.n_madre.ToString();
                txtnombrepadre.Text = fila.n_padre.ToString();
                txttelefonopadre.Text = fila.telefono_padre.ToString();
                txttrabajopadre.Text = fila.trabajo_padre.ToString();
                ddlciclo.SelectedValue = fila.periodo_entrada.ToString();
                ddlrecinto.SelectedValue = fila.id_recinto.ToString();
                txtcorreo.Text = fila.mail.ToString();
                txtMedioEntero.Text = fila.Se_entero.ToString();
                txtBeca.Text = fila.beca.ToString();
                ddlestadocivil.SelectedValue = fila.estado_civil.ToString();
                txtgraduobachiller.Text = fila.graduo_bachiller.ToString();
                txtactivextracurr.Text = fila.actividades_extra.ToString();
                lblmatricula.Text = fila.matricula.ToString();
                lblIdStu.Text = fila.cod_stu.ToString();
                ddlcarrera.SelectedValue = fila.id_carrera.ToString();
                rblsexo.SelectedValue = fila.sexo.ToString();
                txtNacionalidad.Text = fila.nacionalidad.ToString();
                txtaccidentenot.Text = fila.accidente_notificar.ToString();
                txtprobdireccion.Text = fila.prob_direccion.ToString();
                txtprobtelefono.Text = fila.prob_telefono.ToString();
                txtlugartrabajo.Text = fila.lugar_trabajo.ToString();
                txtanosservicio.Text = fila.anos_servicio.ToString();
                ddlTipoCentro.SelectedValue = fila.Tipo_Centro.ToString();
                rblTipoIngreso.SelectedValue = fila.tipoingreso.ToString();
                txttelefonotrabajo.Text = fila.telefonotrabajo.ToString();
            
                
                
                

                if (fila.sol_admision == true)
                {
                    chksoladm.Checked = true;
                }

                if (fila.cert_nac == true)
                {
                    chkcertnac.Checked = true;
                }

                if (fila.cert_medico == true)
                {
                    chkcertmed.Checked = true;
                }

                if (fila.cop_cedula == true)
                {
                    chkced.Checked = true;
                }

                if (fila.fotos == true)
                {
                    chkfoto.Checked = true;
                }

                if (fila.rec_notas == true)
                {
                    chkrecord.Checked = true;
                }

                if (fila.cert_educacion == true)
                {
                    chkcertedu.Checked = true;
                }

                if (fila.tituloSEESCYT == true)
                {
                    chkTituloSEESCYT.Checked = true;
                }

                if (fila.recordSEESCYT == true)
                {
                    chkrecordSEESCYT.Checked = true;
                }
                if (fila.cert_buena_conducta == true)
                {
                    chkbuenaconducta.Checked = true;
                }






                btnprint.Visible = true;
                lblmsgimpresion.Visible = true;

                beca = Convert.ToDecimal(txtBeca.Text) * 100;
                

                if (beca == 0)
                {

                    txtBeca.Text = "0";
                }
                else
                {
                    beca = Convert.ToDecimal(txtBeca.Text) * 100;
                    txtBeca.Text = string.Format(" {0:###} ", beca);
                }

                

            }
            if (estudiantedt.Rows.Count == 0)
            {
                lblEncontrado.Text = "El estudiante no ha sido encontrado.";
                Limpiar();
                btnprint.Visible = false;
                lblmsgimpresion.Visible = false;
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnCancelar_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
        txtmatricula.Text = "";
        btnprint.Visible = false;
        lblmsgimpresion.Visible = false;
    }
    protected void btnActualizar_Click(object sender, ImageClickEventArgs e)
    {
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

                  bool buenconduc;
                if (chkbuenaconducta.Checked == true)
                {
                    buenconduc = true;
                }
                else
                {
                    buenconduc = false;
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
              
                prueba = Convert.ToDecimal(txtBeca.Text) / 100;

                RegistroEstudiante.Update(Convert.ToInt32(txtano.Text), Convert.ToDateTime(txtfechaingreso.Text),  txtnombre.Text, txtapellido.Text, rblsexo.SelectedValue, txtfechanac.Text, 
                                                          txttelefono.Text, txtcedula.Text, txtdireccion.Text, txtnombrepadre.Text, txtnombremadre.Text, Convert.ToInt32(ddlrecinto.SelectedValue), Convert.ToInt32(ddlciclo.SelectedValue), txtcorreo.Text,
                                                          txtNacionalidad.Text, txtPasaporte.Text, txtMedioEntero.Text, soladm, certnac, certmed,
                                                          cop_cedula, foto, record, cert_edu, tituloSEESCYT,recordSEESCYT, prueba, true,txttelefonopadre.Text, txttrabajopadre.Text, ddlestadocivil.SelectedValue, txtgraduobachiller.Text, 
                                                          txtactivextracurr.Text, txtaccidentenot.Text, txtprobdireccion.Text, txtprobtelefono.Text, txtlugartrabajo.Text, Convert.ToInt32(txtanosservicio.Text), buenconduc, ddlprovincia.SelectedValue, ddlmunicipio.SelectedValue, txtsector.Text, ddlprovincianac.SelectedValue, ddlmunicipionac.SelectedValue, txtsectornac.Text,  ddlTipoCentro.SelectedValue, rblTipoIngreso.SelectedItem.Value, txtcelular.Text, txttelefonotrabajo.Text, Convert.ToInt32(lblIdStu.Text));
            }

            lblmsg.ForeColor = System.Drawing.Color.Blue;
            lblmsg.Text = "Los datos han sido actualizados";
            btnprint.Visible = true;
            lblmsgimpresion.Visible = true;

        }
        catch (Exception ex)
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Ha ocurrido un error actualizando los datos, intente nuevamente.";
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Session["matricula_inscri"] = lblmatricula.Text;
        Response.Redirect("ImpresiondeAdmision.aspx");
    }
    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            txtmatricula.Text = Session["copiarmatricula"].ToString();
        }
        catch (Exception ex)
        {

        }
    }
}
