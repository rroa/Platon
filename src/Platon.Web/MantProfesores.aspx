<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="MantProfesores.aspx.cs" Inherits="MantProfesores"  %>
<%@  Register TagPrefix="ew"   Namespace="eWorld.UI.Compatibility"  Assembly="eWorld.UI.Compatibility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 655px">
        <tr>
            <td style="text-align: justify;">
                <span style="font-family: Arial">
                <span style="font-size: 24px;">MANTENIMIENTO DE PROFESORES </span>
                        <hr />
                <strong>DATOS PERSONALES DE PROFESOR</strong><br />
                <br />
                </span>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="id_profesor" DataSourceID="ObjectDataSource1" ForeColor="#333333"
                    GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Font-Names="Arial" Font-Size="12px" Width="100%" AllowPaging="True">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Modificar" ShowSelectButton="True" />
                        <asp:BoundField DataField="prof_cedula" HeaderText="Cedula" SortExpression="prof_cedula" />
                        <asp:BoundField DataField="prof_nombre" HeaderText="Nombre" SortExpression="prof_nombre" />
                        <asp:BoundField DataField="prof_apellido" HeaderText="Apellido" SortExpression="prof_apellido" />
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <span style="font-family: Arial"></span>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                    TypeName="dsUniversidadTableAdapters.ProfesoresTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id_profesor" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="prof_cedula" Type="String" />
                        <asp:Parameter Name="prof_nombre" Type="String" />
                        <asp:Parameter Name="prof_apellido" Type="String" />
                        <asp:Parameter Name="prof_f_nac" Type="DateTime" />
                        <asp:Parameter Name="prof_f_ingreso" Type="DateTime" />
                        <asp:Parameter Name="prof_telefono" Type="String" />
                        <asp:Parameter Name="prof_direccion" Type="String" />
                        <asp:Parameter Name="activo" Type="Boolean" />
                        <asp:Parameter Name="Original_id_profesor" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="prof_cedula" Type="String" />
                        <asp:Parameter Name="prof_nombre" Type="String" />
                        <asp:Parameter Name="prof_apellido" Type="String" />
                        <asp:Parameter Name="prof_f_nac" Type="DateTime" />
                        <asp:Parameter Name="prof_f_ingreso" Type="DateTime" />
                        <asp:Parameter Name="prof_telefono" Type="String" />
                        <asp:Parameter Name="prof_direccion" Type="String" />
                        <asp:Parameter Name="activo" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <span style="font-family: Arial"></span>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <span style="font-size: 24px; font-family: Arial">
                    </span>
                    <br />
                    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                        border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid;
                        font-family: Arial">
                        <tr>
                            <td colspan="2" style="border-bottom: black 1px solid; height: 30px; background-color: whitesmoke">
                                <strong>DATOS PERSONALES DE PROFESOR</strong></td>
                            <td colspan="1" style="width: 123px; border-bottom: black 1px solid; height: 30px;
                                background-color: whitesmoke">
                            </td>
                            <td colspan="1" style="width: 193px; border-bottom: black 1px solid; height: 30px;
                                background-color: whitesmoke">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td style="width: 123px">
                            </td>
                            <td style="width: 193px">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px; height: 19px">
                                <strong>Nombre</strong></td>
                            <td style="padding-left: 5px; height: 19px">
                                <asp:TextBox ID="txtnombre" runat="server" Font-Names="Arial" Font-Size="12px" TabIndex="1"
                                    Width="200px"></asp:TextBox><span style="font-size: 24px; color: #ff0000">*</span></td>
                            <td style="padding-left: 5px; width: 123px; height: 19px">
                                <strong></strong></td>
                            <td style="padding-left: 5px; width: 193px; height: 19px">
                                </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px; height: 19px">
                                <strong>Apellido</strong></td>
                            <td style="padding-left: 5px; height: 19px">
                                <asp:TextBox ID="txtapellido" runat="server" Font-Names="Arial" Font-Size="12px"
                                    TabIndex="2" Width="200px"></asp:TextBox><span style="font-size: 18pt; color: #ff0000">*</span></td>
                            <td style="padding-left: 5px; width: 123px; height: 19px">
                                <strong></strong></td>
                            <td style="padding-left: 5px; width: 193px; height: 19px">
                                </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px; height: 19px">
                                <strong>Cédula</strong></td>
                            <td style="padding-left: 5px; height: 19px">
                                <span style="font-size: 18pt; color: #ff0000">
                                    <ew:MaskedTextBox ID="txtcedula" runat="server" Font-Names="Arial" Font-Size="12px"
                                        Mask="999-9999999-9" MaxLength="13" TabIndex="3" ValidationExpression="\d{3}-\d{7}-\d{1}"
                                        Width="200px"></ew:MaskedTextBox>*</span></td>
                            <td style="padding-left: 5px; width: 123px; height: 19px">
                            </td>
                            <td style="padding-left: 5px; width: 193px; height: 19px">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px">
                                Sexo</td>
                            <td style="padding-left: 5px">
                                <asp:RadioButtonList ID="rblSexo" runat="server" Font-Names="Arial" Font-Size="13px"
                                    RepeatColumns="2">
                                    <asp:ListItem>Femenino</asp:ListItem>
                                    <asp:ListItem>Masculino</asp:ListItem>
                                </asp:RadioButtonList></td>
                            <td style="padding-left: 5px; width: 123px">
                            </td>
                            <td style="padding-left: 5px; width: 193px">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px; height: 19px">
                                Estado Civil</td>
                            <td style="padding-left: 5px; height: 19px">
                                <asp:DropDownList ID="ddlestadocivil" runat="server">
                                    <asp:ListItem>Soltero</asp:ListItem>
                                    <asp:ListItem>Casado</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="padding-left: 5px; width: 123px; height: 19px">
                            </td>
                            <td style="padding-left: 5px; width: 193px; height: 19px">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px; height: 19px">
                                Fecha de Nacimiento</td>
                            <td style="padding-left: 5px; font-size: 9pt; height: 19px">
                                <span><span style="color: #000000">*<asp:TextBox ID="txtfechanac" runat="server"></asp:TextBox><br />
                                        <span style="color: #ff0000">Ej: mm/dd/aaaa</span></span></span></td>
                            <td style="padding-left: 5px; font-size: 9pt; width: 123px; color: #000000; height: 19px">
                                Escuela Principal</td>
                            <td style="padding-left: 5px; font-weight: bold; width: 193px; height: 19px">
                                <asp:TextBox ID="txtescuela" runat="server" Width="197px"></asp:TextBox></td>
                        </tr>
                        <tr style="font-weight: bold">
                            <td style="padding-left: 5px; height: 19px">
                                Fecha de Ingreso</td>
                            <td style="padding-left: 5px; height: 19px">
                                <asp:TextBox ID="txtfechaIngreso" runat="server"></asp:TextBox><br />
                                <span style="color: #ff0000">
                                Ej: mm/dd/aaaa</span></td>
                            <td style="padding-left: 5px; font-size: 13px; width: 123px; height: 19px; font-weight: normal;">
                                Profesion</td>
                            <td style="padding-left: 5px; width: 193px; height: 19px">
                                <asp:TextBox ID="txtprofesion" runat="server" Width="197px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px; height: 19px">
                                Teléfono</td>
                            <td style="padding-left: 5px; height: 19px">
                                <span style="font-size: 18pt; color: #ff0000">
                                    <ew:MaskedTextBox ID="txtelefono" runat="server" Font-Names="Arial" Font-Size="12px"
                                        Mask="999-999-9999" MaxLength="12" TabIndex="8" ValidationExpression="\d{3}-\d{3}-\d{4}"
                                        Width="200px"></ew:MaskedTextBox>*</span></td>
                            <td style="padding-left: 5px; width: 123px; height: 19px">
                                Especialidad</td>
                            <td style="padding-left: 5px; width: 193px; height: 19px">
                                <asp:TextBox ID="txtespecialidad" runat="server" Width="197px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px; height: 19px">
                                Célular</td>
                            <td style="padding-left: 5px; height: 19px">
                                <ew:MaskedTextBox ID="txtcelular" runat="server" Font-Names="Arial" Font-Size="12px"
                                    Mask="999-999-9999" MaxLength="12" TabIndex="8" ValidationExpression="\d{3}-\d{3}-\d{4}"
                                    Width="200px"></ew:MaskedTextBox></td>
                            <td style="padding-left: 5px; width: 123px; height: 19px">
                            </td>
                            <td style="padding-left: 5px; width: 193px; height: 19px">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px; height: 19px">
                                Correo</td>
                            <td style="padding-left: 5px; height: 19px">
                                <asp:TextBox ID="txtcorreo" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="padding-left: 5px; width: 123px; height: 19px">
                            </td>
                            <td style="padding-left: 5px; width: 193px; height: 19px">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px; height: 19px">
                                Dirección</td>
                            <td style="padding-left: 5px; height: 19px">
                                <asp:TextBox ID="txtdireccion" runat="server" Font-Names="Arial" Font-Size="12px"
                                    TabIndex="9" TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                            <td style="padding-left: 5px; width: 123px; height: 19px">
                            </td>
                            <td style="padding-left: 5px; width: 193px; height: 19px">
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px; height: 19px">
                            </td>
                            <td style="padding-left: 5px; height: 19px">
                            </td>
                            <td style="padding-left: 5px; width: 123px; height: 19px">
                            </td>
                            <td style="padding-left: 5px; width: 193px; height: 19px">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="4" style="height: 33px">
                                <strong>Nota:<br />
                                </strong>Los campos marcados con asterisco (<span style="font-size: 18pt; color: #ff0000">*</span>)
                                deben ser completados obligatoriamente</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4" style="height: 33px">
                                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2" style="height: 19px">
                                <asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg" OnClick="btnGuardar_Click"
                                    />
                                &nbsp;
                                <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/images/botones/btn_cancelar.jpg" OnClick="btnCancelar_Click"
                                   />&nbsp;
                            </td>
                            <td align="right" colspan="1" style="width: 123px; height: 19px">
                            </td>
                            <td align="right" colspan="1" style="width: 193px; height: 19px">
                            </td>
                        </tr>
                    </table>
                                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

