<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="moverSeccionGrupo.aspx.cs" Inherits="moverSeccion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">MOVER ESTUDIANTE DE SECCION&nbsp;
        <hr />
    </span>
    <table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; font-family: Arial">
        <tr>
            <td style="width: 204px; height: 13px;">
                Buscar sección por código</td>
            <td style="height: 13px">
                </td>
            <td style="height: 13px">
                </td>
        </tr>
        <tr>
            <td style="width: 204px; height: 14px">
                <asp:TextBox ID="txtseccion" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="height: 14px">
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" /></td>
            <td style="height: 14px">
            </td>
        </tr>
        <tr>
            <td colspan="3" valign="top">
                Sección Inicial<br />
                <asp:GridView ID="gvSeccion" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource3" Font-Names="Arial"
                    Font-Size="12px" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvSeccion_SelectedIndexChanged" DataKeyNames="id_session">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />
                    <Columns>
                        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                        <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
                        <asp:BoundField DataField="id_session" HeaderText="Id" InsertVisible="False"
                            ReadOnly="True" SortExpression="id_session" />
                        <asp:BoundField DataField="session_cod" HeaderText="Seccion" SortExpression="session_cod" />
                        <asp:BoundField DataField="materia" HeaderText="Mat. cod." SortExpression="materia" />
                        <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
                        <asp:BoundField DataField="mat_credit" HeaderText="Cr." SortExpression="mat_credit" />
                        <asp:BoundField DataField="profesor" HeaderText="Profesor" ReadOnly="True" SortExpression="profesor" />
                        <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad" />
                        <asp:BoundField DataField="Inscritos" HeaderText="Inscritos" SortExpression="Inscritos" />
                        <asp:BoundField DataField="horario" HeaderText="Horario" SortExpression="horario" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByID_Session" TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtseccion" DefaultValue="{0}" Name="session_cod"
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Label ID="lblmateria" runat="server" Text="0" Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="3" style="height: 13px">
                <br />
                Estudiantes en la sección<br />
                <br />
                <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource2">
                    <ItemTemplate>
                        <table style="width: 479px">
                            <tr>
                                <td style="width: 100px">
                                    <asp:CheckBox ID="CheckBox1" runat="server" Font-Bold="True" Text="mover" /></td>
                                <td style="width: 100px">
                                    <asp:Label ID="lblMatricula" runat="server" Font-Bold="True" Text='<%# Eval("matricula") %>'
                                        Width="112px"></asp:Label></td>
                                <td style="width: 115px">
                                    <asp:Label ID="lblNombreCompleto" runat="server" Font-Bold="True" Text='<%# Eval("NombreCompleto") %>'
                                        Width="225px"></asp:Label></td>
                            </tr>
                        </table>
                        <asp:Label ID="cod_stu" runat="server" Text='<%# Eval("id_estudiante") %>' Visible="False"></asp:Label>
                        <asp:Label ID="id_seccion_stud" runat="server" Text='<%# Eval("id_session_stud") %>'
                            Visible="False"></asp:Label>
                    </ItemTemplate>
                </asp:DataList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBySession" TypeName="dsUniversidadTableAdapters.Estudiantes_en_sesionTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvSeccion" Name="session" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 204px; height: 18px">
            </td>
            <td style="height: 18px">
            </td>
            <td style="height: 18px">
            </td>
        </tr>
        <tr>
            <td style="width: 204px; height: 13px">
                Nueva sección</td>
            <td style="height: 13px">
            </td>
            <td style="height: 13px">
            </td>
        </tr>
        <tr>
            <td colspan="3" style="height: 13px">
                <asp:GridView ID="gvNuevaSeccion" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="objSeccionesIguales" ForeColor="#333333"
                    GridLines="None" DataKeyNames="id_session">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                        <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
                        <asp:BoundField DataField="id_session" HeaderText="Id" InsertVisible="False"
                            ReadOnly="True" SortExpression="id_session" />
                        <asp:BoundField DataField="session_cod" HeaderText="Seccion" SortExpression="session_cod" />
                        <asp:BoundField DataField="materia" HeaderText="Mat. cod" SortExpression="materia" />
                        <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
                        <asp:BoundField DataField="mat_credit" HeaderText="Cr." SortExpression="mat_credit" />
                        <asp:BoundField DataField="profesor" HeaderText="Profesor" ReadOnly="True" SortExpression="profesor" />
                        <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad" />
                        <asp:BoundField DataField="Inscritos" HeaderText="Inscritos" SortExpression="Inscritos" />
                        <asp:BoundField DataField="horario" HeaderText="Horario" SortExpression="horario" />
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="objSeccionesIguales" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByMateriaCod" TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblmateria" Name="materia" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 204px">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 204px; height: 16px">
            </td>
            <td style="height: 16px">
                <asp:ImageButton ID="btnRegistrar" runat="server" ImageUrl="~/images/botones/btn_registrar.jpg"
                    OnClick="btnRegistrar_Click1" /></td>
            <td style="height: 16px">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
                    OnClick="ImageButton1_Click" /></td>
        </tr>
    </table>
</asp:Content>

