<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertEstudiante.ascx.cs" Inherits="controles_insertEstudiante" %>
<%@  Register TagPrefix="ew"   Namespace="eWorld.UI.Compatibility"  Assembly="eWorld.UI.Compatibility" %>
<script language="javascript" type="text/javascript">
<!--


// -->
</script>

<span style="font-size: 24px; font-family: Arial">NUEVOS ESTUDIANTES
    <hr />
</span>
<br />
<span style="font-size: 12px; font-family: Arial">Cargar datos de estudiante admitido:
    Apellido del estudiante</span><asp:TextBox ID="txtapellidoadmitido" runat="server"
        Width="212px"></asp:TextBox><span style="font-size: 12px; font-family: Arial">&nbsp;</span><asp:Button
            ID="btnAdmitido" runat="server" Text="Buscar" />
<asp:GridView ID="gvAdmitidos" runat="server" AutoGenerateColumns="False" CellPadding="4"
    DataKeyNames="cod_stu" DataSourceID="odsAdmitidos" Font-Names="Arial" Font-Size="12px"
    ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <Columns>
        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
        <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
        <asp:BoundField DataField="cedula" HeaderText="Cedula" SortExpression="cedula" />
        <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
    </Columns>
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
<asp:ObjectDataSource ID="odsAdmitidos" runat="server" DeleteMethod="Delete"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByApellido"
    TypeName="dsUniversidadTableAdapters.tblAdmision_StudentTableAdapter">
    <DeleteParameters>
        <asp:Parameter Name="Original_cod_stu" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="txtapellidoadmitido" DefaultValue="{0}" Name="apellido"
            PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
