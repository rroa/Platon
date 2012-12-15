<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertSession_Student.ascx.cs" Inherits="controles_insertSession_Student" %>
<%@  Register TagPrefix="ew"   Namespace="eWorld.UI.Compatibility"  Assembly="eWorld.UI.Compatibility" %>

<span style="font-size: 24px; font-family: Arial">INSCRIPCION DE ESTUDIANTES EN SECCION
    <hr />
</span>
<asp:Label ID="lblmensaje" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="14px"
    ForeColor="#FF0000"></asp:Label><br />

<table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; font-family: Arial; width: 937px;">
    <tr>
        <td colspan="3" style="height: 30px; background-color: whitesmoke">
            <strong><span style="font-size: 12pt">
            </span></strong></td>
        <td colspan="1" style="width: 48px; height: 30px; background-color: whitesmoke">
        </td>
        <td colspan="1" style="height: 30px; background-color: whitesmoke; text-align: center;" align="left">
            <strong><span style="font-size: 10pt">Materias seleccionadas por el estudiante</span></strong></td>
    </tr>
    <tr>
        <td colspan="2">
            <strong><span style="font-size: 10pt">
            Buscar Estudiante por:</span></strong></td>
        <td colspan="1">
        </td>
        <td colspan="1" style="width: 48px;">
        </td>
        <td align="center" colspan="1" rowspan="6" valign="top">
            &nbsp;&nbsp;
            <br />
            <br />
            <asp:Label ID="lblMatricula" runat="server" Font-Bold="True" Font-Size="13pt"></asp:Label><br />
            <asp:Label ID="lblciclo" runat="server" Visible="False"></asp:Label><br />
            &nbsp;<asp:DataList ID="DataList1" runat="server" OnDeleteCommand="DataList1_DeleteCommand" Font-Names="Arial" Font-Size="12px">
                <ItemTemplate>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 136px" align="left" valign="top">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("session_cod") %>'></asp:Label></td>
                            <td style="width: 128px" align="left" valign="top">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("materia") %>'></asp:Label></td>
                            <td align="left" style="width: 128px" valign="top">
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("creditos") %>'></asp:Label></td>
                            <td style="width: 160px" align="left" valign="top">
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("profesor") %>'></asp:Label></td>
                            <td align="left" style="width: 160px" valign="top">
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("horario") %>'></asp:Label></td>
                            <td align="left" style="width: 160px" valign="top">
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("fechainicio") %>'></asp:Label></td>
                            <td align="left" style="width: 160px" valign="top">
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("fechafin") %>'></asp:Label></td>
                            <td>
                                <asp:LinkButton id="delete" Text="  X" ForeColor="Red" Font-Bold="True" Font-Size="15px" CommandName="Delete" Runat="server"></asp:LinkButton></td>
                        </tr>
                    </table>
                </ItemTemplate>
                <HeaderTemplate>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 136px; background-color: #990000" align="left" valign="top">
                                <strong><span style="color: #ffffff">Clave</span></strong></td>
                            <td style="width: 128px; background-color: #990000" align="left" valign="top">
                                <strong><span style="color: #ffffff">Asignatura</span></strong></td>
                            <td align="left" style="width: 128px; background-color: #990000" valign="top">
                                <span style="color: #ffffff"><strong>Creditos</strong></span></td>
                            <td style="width: 160px; background-color: #990000" align="left" valign="top">
                                <strong><span style="color: #ffffff">Profesor</span></strong></td>
                            <td align="left" style="width: 160px; background-color: #990000" valign="top">
                                <strong><span style="color: #ffffff">Horario</span></strong></td>
                            <td align="left" style="width: 160px; background-color: #990000" valign="top">
                                <strong><span style="color: #ffffff">Inicio</span></strong></td>
                            <td align="left" style="width: 160px; background-color: #990000" valign="top">
                                <strong><span style="color: #ffffff">Final</span></strong></td>
                            <td style="background-color: #990000">
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
            </asp:DataList>Si desea elimininar una materia de la selecci&oacute;n, pulse la <strong><span
                style="color: #ff0000">X</span></strong> del lado&nbsp;<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.SessiondeEstudianteTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblMatricula" DefaultValue="{0}" Name="matricula"
                        PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
            <br />
            Pulse el bot&oacute;n una sola vez<br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Generar Inscripci&oacute;n" Font-Bold="True" Font-Size="15px" /><br />
            <br />
            <br />
            <br />
            <table border="0" cellpadding="0" cellspacing="0" style="font-size: 11pt; font-family: Arial">
                <tr>
                    <td align="left" style="font-size: 13px; font-family: Arial; height: 21px; border-right: black 1px ridge; border-top: black 1px ridge; border-left: black 1px ridge; width: 150px; border-bottom: black 1px ridge;">
                        <strong>
            Costo de Inscripci&oacute;n</strong></td>
                    <td style="font-size: 13px; font-family: Arial; height: 21px; border-right: black 1px ridge; border-top: black 1px ridge; border-left: black 1px ridge; width: 150px; border-bottom: black 1px ridge;" align="left">
                        :
            <asp:Label ID="Label1" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td align="left" style="font-size: 13px; font-family: Arial; height: 21px; border-right: black 1px ridge; border-top: black 1px ridge; border-left: black 1px ridge; width: 150px; border-bottom: black 1px ridge;">
                        <strong>
            Cantidad de cr&eacute;ditos</strong></td>
                    <td style="font-size: 13px; font-family: Arial; height: 21px; border-right: black 1px ridge; border-top: black 1px ridge; border-left: black 1px ridge; width: 150px; border-bottom: black 1px ridge;" align="left">
                        :
            <asp:Label ID="Label2" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td align="left" style="font-size: 13px; font-family: Arial; height: 21px; border-right: black 1px ridge; border-top: black 1px ridge; border-left: black 1px ridge; width: 150px; border-bottom: black 1px ridge;">
                        <strong>
            Costo por materias</strong></td>
                    <td style="font-size: 13px; font-family: Arial; height: 21px; border-right: black 1px ridge; border-top: black 1px ridge; border-left: black 1px ridge; width: 150px; border-bottom: black 1px ridge;" align="left">
                        :
            <asp:Label ID="Label3" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td align="left" style="border-right: black 1px ridge; border-top: black 1px ridge;
                        font-size: 13px; border-left: black 1px ridge; width: 150px; border-bottom: black 1px ridge;
                        font-family: Arial; height: 21px">
                        <strong>Credito Pendiente</strong></td>
                    <td align="left" style="border-right: black 1px ridge; border-top: black 1px ridge;
                        font-size: 13px; border-left: black 1px ridge; width: 150px; border-bottom: black 1px ridge;
                        font-family: Arial; height: 21px">
                        :
                        <asp:Label ID="Label8" runat="server" Width="43px"></asp:Label></td>
                </tr>
                <tr>
                    <td align="left" style="font-size: 13px; font-family: Arial; height: 21px; border-right: black 1px ridge; border-top: black 1px ridge; border-left: black 1px ridge; width: 150px; border-bottom: black 1px ridge;">
                        <strong>Total</strong></td>
                    <td style="font-size: 13px; font-family: Arial; height: 21px; border-right: black 1px ridge; border-top: black 1px ridge; border-left: black 1px ridge; width: 150px; border-bottom: black 1px ridge;" align="left">
                        :
            <asp:Label ID="lbltotal" runat="server"></asp:Label></td>
                </tr>
            </table>
            </td>
    </tr>
    <tr>
        <td style="height: 46px" colspan="3" valign="top">
            &nbsp;<asp:Panel ID="pBuscar" runat="server" DefaultButton="btnBuscar">
                <table>
                <tr>
                    <td valign="middle">
                        Matr&iacute;cula</td>
                    <td>
                        <asp:TextBox ID="txtbuscar" runat="server"></asp:TextBox><asp:ImageButton
                ID="ImageButton4" runat="server" ImageUrl="~/images/botones/edit.gif" OnClick="ImageButton4_Click" /></td>
                    <td>
            <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                OnClick="btnBuscar_Click1" /></td>
                </tr>
            </table>
            </asp:Panel>
            &nbsp;&nbsp;&nbsp;<asp:Label ID="lblfaltadatos" runat="server" Font-Bold="True" Font-Names="Arial"
                Font-Size="10pt" ForeColor="Red" Width="382px"></asp:Label></td>
        <td colspan="1" style="width: 48px; height: 46px">
        </td>
    </tr>
    <tr>
        <td colspan="3" style="border-bottom: black 1px solid">
            <asp:DetailsView ID="dvBuscar" runat="server" AutoGenerateRows="False" CellPadding="4"
                DataKeyNames="cod_stu" DataSourceID="objBuscar_Matri" ForeColor="#333333" GridLines="None" Font-Names="Arial" Font-Size="13px" OnDataBound="dvBuscar_DataBound">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="matricula" HeaderText="Matr&#237;cula" SortExpression="matricula" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="cod_stu" HeaderText="C&#243;digo" InsertVisible="False" ReadOnly="True"
                        SortExpression="cod_stu" />
                    <asp:BoundField DataField="id_recinto" HeaderText="Recinto Id." SortExpression="id_recinto" />
                    <asp:BoundField DataField="carrera_nombre" HeaderText="Carrera" SortExpression="carrera_nombre" />
                </Fields>
                <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
                <EmptyDataRowStyle ForeColor="Red" />
            </asp:DetailsView>
            <asp:Label ID="lblrecintoid" runat="server" Visible="False"></asp:Label><asp:ObjectDataSource ID="objBuscar_Matri" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Estudiantes_ForSearchTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtbuscar" DefaultValue="{0}" Name="matricula" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Label ID="lblEstudianteNo" runat="server" Font-Bold="True" Font-Names="Arial"
                Font-Size="14px" ForeColor="Red" Text="EL ESTUDIANTE NO HA SIDO ENCONTRADO" Visible="False"></asp:Label></td>
        <td colspan="1" style="width: 48px">
            &nbsp; &nbsp;&nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <strong><span style="font-size: 10pt">
            Secciones Activas</span></strong></td>
        <td style="width: 48px;">
        </td>
    </tr>
    <tr>
        <td style="height: 24px" colspan="3">
            <asp:Panel ID="pSeccion" runat="server" DefaultButton="btnBuscarSeccion">
            <asp:TextBox ID="txtBusquedaSesion" runat="server"></asp:TextBox>&nbsp;
            <asp:ImageButton
                ID="btnBuscarSeccion" runat="server" ImageUrl="~/images/botones/btn_buscarseccion.jpg"
                OnClick="btnBuscarSeccion_Click" />&nbsp;
            &nbsp;<asp:ImageButton ID="ImageButton1" runat="server"
                    ImageUrl="~/images/botones/btn_vertodo.jpg" OnClick="ImageButton1_Click" /></asp:Panel>
        </td>
        <td style="width: 48px; height: 24px;">
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <br />
            Seleccione la(s) materias que el estudiante desea tomar<br />
            <br />
            <asp:GridView ID="gvSessiones" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="id_session" Font-Names="Arial" Font-Size="11px" ForeColor="#333333"
                GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:CommandField SelectText="&gt;&gt;" ShowSelectButton="True" />
                    <asp:BoundField DataField="session_cod" HeaderText="Clave" SortExpression="session_cod" />
                    <asp:BoundField DataField="materia_desc" HeaderText="Asignatura" SortExpression="materia_desc" />
                    <asp:BoundField DataField="mat_credit" HeaderText="Creditos" SortExpression="mat_credit" />
                    <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
                    <asp:BoundField DataField="Inscritos" HeaderText="Inscritos" SortExpression="Inscritos" />
                    <asp:BoundField DataField="horario" HeaderText="Horario" SortExpression="horario" />
                    <asp:TemplateField HeaderText="Fecha Inicio" SortExpression="f_inicio">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("f_inicio") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("f_inicio", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha Fin" SortExpression="f_fin">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("f_fin") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("f_fin", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.MateriasQuePuedeTomarTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtbuscar" DefaultValue="{0}" Name="matricula" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="lblrecintoid" DefaultValue="" Name="id_recinto"
                        PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="objSecc_Act" runat="server"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                TypeName="dsUniversidadTableAdapters.MateriasQuePuedeTomarTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtbuscar" DefaultValue="{0}" Name="matricula" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="lblrecintoid" DefaultValue="" Name="id_recinto"
                        PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="objBusquedaSession" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByBusquedaSession"
                TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtBusquedaSesion" Name="session_cod" PropertyName="Text"
                        Type="String" DefaultValue="{0}" />
                    <asp:ControlParameter ControlID="lblrecintoid" DefaultValue="" Name="id_recinto"
                        PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="5" style="height: 29px">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label><br />
            <asp:Label ID="lblcupo" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label><br />
            Haga clic en la impresora para imprimir la hoja de inscripci&oacute;n<asp:ImageButton ID="ImageButton3"
                runat="server" ImageUrl="~/images/print.jpg" OnClick="ImageButton3_Click" /></td>
    </tr>
    <tr>
        <td style="height: 16px">
        </td>
        <td style="height: 16px">
            </td>
        <td style="height: 16px">
        </td>
        <td style="width: 48px; height: 16px;">
        </td>
        <td style="padding-right: 10px; height: 16px;" align="right"><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
                OnClick="ImageButton2_Click" /></td>
    </tr>
</table>
