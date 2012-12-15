<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="solicitudIngreso.aspx.cs" Inherits="solicitudIngreso" %>
<%@  Register TagPrefix="ew"   Namespace="eWorld.UI.Compatibility"  Assembly="eWorld.UI.Compatibility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 23px; font-family: Arial">SOLICITUD DE INGRESO
        <hr />
    </span>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 909px; height: 100%">
        <tr>
            <td align="center" style="width: 864px" valign="top">
                <table id="TABLE1" border="0" cellpadding="0" cellspacing="0" language="javascript"
                    onclick="return TABLE1_onclick()" style="border-right: black 1px solid; border-top: black 1px solid;
                    font-size: 12px; border-left: black 1px solid; width: 908px; border-bottom: black 1px solid;
                    font-family: Arial">
                    <tr>
                        <td colspan="2" style="padding-left: 5px; border-bottom: black 1px solid; height: 30px;
                            background-color: whitesmoke">
                            <strong>REGISTRO DE DATOS PERSONALES</strong></td>
                        <td colspan="1" style="padding-left: 5px; width: 30px; border-bottom: black 1px solid;
                            height: 30px; background-color: whitesmoke">
                        </td>
                        <td colspan="2" style="padding-left: 5px; border-bottom: black 1px solid; height: 30px;
                            background-color: whitesmoke">
                            <strong>INSCRIPCION EN CARRERA</strong></td>
                    </tr>
                    <tr>
                        <td style="width: 203px">
                        </td>
                        <td style="width: 252px">
                        </td>
                        <td style="width: 30px">
                        </td>
                        <td style="width: 120px">
                        </td>
                        <td style="width: 353px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="padding-left: 5px; width: 203px">
                            <strong>Fecha de Ingreso</strong></td>
                        <td align="left" style="padding-left: 5px; width: 252px">
                            <asp:TextBox ID="txtfechaingreso" runat="server" Font-Names="Arial" Font-Size="12px"
                                TabIndex="1" Width="200px"></asp:TextBox></td>
                        <td style="padding-left: 5px; font-size: 12px; width: 30px">
                        </td>
                        <td style="padding-left: 5px; width: 120px">
                            Año de ingreso</td>
                        <td style="padding-left: 5px; width: 353px">
                            <asp:TextBox ID="txtano" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="padding-left: 5px; width: 203px">
                            <strong>Nombre</strong></td>
                        <td align="left" style="padding-left: 5px; width: 252px">
                            <asp:TextBox ID="txtnombre" runat="server" Font-Names="Arial" Font-Size="12px" TabIndex="1"
                                Width="200px"></asp:TextBox>
                            <span style="font-size: 18px; color: #ff0000"><strong>*</strong></span></td>
                        <td style="padding-left: 5px; font-size: 12px; width: 30px">
                        </td>
                        <td style="padding-left: 5px; width: 120px">
                            <strong>Carrera</strong></td>
                        <td style="padding-left: 5px; width: 353px">
                            <asp:DropDownList ID="ddlcarrera" runat="server" DataSourceID="objCarrera" DataTextField="carrera_nombre"
                                DataValueField="id_carrera" Font-Names="Arial" Font-Size="12px" OnDataBound="ddlcarrera_DataBound"
                                TabIndex="19" Width="200px">
                            </asp:DropDownList>
                            <strong><span style="font-size: 18px; color: #ff0000">*</span></strong><asp:ObjectDataSource
                                ID="objCarrera" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.CarreraTableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_id_carrera" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="carrera_nombre" Type="String" />
                                    <asp:Parameter Name="carrera_cant_credito" Type="Int32" />
                                    <asp:Parameter Name="Original_id_carrera" Type="Int32" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="carrera_nombre" Type="String" />
                                    <asp:Parameter Name="carrera_cant_credito" Type="Int32" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                            <strong></strong>
                        </td>
                    </tr>
                    <tr style="font-weight: bold">
                        <td align="left" style="padding-left: 5px; width: 203px; height: 10px">
                            Apellido</td>
                        <td align="left" style="padding-left: 5px; font-size: 9pt; width: 252px; height: 10px">
                            <asp:TextBox ID="txtapellido" runat="server" Font-Names="Arial" Font-Size="12px"
                                TabIndex="2" Width="200px"></asp:TextBox>
                            <span style="color: #000000">*</span></td>
                        <td style="padding-left: 5px; font-size: 9pt; width: 30px; color: #000000; height: 10px">
                        </td>
                        <td style="padding-left: 5px; font-size: 9pt; width: 120px; color: #000000; height: 10px">
                            Tipo de ingreso</td>
                        <td style="padding-left: 5px; font-size: 8pt; width: 353px; height: 10px" valign="bottom">
                            <br />
                            <asp:RadioButtonList ID="rblTipoIngreso" runat="server" Font-Names="Arial" Font-Size="13px"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">Nuevo</asp:ListItem>
                                <asp:ListItem>Transferido</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td align="left" style="padding-left: 5px; width: 203px; height: 21px">
                            Cédula</td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 21px">
                            <ew:maskedtextbox id="txtcedula" runat="server" font-names="Arial" font-size="12px"
                                mask="999-9999999-9" maxlength="13" tabindex="3" validationexpression="\d{3}-\d{7}-\d{1}"
                                width="200px"></ew:maskedtextbox>
                        </td>
                        <td style="padding-left: 5px; width: 30px; height: 21px">
                        </td>
                        <td style="padding-left: 5px; width: 120px; height: 21px">
                        </td>
                        <td style="padding-left: 5px; width: 353px; height: 21px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="padding-left: 5px; width: 203px; height: 21px">
                            Estado Civil</td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 21px">
                            <asp:DropDownList ID="ddlestadocivil" runat="server" Width="112px">
                                <asp:ListItem>soltero</asp:ListItem>
                                <asp:ListItem>casado</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="padding-left: 5px; width: 30px; height: 21px">
                        </td>
                        <td style="padding-left: 5px; width: 120px; height: 21px">
                        </td>
                        <td style="padding-left: 5px; width: 353px; height: 21px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="padding-left: 5px; width: 203px">
                            Sexo</td>
                        <td align="left" style="padding-left: 5px; width: 252px">
                            <asp:RadioButtonList ID="rblsexo" runat="server" Font-Names="Arial" Font-Size="12px"
                                RepeatColumns="2" TabIndex="4">
                                <asp:ListItem>F</asp:ListItem>
                                <asp:ListItem>M</asp:ListItem>
                            </asp:RadioButtonList></td>
                        <td style="padding-left: 5px; font-size: 8pt; width: 30px; color: #ff0000">
                        </td>
                        <td style="padding-left: 5px; font-size: 8pt; width: 120px; color: #ff0000">
                        </td>
                        <td style="padding-left: 5px; width: 353px" valign="middle">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="padding-left: 5px; width: 203px">
                            Teléfono</td>
                        <td align="left" style="padding-left: 5px; width: 252px">
                            <ew:maskedtextbox id="txttelefono" runat="server" font-names="Arial" font-size="12px"
                                mask="999-999-9999" maxlength="12" tabindex="5" validationexpression="\d{3}-\d{3}-\d{4}"
                                width="200px"></ew:maskedtextbox>
                        </td>
                        <td style="padding-left: 5px; width: 30px">
                        </td>
                        <td style="padding-left: 5px; width: 120px">
                        </td>
                        <td style="padding-left: 5px; width: 353px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="padding-left: 5px; width: 203px">
                            Celular</td>
                        <td align="left" style="padding-left: 5px; width: 252px">
                            <ew:MaskedTextBox ID="txtcelular" runat="server" Font-Names="Arial" Font-Size="12px"
                                Mask="999-999-9999" MaxLength="12" TabIndex="5" ValidationExpression="\d{3}-\d{3}-\d{4}"
                                Width="200px"></ew:MaskedTextBox></td>
                        <td style="padding-left: 5px; width: 30px">
                        </td>
                        <td style="padding-left: 5px; width: 120px">
                        </td>
                        <td style="padding-left: 5px; width: 353px">
                        </td>
                    </tr>
                    <tr style="font-size: 9pt">
                        <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                            <span style="font-size: 8pt"><span style="color: #ff0000">Calle / No. / Apto.<br />
                            </span><span style="font-size: 9pt">Dirección</span></span></td>
                        <td align="left" style="padding-left: 5px; font-size: 9pt; width: 252px; height: 32px">
                            <asp:TextBox ID="txtdireccion" runat="server" Font-Names="Arial" Font-Size="12px"
                                TabIndex="6" TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                        <td style="padding-left: 5px; font-size: 9pt; width: 30px; height: 32px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; font-size: 9pt; height: 32px; text-align: left">
                            <span></span>
                        </td>
                    </tr>
                    <tr style="font-size: 9pt">
                        <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                            Sector Actual<br />
                            <strong><span>Dirección</span></strong></td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 32px">
                            <asp:TextBox ID="txtsector" runat="server" Width="201px"></asp:TextBox></td>
                        <td style="padding-left: 5px; width: 30px; height: 32px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 32px; text-align: left">
                            <strong><span></span></strong>
                        </td>
                    </tr>
                    <tr style="font-size: 9pt">
                        <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                            Provincia Actual</td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 32px">
                            <asp:DropDownList ID="ddlprovincia" runat="server" AutoPostBack="True" DataSourceID="Objprovincia"
                                DataTextField="provincia" DataValueField="cod_prov"
                                Width="202px">
                            </asp:DropDownList></td>
                        <td style="padding-left: 5px; width: 30px; height: 32px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 32px; text-align: left">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                            Municipio Actual</td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 32px">
                            <asp:DropDownList ID="ddlmunicipio" runat="server" AutoPostBack="True" DataSourceID="ObjMunicipio"
                                DataTextField="municipio" DataValueField="cod_mun" Width="202px">
                            </asp:DropDownList></td>
                        <td style="padding-left: 5px; width: 30px; height: 32px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 32px; text-align: left">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="padding-left: 5px; width: 203px; height: 24px">
                            Pasaporte</td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 24px">
                            <asp:TextBox ID="txtPasaporte" runat="server" TabIndex="7" Width="200px"></asp:TextBox></td>
                        <td style="padding-left: 5px; width: 30px; height: 24px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 24px; text-align: left">
                            <span>En Caso de Problemas</span></td>
                    </tr>
                    <tr>
                        <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                            Nacionalidad</td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 32px">
                            <asp:TextBox ID="txtNacionalidad" runat="server" TabIndex="8" Width="200px"></asp:TextBox></td>
                        <td style="padding-left: 5px; width: 30px; height: 32px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 32px; text-align: left">
                            En caso de accidente notificar a &nbsp;<br />
                            <asp:TextBox ID="txtaccidentenot" runat="server" Width="205px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                            Fecha de Nacimiento</td>
                        <td align="left" style="padding-left: 5px; font-size: 9pt; width: 252px; height: 32px">
                            <asp:TextBox ID="txtfechanac" runat="server" TabIndex="8" Width="200px"></asp:TextBox>&nbsp;
                            <span style="color: #ff0000"><span style="color: #000000">*<br />
                            </span><span style="color: #000000">&nbsp; Ej.: 21 / 12 / 1980</span></span></td>
                        <td style="padding-left: 5px; font-size: 9pt; width: 30px; color: #000000; height: 32px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; font-size: 9pt; color: #000000; height: 32px;
                            text-align: left">
                            Dirección<br />
                            <asp:TextBox ID="txtprobdireccion" runat="server" TextMode="MultiLine" Width="205px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                            <strong>Provincia de Nacimiento</strong></td>
                        <td align="left" style="padding-left: 5px; font-weight: bold; width: 252px; height: 32px">
                            <asp:DropDownList ID="ddlprovincianacimiento" runat="server" AutoPostBack="True"
                                DataSourceID="odsProvinciaNac" DataTextField="provincia" DataValueField="cod_prov"
                                OnSelectedIndexChanged="ddlprovincia_SelectedIndexChanged" Width="202px">
                            </asp:DropDownList></td>
                        <td style="padding-left: 5px; width: 30px; height: 32px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 32px; text-align: left">
                            Tel<span lang="ES-DO" style="line-height: 115%; mso-ansi-language: ES-DO; mso-ascii-theme-font: minor-latin;
                                mso-fareast-font-family: 'Times New Roman'; mso-fareast-theme-font: minor-fareast;
                                mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi;
                                mso-fareast-language: EN-US; mso-bidi-language: AR-SA">é</span>fono<br />
                            <ew:maskedtextbox id="txtprobtelefono" runat="server" font-names="Arial" font-size="12px"
                                mask="999-999-9999" maxlength="12" tabindex="5" validationexpression="\d{3}-\d{3}-\d{4}"
                                width="204px"></ew:maskedtextbox>
                        </td>
                    </tr>
                    <tr style="font-size: 9pt; font-family: Arial">
                        <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                            Municipio de Nacimiento</td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 32px">
                            <asp:DropDownList ID="ddlmunicipionacimiento" runat="server" AutoPostBack="True"
                                DataSourceID="odsMunicipioNac" DataTextField="municipio" DataValueField="cod_mun"
                                Width="202px">
                            </asp:DropDownList></td>
                        <td style="padding-left: 5px; width: 30px; height: 32px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 32px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                            Sector de Nacimiento</td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 32px">
                            <asp:TextBox ID="txtsectornacimiento" runat="server" Width="201px"></asp:TextBox></td>
                        <td style="padding-left: 5px; width: 30px; height: 32px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 32px; text-align: left">
                            <strong>Referencia&nbsp; de Trabajo</strong></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td align="left" style="padding-left: 5px; width: 203px">
                            Nombre del padre</td>
                        <td align="left" style="padding-left: 5px; width: 252px">
                            <span style="color: #ff0000">
                                <asp:TextBox ID="txtnombrepadre" runat="server" Font-Names="Arial" Font-Size="12px"
                                    TabIndex="12" Width="200px"></asp:TextBox></span></td>
                        <td style="padding-left: 5px; font-size: 12px; width: 30px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; text-align: left">
                            <span>Lugar de trabajo &nbsp; &nbsp; &nbsp;
                                <asp:TextBox ID="txtlugartrabajo" runat="server" Width="203px"></asp:TextBox></span></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td align="left" style="padding-left: 5px; width: 203px; height: 21px">
                            Nombre de la madre</td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 21px">
                            <asp:TextBox ID="txtnombremadre" runat="server" Font-Names="Arial" Font-Size="12px"
                                TabIndex="13" Width="200px"></asp:TextBox></td>
                        <td style="padding-left: 5px; width: 30px; height: 21px">
                        </td>
                        <td align="left" colspan="2" style="padding-left: 5px; height: 21px">
                            Teléfono del trabajo
                            <ew:MaskedTextBox ID="txttelefonotrabajo" runat="server" Font-Names="Arial" Font-Size="12px"
                                Mask="999-999-9999" MaxLength="12" TabIndex="5" ValidationExpression="\d{3}-\d{3}-\d{4}"
                                Width="204px"></ew:MaskedTextBox></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td align="left" style="padding-left: 5px; width: 203px; height: 13px">
                            Telefono del padre</td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 13px">
                            <ew:maskedtextbox id="txttelefonopadre" runat="server" font-names="Arial" font-size="12px"
                                mask="999-999-9999" maxlength="12" tabindex="5" validationexpression="\d{3}-\d{3}-\d{4}"
                                width="200px"></ew:maskedtextbox>
                        </td>
                        <td style="padding-left: 5px; width: 30px; height: 13px">
                        </td>
                        <td align="left" colspan="2" style="padding-left: 5px; height: 13px">
                            <span>
                            Años de servicio&nbsp;
                            <asp:TextBox ID="txtanosservicio" runat="server" Width="75px">0</asp:TextBox><span
                                style="font-size: 8pt; color: #ff0000"><strong>(solo números)</strong></span></span></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td align="left" style="padding-left: 5px; width: 203px; height: 13px">
                            Lugar de trabaja y cargo del padre</td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 13px">
                            <asp:TextBox ID="txttrabajopadre" runat="server"></asp:TextBox></td>
                        <td style="padding-left: 5px; width: 30px; height: 13px">
                        </td>
                        <td align="left" colspan="2" style="padding-left: 5px; height: 13px; text-align: left">
                            <strong>Requisitos de Admisión</strong></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td align="left" style="padding-left: 5px; width: 203px; height: 13px">
                            <strong>
                            Recinto</strong></td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 13px">
                            <asp:DropDownList ID="ddlrecinto" runat="server" DataSourceID="objRecinto" DataTextField="siglas"
                                DataValueField="id_recinto" Font-Names="Arial" Font-Size="12px" OnDataBound="ddlrecinto_DataBound"
                                TabIndex="14" Width="200px">
                            </asp:DropDownList></td>
                        <td style="padding-left: 5px; width: 30px; height: 13px">
                        </td>
                        <td align="left" colspan="2" style="padding-left: 5px; height: 13px; text-align: left">
                            <asp:CheckBox ID="chksoladm" runat="server" Font-Bold="False" TabIndex="20" Text="Formulario de Solicitud de Admisión "
                                Width="284px" /></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td align="left" style="padding-left: 5px; width: 203px">
                            <strong>
                            Período de entrada</strong></td>
                        <td align="left" style="padding-left: 5px; width: 252px">
                            <asp:DropDownList ID="ddlciclo" runat="server" DataSourceID="objCiclo" DataTextField="descripcion"
                                DataValueField="id_periodo" Font-Names="Arial" Font-Size="12px" OnDataBound="ddlciclo_DataBound"
                                TabIndex="15" Width="200px">
                            </asp:DropDownList></td>
                        <td style="padding-left: 5px; width: 30px">
                        </td>
                        <td align="left" colspan="2" style="padding-left: 5px">
                            <asp:CheckBox ID="chkfoto" runat="server" TabIndex="24" Text="Cuatro (4) fotografías 2 x 2 "
                                Width="300px" /></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td align="left" style="padding-left: 5px; width: 203px">
                            Correo</td>
                        <td align="left" style="padding-left: 5px; width: 252px">
                            <asp:TextBox ID="txtcorreo" runat="server" Font-Names="Arial" Font-Size="12px" TabIndex="16"
                                Width="200px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtcorreo"
                                ErrorMessage="Correo inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                        <td style="padding-left: 5px; width: 30px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; text-align: left">
                            &nbsp;<asp:CheckBox ID="chkcertnac" runat="server" TabIndex="21" Text="Certificado Oficial de Nacimiento "
                                Width="289px" /></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td align="left" style="padding-left: 5px; width: 203px">
                            ¿Por que medio se enteró
                            <br />
                            de la universidad?</td>
                        <td align="left" style="padding-left: 5px; width: 252px">
                            <asp:TextBox ID="txtMedioEntero" runat="server" TabIndex="17" Width="200px"></asp:TextBox></td>
                        <td style="padding-left: 5px; width: 30px">
                        </td>
                        <td align="left" colspan="2" style="padding-left: 5px">
                            &nbsp;<asp:CheckBox ID="chkcertedu" runat="server" TabIndex="26" Text="Certificado y Copia del Diploma de Conclusión de la Educación Media (Secundaria) "
                                Width="302px" /></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td align="left" style="padding-left: 5px; width: 203px; height: 24px">
                            Porciento de Beca</td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 24px">
                            <asp:TextBox ID="txtBeca" runat="server" TabIndex="18" Width="29px">0</asp:TextBox>%</td>
                        <td style="padding-left: 5px; width: 30px; height: 24px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 24px; text-align: left">
                            &nbsp;
                            <asp:CheckBox ID="chkrecord" runat="server" TabIndex="25" Text="Récord de Notas Certificado"
                                Width="300px" /></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td align="left" style="padding-left: 5px; width: 203px; height: 24px">
                            </td>
                        <td align="left" style="padding-left: 5px; width: 252px; height: 24px">
                            </td>
                        <td style="padding-left: 5px; width: 30px; height: 24px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 24px; text-align: left">
                            <asp:CheckBox ID="chkbuenaconducta" runat="server" Text="Certificado de Buena Conducta" /></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td style="width: 203px; text-align: left">
                            &nbsp;Tipo de Centro</td>
                        <td align="left" style="width: 252px">
                            &nbsp;
                            <asp:DropDownList ID="ddlTipoCentro" runat="server" Width="155px">
                                <asp:ListItem>Colegio</asp:ListItem>
                                <asp:ListItem>Escuela</asp:ListItem>
                                <asp:ListItem>Liceo</asp:ListItem>
                                <asp:ListItem>Politecnico</asp:ListItem>
                                <asp:ListItem Value="Universidad"></asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 30px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; text-align: left">
                            <asp:CheckBox ID="chkced" runat="server" TabIndex="23" Text="Copia de Cédula " Width="300px" /></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td style="width: 203px; height: 24px; text-align: left">
                            &nbsp;Centro de proveniencia</td>
                        <td align="left" style="width: 252px; height: 24px">
                            &nbsp;
                            <asp:TextBox ID="txtgraduobachiller" runat="server"></asp:TextBox></td>
                        <td style="width: 30px; height: 24px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 24px; text-align: left">
                            &nbsp;<asp:CheckBox ID="chkcertmed" runat="server" TabIndex="22" Text="Certificado Médico Oficial "
                                Width="300px" /></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td style="width: 203px; height: 15px; text-align: left">
                            Actividades extracurriculares</td>
                        <td align="left" style="width: 252px; height: 15px">
                            &nbsp;
                            <asp:TextBox ID="txtactivextracurr" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                        <td style="width: 30px; height: 15px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 15px; text-align: left">
                            <strong>Requisitos de estudiantes transferidos o graduados</strong></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td style="width: 203px; height: 20px; text-align: left">
                        </td>
                        <td align="left" style="width: 252px; height: 20px">
                        </td>
                        <td style="width: 30px; height: 20px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 20px; text-align: left">
                            <asp:CheckBox ID="chkTituloSEESCYT" runat="server" Text="Certificación de título legalizado por la SEESCYT" /></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td style="width: 203px; height: 15px; text-align: left">
                        </td>
                        <td align="left" style="width: 252px; height: 15px">
                            &nbsp;</td>
                        <td style="width: 30px; height: 15px">
                        </td>
                        <td colspan="2" style="padding-left: 5px; height: 15px; text-align: left">
                            <asp:CheckBox ID="chkrecordSEESCYT" runat="server" Text="Record de notas legalizado por la SEESCYT" /></td>
                    </tr>
                    <tr style="font-family: Arial">
                        <td style="width: 203px; height: 38px">
                        </td>
                        <td style="width: 252px; height: 38px">
                            <asp:ObjectDataSource ID="objRecinto" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.RecintoTableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_id_recinto" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="recinto_nombre" Type="String" />
                                    <asp:Parameter Name="siglas" Type="String" />
                                    <asp:Parameter Name="rec_dir" Type="String" />
                                    <asp:Parameter Name="rec_tel" Type="String" />
                                    <asp:Parameter Name="Original_id_recinto" Type="Int32" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="recinto_nombre" Type="String" />
                                    <asp:Parameter Name="siglas" Type="String" />
                                    <asp:Parameter Name="rec_dir" Type="String" />
                                    <asp:Parameter Name="rec_tel" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="objCiclo" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.PeriodoTableAdapter">
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="Objprovincia" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.provinciasTableAdapter">
                                <InsertParameters>
                                    <asp:Parameter Name="cod_prov" Type="String" />
                                    <asp:Parameter Name="provincia" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsProvinciaNac" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.provinciasTableAdapter">
                                <InsertParameters>
                                    <asp:Parameter Name="cod_prov" Type="String" />
                                    <asp:Parameter Name="provincia" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="ObjMunicipio" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataByCod_Provincia" TypeName="dsUniversidadTableAdapters.municipioTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlprovincia" Name="cod_provincia" PropertyName="SelectedValue"
                                        Type="String" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="cod_mun" Type="String" />
                                    <asp:Parameter Name="municipio" Type="String" />
                                    <asp:Parameter Name="cod_provincia" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="odsMunicipioNac" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataByCod_Provincia" TypeName="dsUniversidadTableAdapters.municipioTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlprovincianacimiento" Name="cod_provincia" PropertyName="SelectedValue"
                                        Type="String" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="cod_mun" Type="String" />
                                    <asp:Parameter Name="municipio" Type="String" />
                                    <asp:Parameter Name="cod_provincia" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                        <td style="width: 30px; height: 38px">
                        </td>
                        <td style="width: 120px; height: 38px">
                        </td>
                        <td style="width: 353px; height: 38px">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 864px; height: 25px" valign="top">
                <span style="font-size: 12px; font-family: Arial"><strong>
                    <br />
                    NOTA:</strong><br />
                    Los campos con asterisco <span style="font-size: 18px">(<span style="color: #ff0000"><strong>*</strong></span>)</span>
                    deben ser completados obligatoriamente.<br />
                </span>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="1" style="width: 864px; height: 31px" valign="top">
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label><br />
                <asp:ListBox ID="ListBox1" runat="server" Height="115px" Visible="False" Width="397px">
                </asp:ListBox><br />
                &nbsp;<asp:Label ID="lblmsgimpresion" runat="server" Font-Names="Arial" Font-Size="12px"
                    Height="43px" Text="Click en la imagen para imprimir el formulario de solicitud"
                    Visible="False" Width="202px"></asp:Label>
                <asp:ImageButton ID="btnprint" runat="server" ImageUrl="~/images/print.jpg" OnClick="ImageButton2_Click"
                    Visible="False" /></td>
        </tr>
        <tr>
            <td align="center" colspan="1" style="border-right: black 1px solid; border-top: black 1px solid;
                border-left: black 1px solid; width: 864px; border-bottom: black 1px solid; height: 40px"
                valign="middle">
                &nbsp;<asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                    OnClick="btnGuardar_Click" TabIndex="27" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
                    OnClick="ImageButton1_Click" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/images/botones/btn_cancelar.jpg"
                    OnClick="btnCancelar_Click" /></td>
        </tr>
    </table>
</asp:Content>