<br />
<br />
<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width: 909px;">
    <tr>
        <td align="center" valign="top" style="width: 864px">
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid;
                font-family: Arial; width: 908px;" id="TABLE1" language="javascript" onclick="return TABLE1_onclick()">
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
                        A&ntilde;o de ingreso</td>
                    <td style="padding-left: 5px; width: 353px">
                        <asp:TextBox ID="txtano" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px; width: 203px;" align="left">
                        <strong>Nombre</strong></td>
                    <td style="padding-left: 5px; width: 252px;" align="left">
                        <asp:TextBox ID="txtnombre" runat="server" Font-Names="Arial" Font-Size="12px"
                            Width="200px" TabIndex="1"></asp:TextBox>
                        <span style="font-size: 18px; color: #ff0000"><strong>*</strong></span></td>
                    <td style="padding-left: 5px; width: 30px; font-size: 12px;">
                    </td>
                    <td style="padding-left: 5px; width: 120px;">
                        <strong>Carrera</strong></td>
                    <td style="padding-left: 5px; width: 353px;">
                        <asp:DropDownList ID="ddlcarrera" runat="server" DataSourceID="objCarrera" DataTextField="carrera_nombre"
                            DataValueField="id_carrera" Font-Names="Arial" Font-Size="12px" Width="200px" TabIndex="19" OnDataBound="ddlcarrera_DataBound">
                        </asp:DropDownList>
                        <strong><span style="font-size: 18px; color: #ff0000">*</span></strong><asp:ObjectDataSource ID="objCarrera" runat="server" DeleteMethod="Delete"
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
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px; height: 10px; width: 203px;" align="left">
                        <strong>Apellido</strong></td>
                    <td style="padding-left: 5px; height: 10px; width: 252px;" align="left">
                        <asp:TextBox ID="txtapellido" runat="server" Font-Names="Arial" Font-Size="12px"
                            Width="200px" TabIndex="2"></asp:TextBox>
                        <strong><span style="font-size: 18px; color: #ff0000">*</span></strong></td>
                    <td style="padding-left: 5px; width: 30px; height: 10px;">
                    </td>
                    <td style="padding-left: 5px; width: 120px; height: 10px;">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Modo de Matricula" Width="105px"></asp:Label></td>
                    <td style="padding-left: 5px; width: 353px; height: 10px;" valign="bottom">
                        <br />
                        <asp:RadioButtonList ID="rblMatricula" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblMatricula_SelectedIndexChanged">
                            <asp:ListItem Selected="True">Automatico</asp:ListItem>
                            <asp:ListItem>Manual</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px; height: 21px; width: 203px;" align="left">
                        C&eacute;dula</td>
                    <td style="padding-left: 5px; width: 252px; height: 21px;" align="left">
                        <ew:MaskedTextBox ID="txtcedula" runat="server" Font-Names="Arial" Font-Size="12px"
                            MaxLength="13" ValidationExpression="\d{3}-\d{7}-\d{1}" Width="200px" Mask="999-9999999-9" TabIndex="3"></ew:MaskedTextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 21px;">
                    </td>
                    <td style="padding-left: 5px; width: 120px; height: 21px;">
                        <asp:Label ID="lblMatriculamanual" runat="server" Font-Bold="True" Text="Matricula" Visible="False"></asp:Label></td>
                    <td style="padding-left: 5px; width: 353px; height: 21px;">
                        <ew:MaskedTextBox ID="txtmatriculamanual" runat="server" Font-Names="Arial" Font-Size="12px"
                            Mask="99-9999" MaxLength="7" ValidationExpression="\d{2}-\d{4}" Width="150px"></ew:MaskedTextBox></td>
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
                    <td style="padding-left: 5px; width: 203px;" align="left">
                        Sexo</td>
                    <td style="padding-left: 5px; width: 252px;" align="left">
                        <asp:RadioButtonList ID="rblsexo" runat="server" Font-Names="Arial" Font-Size="12px"
                            RepeatColumns="2" TabIndex="4">
                            <asp:ListItem>F</asp:ListItem>
                            <asp:ListItem>M</asp:ListItem>
                        </asp:RadioButtonList></td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 120px;">
                        Tipo de ingreso</td>
                    <td style="padding-left: 5px; width: 353px;" valign="middle">
                        <asp:RadioButtonList ID="rblTipoIngreso" runat="server" Font-Names="Arial" Font-Size="13px"
                            RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True">Nuevo</asp:ListItem>
                            <asp:ListItem>Transferido</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px; width: 203px;" align="left">
                        Tel&eacute;fono</td>
                    <td style="padding-left: 5px; width: 252px;" align="left">
                        <ew:MaskedTextBox ID="txttelefono" runat="server" Font-Names="Arial" Font-Size="12px"
                            MaxLength="12" ValidationExpression="\d{3}-\d{3}-\d{4}" Width="200px" Mask="999-999-9999" TabIndex="5"></ew:MaskedTextBox></td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; width: 120px;">
                        <strong></strong></td>
                    <td style="padding-left: 5px; width: 353px;">
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
                <tr>
                    <td style="padding-left: 5px; height: 32px; width: 203px;" align="left">
                        Calle / No. / Apto.<br />
                        <span style="font-size: 8pt"><strong>Dirección</strong></span></td>
                    <td style="padding-left: 5px; height: 32px; width: 252px;" align="left">
                        <asp:TextBox ID="txtdireccion" runat="server" Font-Names="Arial" Font-Size="12px"
                            TextMode="MultiLine" Width="200px" TabIndex="6"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 32px;">
                    </td>
                    <td style="padding-left: 5px; height: 32px; text-align: left;" colspan="2">
                        <strong><span style="font-size: 11pt"></span></strong></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                        Sector Actual<br />
                        <strong><span style="font-size: 8pt">Dirección</span></strong></td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 32px">
                        <asp:TextBox ID="txtsector" runat="server" Width="201px"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 32px">
                    </td>
                    <td colspan="2" style="padding-left: 5px; height: 32px; text-align: left">
                        <strong><span style="font-size: 11pt"></span></strong></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                        Provincia Actual</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 32px">
                        <asp:DropDownList ID="ddlprovincia" runat="server" Width="202px" DataSourceID="Objprovincia" DataTextField="provincia" DataValueField="cod_prov" AutoPostBack="True" OnSelectedIndexChanged="ddlprovincia_SelectedIndexChanged">
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
                        <asp:DropDownList ID="ddlmunicipio" runat="server" Width="202px" AutoPostBack="True" DataSourceID="ObjMunicipio" DataTextField="municipio" DataValueField="cod_mun">
                        </asp:DropDownList></td>
                    <td style="padding-left: 5px; width: 30px; height: 32px">
                    </td>
                    <td colspan="2" style="padding-left: 5px; height: 32px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; width: 203px; height: 24px;">
                        Pasaporte</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 24px;">
                        <asp:TextBox ID="txtPasaporte" runat="server" Width="200px" TabIndex="7"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 24px;">
                    </td>
                    <td colspan="2" style="padding-left: 5px; text-align: left; height: 24px;">
                        <strong><span>En Caso de Problemas</span></strong></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 32px; width: 203px;">
                        Nacionalidad</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 32px">
                        <asp:TextBox ID="txtNacionalidad" runat="server" Width="200px" TabIndex="8"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 32px">
                    </td>
                    <td style="padding-left: 5px; height: 32px; text-align: left;" colspan="2">
                        En caso de accidente notificar a &nbsp;<br />
                        <asp:TextBox ID="txtaccidentenot" runat="server" Width="205px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 32px; width: 203px;">
                        <strong>
                        Fecha de Nacimiento</strong></td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 32px">
                        <asp:TextBox ID="txtfechanac" runat="server" TabIndex="8" Width="200px"></asp:TextBox>&nbsp;
                        <span style="font-size: 18px; color: #ff0000"><strong>*<br />
                        </strong><span style="font-size: 11px">&nbsp; Ej.: 21 / 12 / 1980&nbsp; dd/mm/aaaa</span></span></td>
                    <td style="padding-left: 5px; width: 30px; height: 32px">
                    </td>
                    <td style="padding-left: 5px; height: 32px; text-align: left;" colspan="2">
                        Dirección<br />
                        <asp:TextBox ID="txtprobdireccion" runat="server" TextMode="MultiLine" Width="205px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                        Provincia de Nacimiento</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 32px">
                        <asp:DropDownList ID="ddlprovincianacimiento" runat="server" Width="202px" DataSourceID="odsProvinciaNac" DataTextField="provincia" DataValueField="cod_prov" AutoPostBack="True" OnSelectedIndexChanged="ddlprovincia_SelectedIndexChanged">
                        </asp:DropDownList></td>
                    <td style="padding-left: 5px; width: 30px; height: 32px">
                    </td>
                    <td colspan="2" style="padding-left: 5px; height: 32px; text-align: left">
                        Tel<span lang="ES-DO" style="line-height: 115%; mso-ansi-language: ES-DO; mso-ascii-theme-font: minor-latin;
                        mso-fareast-font-family: 'Times New Roman'; mso-fareast-theme-font: minor-fareast;
                        mso-hansi-theme-font: minor-latin; mso-bidi-font-family: 'Times New Roman'; mso-bidi-theme-font: minor-bidi;
                        mso-fareast-language: EN-US; mso-bidi-language: AR-SA">é</span>fono<br />
                        <ew:MaskedTextBox ID="txtprobtelefono" runat="server" Font-Names="Arial" Font-Size="12px"
                            Mask="999-999-9999" MaxLength="12" TabIndex="5" ValidationExpression="\d{3}-\d{3}-\d{4}"
                            Width="204px"></ew:MaskedTextBox></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                        Municipio de Nacimiento</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 32px">
                        <asp:DropDownList ID="ddlmunicipionacimiento" runat="server" Width="202px" AutoPostBack="True" DataSourceID="odsMunicipioNac" DataTextField="municipio" DataValueField="cod_mun">
                        </asp:DropDownList></td>
                    <td style="padding-left: 5px; width: 30px; height: 32px">
                    </td>
                    <td colspan="2" style="padding-left: 5px; height: 32px; text-align: left">
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; width: 203px; height: 32px">
                        Sector de Nacimiento</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 32px">
                        <asp:TextBox ID="txtsectornacimiento" runat="server" Width="201px"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 32px">
                    </td>
                    <td colspan="2" style="padding-left: 5px; height: 32px; text-align: left">
                        <strong>Referencia&nbsp; de Trabajo</strong></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px; width: 203px;" align="left">
                        Nombre del padre</td>
                    <td style="padding-left: 5px; width: 252px;" align="left">
                        <span style="color: #ff0000">
                        <asp:TextBox ID="txtnombrepadre" runat="server" Font-Names="Arial" Font-Size="12px"
                            Width="200px" TabIndex="12"></asp:TextBox></span></td>
                    <td style="padding-left: 5px; width: 30px; font-size: 12px;">
                    </td>
                    <td style="padding-left: 5px; text-align: left;" colspan="2">
                    <span>
                        Lugar de trabajo &nbsp; &nbsp; &nbsp;
                        <asp:TextBox ID="txtlugartrabajo" runat="server" Width="204px"></asp:TextBox></span></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px; height: 21px; width: 203px;" align="left">
                        Nombre de la madre</td>
                    <td style="padding-left: 5px; height: 21px; width: 252px;" align="left">
                        <asp:TextBox ID="txtnombremadre" runat="server" Font-Names="Arial" Font-Size="12px"
                            Width="200px" TabIndex="13"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 21px;">
                    </td>
                    <td align="left" colspan="2" style="padding-left: 5px; height: 21px">
                        Teléfono del trabajo
                        <ew:MaskedTextBox ID="txttelefonotrabajo" runat="server" Font-Names="Arial" Font-Size="12px"
                            Mask="999-999-9999" MaxLength="12" TabIndex="5" ValidationExpression="\d{3}-\d{3}-\d{4}"
                            Width="204px"></ew:MaskedTextBox></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; width: 203px; height: 13px">
                        Telefono del padre</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 13px">
                        <ew:MaskedTextBox ID="txttelefonopadre" runat="server" Font-Names="Arial" Font-Size="12px"
                            Mask="999-999-9999" MaxLength="12" TabIndex="5" ValidationExpression="\d{3}-\d{3}-\d{4}"
                            Width="200px"></ew:MaskedTextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 13px">
                    </td>
                    <td style="padding-left: 5px; height: 13px" colspan="2" align="left">
                        <span>
                        Años de servicio&nbsp;&nbsp; &nbsp; &nbsp;
                        <asp:TextBox ID="txtanosservicio" runat="server" Width="75px">0</asp:TextBox><span
                            style="font-size: 8pt; color: #ff0000"><strong>(solo números)</strong></span></span></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; width: 203px; height: 13px">
                        Lugar de trabaja y cargo del padre</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 13px">
                        <asp:TextBox ID="txttrabajopadre" runat="server"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px; height: 13px">
                    </td>
                    <td colspan="2" style="padding-left: 5px; height: 13px; text-align: left" align="left">
                        <strong>Requisitos de Admisión</strong></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; width: 203px; height: 13px">
                        <strong>
                        Recinto</strong></td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 13px">
                        <asp:DropDownList ID="ddlrecinto" runat="server" DataSourceID="objRecinto" DataTextField="siglas"
                            DataValueField="id_recinto" Font-Names="Arial" Font-Size="12px" Width="200px" TabIndex="14" OnDataBound="ddlrecinto_DataBound">
                        </asp:DropDownList><span style="font-size: 14pt; color: #ff0000"><strong>*</strong></span></td>
                    <td style="padding-left: 5px; width: 30px; height: 13px">
                    </td>
                    <td colspan="2" style="padding-left: 5px; height: 13px; text-align: left" align="left">
                        <asp:CheckBox ID="chksoladm" runat="server" Text="Formulario de Solicitud de Admisión "
                            Width="284px" TabIndex="20" Font-Bold="False" /></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px; width: 203px;" align="left">
                        <strong>
                        Per&iacute;odo de entrada</strong></td>
                    <td style="padding-left: 5px; width: 252px;" align="left">
                        <asp:DropDownList ID="ddlciclo" runat="server" DataSourceID="objCiclo" DataTextField="descripcion"
                            DataValueField="id_periodo" Font-Names="Arial" Font-Size="12px" Width="200px" TabIndex="15" OnDataBound="ddlciclo_DataBound">
                        </asp:DropDownList><strong><span style="font-size: 14pt; color: #ff0000">*</span></strong></td>
                    <td style="padding-left: 5px; width: 30px;">
                    </td>
                    <td align="left" colspan="2" style="padding-left: 5px">
                        <asp:CheckBox ID="chkfoto" runat="server" Text="Cuatro (4) fotografías 2 x 2 " Width="300px" TabIndex="24" /></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px; width: 203px;" align="left">
                        Correo</td>
                    <td style="padding-left: 5px; width: 252px;" align="left">
                        <asp:TextBox ID="txtcorreo" runat="server" Font-Names="Arial" Font-Size="12px"
                            Width="200px" TabIndex="16"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtcorreo"
                            ErrorMessage="Correo inv&aacute;lido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                    <td style="padding-left: 5px; width: 30px">
                    </td>
                    <td style="padding-left: 5px; text-align: left;" colspan="2">
                        <asp:CheckBox ID="chkcertnac" runat="server" Text="Certificado Oficial de Nacimiento " Width="289px" TabIndex="21" /></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px; width: 203px;" align="left">
                        ¿Por que medio se enter&oacute;
                        <br />
                        de la universidad?</td>
                    <td style="padding-left: 5px; width: 252px;" align="left">
                        <asp:TextBox ID="txtMedioEntero" runat="server" Width="200px" TabIndex="17"></asp:TextBox></td>
                    <td style="padding-left: 5px; width: 30px;">
                    </td>
                    <td align="left" colspan="2" style="padding-left: 5px">
                        <asp:CheckBox ID="chkcertedu" runat="server" Text="Certificado y Copia del Diploma de Conclusión de la Educación Media (Secundaria) "
                            Width="302px" TabIndex="26" /></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; width: 203px; height: 24px;">
                        Porciento de Beca</td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 24px;">
                        <asp:TextBox ID="txtBeca" runat="server" Width="29px" TabIndex="18">0</asp:TextBox>%</td>
                    <td style="padding-left: 5px; width: 30px; height: 24px;">
                    </td>
                    <td style="height: 24px; text-align: left; padding-left: 5px;" colspan="2">
                        <asp:CheckBox ID="chkrecord" runat="server" Text="Récord de Notas Certificado"
                            Width="300px" TabIndex="25" /></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; width: 203px; height: 24px;">
                        </td>
                    <td align="left" style="padding-left: 5px; width: 252px; height: 24px;">
                        </td>
                    <td style="padding-left: 5px; width: 30px; height: 24px;">
                    </td>
                    <td colspan="2" style="text-align: left; height: 24px; padding-left: 5px;">
                        <asp:CheckBox ID="chkbuenaconducta" runat="server" Text="Certificado de Buena Conducta" /></td>
                </tr>
                <tr>
                    <td style="width: 203px; text-align: left">
                        &nbsp;Tipo de Centro</td>
                    <td style="width: 252px;" align="left">
                        &nbsp;
                        <asp:DropDownList ID="ddlTipoCentro" runat="server" Width="155px">
                            <asp:ListItem>Colegio</asp:ListItem>
                            <asp:ListItem>Escuela</asp:ListItem>
                            <asp:ListItem>Liceo</asp:ListItem>
                            <asp:ListItem>Politecnico</asp:ListItem>
                            <asp:ListItem Value="Universidad"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="width: 30px;">
                    </td>
                    <td style="text-align: left; padding-left: 5px;" colspan="2">
                        <asp:CheckBox ID="chkced" runat="server" Text="Copia de Cédula " Width="300px" TabIndex="23" /></td>
                </tr>
                <tr>
                    <td style="width: 203px; text-align: left; height: 24px;">
                        &nbsp;Centro de proveniencia</td>
                    <td align="left" style="width: 252px; height: 24px;">
                        &nbsp;
                        <asp:TextBox ID="txtgraduobachiller" runat="server"></asp:TextBox></td>
                    <td style="width: 30px; height: 24px;">
                    </td>
                    <td colspan="2" style="text-align: left; height: 24px; padding-left: 5px;">
                        <asp:CheckBox ID="chkcertmed" runat="server" Text="Certificado Médico Oficial " Width="300px" TabIndex="22" /></td>
                </tr>
                <tr>
                    <td style="width: 203px; height: 15px; text-align: left">
                        Actividades extracurriculares</td>
                    <td align="left" style="width: 252px; height: 15px">
                        &nbsp;
                        <asp:TextBox ID="txtactivextracurr" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                    <td style="width: 30px; height: 15px">
                    </td>
                    <td colspan="2" style="height: 15px; text-align: left; padding-left: 5px;">
                        <strong>Requisitos de estudiantes transferidos o graduados</strong></td>
                </tr>
                <tr>
                    <td style="width: 203px; text-align: left; height: 20px;">
                    </td>
                    <td align="left" style="width: 252px; height: 20px;">
                    </td>
                    <td style="width: 30px; height: 20px;">
                    </td>
                    <td colspan="2" style="text-align: left; height: 20px; padding-left: 5px;">
                        <asp:CheckBox ID="chkTituloSEESCYT" runat="server" Text="Certificaci&oacute;n de t&iacute;tulo legalizado por la SEESCYT" /></td>
                </tr>
                <tr>
                    <td style="width: 203px; height: 15px; text-align: left">
                    </td>
                    <td align="left" style="width: 252px; height: 15px">
                        </td>
                    <td style="width: 30px; height: 15px">
                    </td>
                    <td colspan="2" style="height: 15px; text-align: left; padding-left: 5px;">
                        <asp:CheckBox ID="chkrecordSEESCYT" runat="server" Text="Record de notas legalizado por la SEESCYT" /></td>
                </tr>
                <tr>
                    <td style="width: 203px; height: 38px">
                    </td>
                    <td style="width: 252px; height: 38px;">
                    <asp:ObjectDataSource ID="objRecinto" runat="server" DeleteMethod="Delete"
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
                    <asp:ObjectDataSource ID="objCiclo" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                            TypeName="dsUniversidadTableAdapters.PeriodoTableAdapter">
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="Objprovincia" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.provinciasTableAdapter">
                            <InsertParameters>
                                <asp:Parameter Name="cod_prov" Type="String" />
                                <asp:Parameter Name="provincia" Type="String" />
                            </InsertParameters>
                        </asp:ObjectDataSource><asp:ObjectDataSource ID="odsProvinciaNac" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
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
                    <td style="width: 30px; height: 38px;">
                    </td>
                    <td style="width: 120px; height: 38px;">
                    </td>
                    <td style="width: 353px; height: 38px;">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 203px; height: 38px">
                    </td>
                    <td style="width: 252px; height: 38px">
                    </td>
                    <td style="width: 30px; height: 38px">
                    </td>
                    <td style="width: 120px; height: 38px">
                    </td>
                    <td style="width: 353px; height: 38px">
                    </td>
                </tr>
            </table>
            <strong><span style="font-size: 13px; font-family: Arial">Matrícula Generada:</span>
                        <asp:Label ID="lblmatricula" runat="server" Font-Bold="True" Font-Size="15pt" Font-Names="Arial"></asp:Label></strong></td>
    </tr>
    <tr>
        <td style="height: 25px; width: 864px;" valign="top">
            <span style="font-size: 12px; font-family: Arial"><strong>
                <br />
                NOTA:</strong><br />
                Los campos con asterisco <span style="font-size: 18px">(<span style="color: #ff0000"><strong>*</strong></span>)</span>
                deben ser completados obligatoriamente.<br />
            </span>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="1" style="height: 31px; width: 864px;" valign="top">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label><br />
            <asp:ListBox ID="ListBox1" runat="server" Height="115px" Visible="False" Width="397px">
            </asp:ListBox><br />
            &nbsp;<asp:Label ID="lblmsgimpresion" runat="server" Font-Names="Arial" Font-Size="12px"
                Height="43px" Text="Click en la imagen para imprimir el formulario de inscripcion"
                Visible="False" Width="202px"></asp:Label>
            <asp:ImageButton ID="btnprint" runat="server" ImageUrl="~/images/print.jpg" OnClick="ImageButton2_Click"
                Visible="False" /></td>
    </tr>
    <tr>
        <td align="center" colspan="1" style="border-right: black 1px solid; border-top: black 1px solid;
            border-left: black 1px solid; border-bottom: black 1px solid; height: 40px; width: 864px;" valign="middle">
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
