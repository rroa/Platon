<%@ Control Language="C#" AutoEventWireup="true" CodeFile="mantEstudiante.ascx.cs" Inherits="controles_mantEstudiante" %>
<%@  Register TagPrefix="ew"   Namespace="eWorld.UI.Compatibility"  Assembly="eWorld.UI.Compatibility" %>

<span style="font-size: 24px; font-family: Arial">MANTENIMIENTO DE ESTUDIANTES
    <hr />
</span>
<br />

<table border="0" cellpadding="0" cellspacing="0" style="width: 909px; height: 100%">
    <tr>
        <td align="center" style="width: 864px" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; width: 908px;
                border-bottom: black 1px solid; font-family: Arial">
                <tr>
                    <td colspan="5" style="padding-left: 5px; border-bottom: black 1px solid; height: 30px;
                        background-color: whitesmoke">
                        <table>
                            <tr>
                                <td style="width: 100px">
                                    <strong>
                                    Matr&iacute;cula</strong></td>
                                <td style="width: 100px">
                                    <ew:MaskedTextBox ID="txtmatricula" runat="server" Font-Names="Arial" Font-Size="12px"
                                        Mask="99-9999" MaxLength="7" ValidationExpression="\d{2}-\d{4}" Width="150px"></ew:MaskedTextBox>&nbsp;</td>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/edit.gif"
                                        OnClick="ImageButton1_Click1" />
                                    <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                                        OnClick="btnBuscar_Click" /></td>
                            </tr>
                        </table>
                        <asp:Label ID="lblEncontrado" runat="server" Font-Bold="True" ForeColor="#FF0000"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left: 5px; border-bottom: black 1px solid; height: 19px;
                        background-color: whitesmoke">
                    </td>
                    <td colspan="1" style="padding-left: 5px; width: 30px; border-bottom: black 1px solid;
                        height: 19px; background-color: whitesmoke">
                    </td>
                    <td colspan="2" style="padding-left: 5px; border-bottom: black 1px solid; height: 19px;
                        background-color: whitesmoke">
                    </td>
                </tr>
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
                    <td style="height: 15px">
                    </td>
                    <td style="width: 252px; height: 15px;">
                    </td>
                    <td style="width: 30px; height: 15px;">
                    </td>
                    <td style="width: 98px; height: 15px;">
                    </td>
                    <td style="width: 354px; height: 15px;">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        <strong>Fecha de Ingreso</strong></td>
                    <td align="left" style="padding-left: 5px; width: 252px">
                        <asp:TextBox ID="txtfechaingreso" runat="server" Font-Names="Arial" Font-Size="12px"
                            TabIndex="1" Width="200px"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 98px">
                        Año de ingreso</td>
                    <td style="padding-left: 5px; width: 354px">
                        <asp:TextBox ID="txtano" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        Nombre</td>
                    <td align="left" style="padding-left: 5px; width: 252px">
                        <asp:TextBox ID="txtnombre" runat="server" Font-Names="Arial" Font-Size="12px"
                            TabIndex="1" Width="200px"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 98px">
                        <strong>Carrera:</strong></td>
                    <td style="padding-left: 5px; width: 354px">
                        <asp:DropDownList ID="ddlcarrera" runat="server" DataSourceID="objCarrera" DataTextField="carrera_nombre"
                            DataValueField="id_carrera" Font-Names="Arial" Font-Size="12px" TabIndex="15"
                            Width="180px">
                        </asp:DropDownList><asp:ObjectDataSource ID="objCarrera" runat="server" DeleteMethod="Delete"
                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                            TypeName="dsUniversidadTableAdapters.CarreraTableAdapter" UpdateMethod="Update">
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
                        Nota : Para cambiar de carrera debe ir al formulario de <a href="CambioCarrera.aspx">cambio de carreras.</a><strong></strong></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 21px">
                        Apellido</td>
                    <td align="left" style="padding-left: 5px; width: 252px; color: #ff0000; height: 21px">
                        <asp:TextBox ID="txtapellido" runat="server" Font-Names="Arial" Font-Size="12px"
                            TabIndex="2" Width="200px"></asp:TextBox>
                    </td>
                    <td style="padding-left: 5px; width: 30px; height: 21px">
                    </td>
                    <td style="padding-left: 5px; width: 98px; height: 21px">
                    </td>
                    <td style="padding-left: 5px; width: 354px; height: 21px">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 21px">
                        C&eacute;dula</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 21px">
                        <ew:maskedtextbox id="txtcedula" runat="server" font-names="Arial" Font-Size="12px"
                            mask="999-9999999-9" maxlength="13" validationexpression="\d{3}-\d{7}-\d{1}"
                            width="200px"></ew:maskedtextbox>
                    </td>
                    <td style="padding-left: 5px; width: 30px; height: 21px">
                    </td>
                    <td style="padding-left: 5px; width: 98px; height: 21px">
                    </td>
                    <td style="padding-left: 5px; width: 354px; height: 21px">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 21px">
                        Estado Civil</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 21px">
                        <asp:DropDownList ID="ddlestadocivil" runat="server" Width="112px">
                            <asp:ListItem Value="s">soltero</asp:ListItem>
                            <asp:ListItem Value="c">casado</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="padding-left: 5px; width: 30px; height: 21px">
                    </td>
                    <td style="padding-left: 5px; width: 98px; height: 21px">
                    </td>
                    <td style="padding-left: 5px; width: 354px; height: 21px">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        Sexo</td>
                    <td align="left" style="padding-left: 5px; width: 252px">
                        <asp:RadioButtonList ID="rblsexo" runat="server" Font-Names="Arial" Font-Size="12px"
                            RepeatColumns="2" TabIndex="4">
                            <asp:ListItem>F</asp:ListItem>
                            <asp:ListItem>M</asp:ListItem>
                        </asp:RadioButtonList></td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 98px">
                        Matr&iacute;cula:</td>
                    <td style="padding-left: 5px; width: 354px">
                        <asp:Label ID="lblmatricula" runat="server" Font-Bold="True" Font-Size="15pt"></asp:Label>
                        <asp:Label ID="lblIdStu" runat="server" Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        Fecha de Nacimiento</td>
                    <td align="left" style="padding-left: 5px; width: 252px">
                        <asp:TextBox ID="txtfechanac" runat="server" Font-Names="Arial" Font-Size="12px"
                            TabIndex="2" Width="200px"></asp:TextBox><br />
                        <span style="font-size: 8pt; color: #ff0000">Ej.: 21 / 12 / 1980&nbsp; dd/mm/aaaa</span></td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 98px">
                        Tipo de Ingreso</td>
                    <td style="padding-left: 5px; width: 354px">
                        <asp:RadioButtonList ID="rblTipoIngreso" runat="server" Font-Names="Arial" Font-Size="13px"
                            RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True">Nuevo</asp:ListItem>
                            <asp:ListItem>Transferido</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        Tel&eacute;fono</td>
                    <td align="left" style="padding-left: 5px; width: 252px">
                        <ew:maskedtextbox id="txttelefono" runat="server" font-names="Arial" Font-Size="12px"
                            mask="999-999-9999" maxlength="12" validationexpression="\d{3}-\d{3}-\d{4}" width="200px"></ew:maskedtextbox>
                    </td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 98px">
                    </td>
                    <td style="padding-left: 5px; width: 354px">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 15px">
                        Celular</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 15px">
                        <ew:MaskedTextBox ID="txtcelular" runat="server" Font-Names="Arial" Font-Size="12px"
                            Mask="999-999-9999" MaxLength="12" ValidationExpression="\d{3}-\d{3}-\d{4}" Width="200px"></ew:MaskedTextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 15px">
                    </td>
                    <td style="padding-left: 5px; width: 98px; height: 15px">
                    </td>
                    <td style="padding-left: 5px; width: 354px; height: 15px">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px;">
                        Calle / No. / Apto.<br />
                        <span style="font-size: 8pt"><strong>Dirección</strong></span></td>
                    <td align="left" style="padding-left: 5px; width: 252px;">
                        <asp:TextBox ID="txtdireccion" runat="server" Font-Names="Arial" Font-Size="12px"
                            TabIndex="6" Width="238px"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px;">
                    </td>
                    <td style="padding-left: 5px; width: 98px;">
                    </td>
                    <td style="padding-left: 5px; width: 354px;">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        Sector<br />
                        <strong><span style="font-size: 8pt">Dirección</span></strong></td>
                    <td align="left" style="padding-left: 5px; width: 252px">
                        <asp:TextBox ID="txtsector" runat="server" Width="201px"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 98px">
                    </td>
                    <td style="padding-left: 5px; width: 354px" align="left">
                        <strong><span>En Caso de Problemas</span></strong></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        Provincia</td>
                    <td align="left" style="padding-left: 5px; width: 252px">
                        <asp:DropDownList ID="ddlprovincia" runat="server" AutoPostBack="True" DataSourceID="Objprovincia"
                            DataTextField="provincia" DataValueField="cod_prov" 
                            Width="202px">
                        </asp:DropDownList><asp:ObjectDataSource ID="Objprovincia" runat="server" InsertMethod="Insert"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.provinciasTableAdapter">
                            <InsertParameters>
                                <asp:Parameter Name="cod_prov" Type="String" />
                                <asp:Parameter Name="provincia" Type="String" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 98px">
                    </td>
                    <td style="padding-left: 5px; width: 354px" align="left">
                        En caso de accidente notificar a<br />
                        <asp:TextBox ID="txtaccidentenot" runat="server" Width="245px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        Municipio</td>
                    <td align="left" style="padding-left: 5px; width: 252px">
                        <asp:DropDownList ID="ddlmunicipio" runat="server" AutoPostBack="True" DataSourceID="ObjMunicipio"
                            DataTextField="municipio" DataValueField="cod_mun" Width="202px">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjMunicipio" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.municipioTableAdapter">
                            <InsertParameters>
                                <asp:Parameter Name="cod_mun" Type="String" />
                                <asp:Parameter Name="municipio" Type="String" />
                                <asp:Parameter Name="cod_provincia" Type="String" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 98px">
                    </td>
                    <td style="padding-left: 5px; width: 354px" align="left">
                        Dirección<br />
                        <asp:TextBox ID="txtprobdireccion" runat="server" TextMode="MultiLine" Width="246px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        Provincia de Nacimiento</td>
                    <td align="left" style="padding-left: 5px; width: 252px">
                        <asp:DropDownList ID="ddlprovincianac" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1"
                            DataTextField="provincia" DataValueField="cod_prov" 
                            Width="202px">
                        </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.provinciasTableAdapter">
                            <InsertParameters>
                                <asp:Parameter Name="cod_prov" Type="String" />
                                <asp:Parameter Name="provincia" Type="String" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 98px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        Municipio de Nacimiento</td>
                    <td align="left" style="padding-left: 5px; width: 252px">
                        <asp:DropDownList ID="ddlmunicipionac" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource2"
                            DataTextField="municipio" DataValueField="cod_mun" Width="202px">
                        </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetDataByCod_Provincia" TypeName="dsUniversidadTableAdapters.municipioTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlprovincianac" Name="cod_provincia" PropertyName="SelectedValue"
                                    Type="String" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="cod_mun" Type="String" />
                                <asp:Parameter Name="municipio" Type="String" />
                                <asp:Parameter Name="cod_provincia" Type="String" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 98px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        Sector de Nacimiento</td>
                    <td align="left" style="padding-left: 5px; width: 252px">
                        <asp:TextBox ID="txtsectornac" runat="server" Width="205px"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 98px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 13px;">
                        Pasaporte</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 13px;">
                        <span style="color: #ff0000">
                        <asp:TextBox ID="txtPasaporte" runat="server" Width="207px"></asp:TextBox></span></td>
                    <td style="padding-left: 5px; width: 30px; height: 13px;">
                    </td>
                    <td style="padding-left: 5px; width: 98px; height: 13px;">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px; text-align: left; height: 13px;">
                        <span>Tel<span lang="ES-DO" style="line-height: 115%; mso-ansi-language: ES-DO; mso-ascii-theme-font: minor-latin;
                            mso-fareast-font-family: 'Times New Roman'; mso-fareast-theme-font: minor-fareast;
                            mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi;
                            mso-fareast-language: EN-US; mso-bidi-language: AR-SA">é</span>fono<br />
                            <ew:MaskedTextBox ID="txtprobtelefono" runat="server" Font-Names="Arial" Font-Size="12px"
                                Mask="999-999-9999" MaxLength="12" TabIndex="5" ValidationExpression="\d{3}-\d{3}-\d{4}"
                                Width="246px"></ew:MaskedTextBox></span></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 13px">
                        Nacionalidad</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 13px">
                        <asp:TextBox ID="txtNacionalidad" runat="server" Width="206px"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 13px">
                    </td>
                    <td style="padding-left: 5px; width: 98px; height: 13px">
                    </td>
                    <td align="left" rowspan="2" style="padding-left: 5px; width: 354px">
                        </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 3px">
                        Nombre del padre</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 3px">
                        <asp:TextBox ID="txtnombrepadre" runat="server" Font-Names="Arial" Font-Size="12px"
                            TabIndex="10" Width="200px"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 3px">
                    </td>
                    <td style="padding-left: 5px; width: 98px; height: 3px">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 13px">
                        Nombre de la madre</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 13px">
                        <asp:TextBox ID="txtnombremadre" runat="server" Font-Names="Arial" Font-Size="12px"
                            TabIndex="11" Width="200px"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 13px">
                    </td>
                    <td style="padding-left: 5px; width: 98px; height: 13px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px; height: 13px">
                        <strong><span>Referencia&nbsp; de Trabajo</span></strong></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 13px">
                        </td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 13px">
                        </td>
                    <td style="padding-left: 5px; width: 30px; height: 13px">
                    </td>
                    <td style="padding-left: 5px; width: 98px; height: 13px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px; height: 13px">
                        Lugar de trabajo &nbsp; &nbsp; &nbsp;
                        <asp:TextBox ID="txtlugartrabajo" runat="server" Width="201px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 13px">
                        Telefono del padre</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 13px">
                        <ew:MaskedTextBox ID="txttelefonopadre" runat="server" Font-Names="Arial" Font-Size="12px"
                            Mask="999-999-9999" MaxLength="12" TabIndex="5" ValidationExpression="\d{3}-\d{3}-\d{4}"
                            Width="200px"></ew:MaskedTextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 13px">
                    </td>
                    <td style="padding-left: 5px; width: 98px; height: 13px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px; height: 13px">
                        Teléfono del trabajo
                        <ew:MaskedTextBox ID="txttelefonotrabajo" runat="server" Font-Names="Arial" Font-Size="12px"
                            Mask="999-999-9999" MaxLength="12" TabIndex="5" ValidationExpression="\d{3}-\d{3}-\d{4}"
                            Width="204px"></ew:MaskedTextBox></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 13px">
                        Lugar de trabaja y cargo del padre</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 13px">
                        <asp:TextBox ID="txttrabajopadre" runat="server"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 13px">
                    </td>
                    <td style="padding-left: 5px; width: 98px; height: 13px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px; height: 13px">
                        Años de servicio&nbsp;
                        <asp:TextBox ID="txtanosservicio" runat="server">0</asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 56px">
                        <strong>
                        Recinto</strong></td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 56px">
                        <asp:DropDownList ID="ddlrecinto" runat="server" DataSourceID="objRecinto" DataTextField="siglas"
                            DataValueField="id_recinto" Font-Names="Arial" Font-Size="12px" TabIndex="12"
                            Width="200px">
                        </asp:DropDownList><strong><span style="font-size: 14pt; color: #ff0000">*</span></strong><asp:ObjectDataSource ID="objRecinto" runat="server" DeleteMethod="Delete"
                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                            TypeName="dsUniversidadTableAdapters.RecintoTableAdapter" UpdateMethod="Update">
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
                    </td>
                    <td style="padding-left: 5px; width: 30px; height: 56px">
                    </td>
                    <td style="padding-left: 5px; width: 98px; height: 56px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px; height: 56px">
                        </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        <strong>
                        Per&iacute;odo de entrada</strong></td>
                    <td align="left" style="padding-left: 5px; width: 252px">
                        <asp:DropDownList ID="ddlciclo" runat="server" DataSourceID="objCiclo" DataTextField="descripcion"
                            DataValueField="id_periodo" Font-Names="Arial" Font-Size="12px" TabIndex="13"
                            Width="200px">
                        </asp:DropDownList><strong><span style="font-size: 14pt; color: #ff0000">*</span></strong><asp:ObjectDataSource ID="objCiclo" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.PeriodoTableAdapter">
                        </asp:ObjectDataSource>
                    </td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 98px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px">
                        <strong>Requisitos de Admisi&oacute;n </strong>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 21px">
                        Correo</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 21px">
                        <asp:TextBox ID="txtcorreo" runat="server" Font-Names="Arial" Font-Size="12px"
                            TabIndex="14" Width="200px"></asp:TextBox><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtcorreo"
                            ErrorMessage="Correo inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                    <td style="padding-left: 5px; width: 30px; height: 21px">
                    </td>
                    <td style="padding-left: 5px; width: 98px; height: 21px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px; height: 21px">
                        <asp:CheckBox ID="chksoladm" runat="server" Text="Formulario de Solicitud de Admisión "
                            Width="228px" /></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        ¿Por qu&eacute; medio se enter&oacute;
                        <br />
                        de la universidad?</td>
                    <td align="left" style="padding-left: 5px; width: 252px">
                        <asp:TextBox ID="txtMedioEntero" runat="server" Width="200px"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 98px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px">
                        &nbsp;<asp:CheckBox ID="chkfoto" runat="server" Text="Cuatro (4) fotografías 2 x 2 " /></td>
                </tr>
                <tr>
                    <td style="height: 33px" align="left">
                        Porciento de Beca</td>
                    <td align="left" style="width: 252px; height: 33px">
                        &nbsp;<asp:TextBox ID="txtBeca" runat="server" Width="29px">0</asp:TextBox>%</td>
                    <td style="width: 30px; height: 33px">
                    </td>
                    <td style="width: 98px; height: 33px">
                    </td>
                    <td align="left" style="width: 354px; height: 33px; padding-left: 5px;">
                        &nbsp;<asp:CheckBox ID="chkcertnac" runat="server" Text="Certificado Oficial de Nacimiento " /></td>
                </tr>
                <tr>
                    <td style="height: 33px" align="left">
                        </td>
                    <td align="left" style="width: 252px; height: 33px">
                        &nbsp;</td>
                    <td style="width: 30px; height: 33px">
                    </td>
                    <td style="width: 98px; height: 33px">
                    </td>
                    <td align="left" style="width: 354px; height: 33px; padding-left: 5px;">
                        &nbsp;<asp:CheckBox ID="chkcertedu" runat="server" Text="Certificado y Copia del Diploma de Conclusión de la Educación Media (Secundaria) "
                            Width="355px" /></td>
                </tr>
                <tr>
                    <td style="height: 33px" align="left">
                        Tipo de Centro</td>
                    <td align="left" style="width: 252px; height: 33px">
                        <asp:DropDownList ID="ddlTipoCentro" runat="server" Width="153px">
                            <asp:ListItem>Colegio</asp:ListItem>
                            <asp:ListItem>Escuela</asp:ListItem>
                            <asp:ListItem>Liceo</asp:ListItem>
                            <asp:ListItem>Politecnico</asp:ListItem>
                            <asp:ListItem>Universidad</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="width: 30px; height: 33px">
                    </td>
                    <td style="width: 98px; height: 33px">
                    </td>
                    <td align="left" style="width: 354px; height: 33px; padding-left: 5px;">
                        &nbsp;<asp:CheckBox ID="chkrecord" runat="server" Text="Récord de notas certificado"
                            Width="347px" /></td>
                </tr>
                <tr>
                    <td style="height: 31px" align="left">
                        Centro de proveniencia</td>
                    <td align="left" style="width: 252px; height: 31px">
                        <asp:TextBox ID="txtgraduobachiller" runat="server"></asp:TextBox></td>
                    <td style="width: 30px; height: 31px">
                    </td>
                    <td style="width: 98px; height: 31px">
                    </td>
                    <td align="left" style="width: 354px; height: 31px; padding-left: 5px;">
                        &nbsp;<asp:CheckBox ID="chkbuenaconducta" runat="server" Text="Certificado de Buena Conducta" /></td>
                </tr>
                <tr>
                    <td style="height: 33px">
                        Actividades extracurriculares</td>
                    <td align="left" style="width: 252px; height: 33px">
                        <asp:TextBox ID="txtactivextracurr" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                    <td style="width: 30px; height: 33px">
                    </td>
                    <td style="width: 98px; height: 33px">
                    </td>
                    <td align="left" style="width: 354px; height: 33px; padding-left: 5px;">
                        <asp:CheckBox ID="chkced" runat="server" Text="Copia de Cédula " /></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="width: 252px">
                    </td>
                    <td style="width: 30px">
                    </td>
                    <td style="width: 98px">
                    </td>
                    <td style="width: 354px; padding-left: 5px;" align="left">
                        <asp:CheckBox ID="chkcertmed" runat="server" Text="Certificado Médico Oficial " /></td>
                </tr>
                <tr>
                    <td style="height: 28px">
                    </td>
                    <td style="width: 252px; height: 28px">
                    </td>
                    <td style="width: 30px; height: 28px">
                    </td>
                    <td style="width: 98px; height: 28px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px; height: 28px">
                        <strong>Requisitos de estudiantes transferidos o graduados</strong></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="width: 252px">
                    </td>
                    <td style="width: 30px">
                    </td>
                    <td style="width: 98px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px">
                        <asp:CheckBox ID="chkTituloSEESCYT" runat="server" Text="Certificación de título legalizado por la SEESCYT" /></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="width: 252px">
                    </td>
                    <td style="width: 30px">
                    </td>
                    <td style="width: 98px">
                    </td>
                    <td align="left" style="padding-left: 5px; width: 354px">
                        <asp:CheckBox ID="chkrecordSEESCYT" runat="server" Text="Record de notas legalizado por la SEESCYT" /></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="width: 252px">
                    </td>
                    <td style="width: 30px">
                    </td>
                    <td style="width: 98px">
                    </td>
                    <td style="width: 354px">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="width: 864px; height: 25px" valign="top">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="1" style="width: 864px; height: 31px" valign="top">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label><br />
            <asp:Label ID="lblmsgimpresion" runat="server" Font-Names="Arial" Font-Size="12px"
                Height="43px" Text="Click en la imagen para imprimir el formulario de inscripcion"
                Visible="False" Width="202px"></asp:Label>
            <asp:ImageButton ID="btnprint" runat="server" ImageUrl="~/images/print.jpg" OnClick="ImageButton1_Click"
                Visible="False" /></td>
    </tr>
    <tr>
        <td align="center" colspan="1" style="border-right: black 1px solid; border-top: black 1px solid;
            border-left: black 1px solid; width: 864px; border-bottom: black 1px solid; height: 40px"
            valign="middle">
            <asp:ImageButton ID="btnActualizar" runat="server" ImageUrl="~/images/botones/btn_actualizar.jpg"
                OnClick="btnActualizar_Click" />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/images/botones/btn_cancelar.jpg"
                OnClick="btnCancelar_Click" /></td>
    </tr>
</table>
