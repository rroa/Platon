<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="moverSeccion.aspx.cs" Inherits="moverSeccion" %>
<%@  Register TagPrefix="ew"   Namespace="eWorld.UI.Compatibility"  Assembly="eWorld.UI.Compatibility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">MOVER ESTUDIANTE DE SECCION
        <hr />
    </span>
    <br />
    <table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; font-family: Arial">
        <tr>
            <td style="width: 204px">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 204px">
                Escriba la matrícula del estudiante</td>
            <td>
                <ew:MaskedTextBox ID="txtmatricula" runat="server" Font-Names="Arial" Font-Size="12px"
                    Mask="99-9999" MaxLength="7" ValidationExpression="\d{2}-\d{4}" Width="150px"></ew:MaskedTextBox></td>
            <td>
                <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                    OnClick="btnBuscar_Click1" /></td>
        </tr>
        <tr>
            <td style="width: 204px; height: 14px">
            </td>
            <td style="height: 14px">
            </td>
            <td style="height: 14px">
            </td>
        </tr>
        <tr>
            <td colspan="3" valign="top">
                <asp:DetailsView ID="dvBuscar" runat="server" AutoGenerateRows="False" CellPadding="4"
                    DataKeyNames="cod_stu" DataSourceID="objBuscar_Matri" Font-Names="Arial" Font-Size="13px"
                    ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                    <EmptyDataRowStyle ForeColor="Red" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="matricula" HeaderText="Matr&#237;cula" SortExpression="matricula" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                        <asp:BoundField DataField="cod_stu" HeaderText="C&#243;digo" InsertVisible="False"
                            ReadOnly="True" SortExpression="cod_stu" />
                        <asp:BoundField DataField="id_recinto" HeaderText="Recinto Id." SortExpression="id_recinto" />
                        <asp:BoundField DataField="carrera_nombre" HeaderText="Carrera" SortExpression="carrera_nombre" />
                    </Fields>
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
                <asp:ObjectDataSource ID="objBuscar_Matri" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Estudiantes_ForSearchTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="height: 24px">
                <strong>Secciones del estudiante</strong></td>
            <td style="height: 24px">
            </td>
        </tr>
        <tr>
            <td colspan="3" valign="top">
                <br />
                <asp:GridView ID="gvSecciones" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="id_session_stud" DataSourceID="objSessiondeEstudiante" Font-Names="Arial"
                    Font-Size="12px" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvSecciones_SelectedIndexChanged">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                        <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
                        <asp:BoundField DataField="session_id" HeaderText="Id." SortExpression="session_id" />
                        <asp:BoundField DataField="session_cod" HeaderText="Seccion" SortExpression="session_cod" />
                        <asp:BoundField DataField="mat_cod" HeaderText="Mat. Cod." SortExpression="mat_cod" />
                        <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
                        <asp:BoundField DataField="mat_credit" HeaderText="Creditos" SortExpression="mat_credit" />
                        <asp:BoundField DataField="profesor" HeaderText="Profesor" ReadOnly="True" SortExpression="profesor" />
                        <asp:TemplateField HeaderText="F. de inscripcion" SortExpression="f_inscripcion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("f_inscripcion") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("f_inscripcion", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="objSessiondeEstudiante" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.SessiondeEstudianteTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Label ID="lblmateria" runat="server" Text="0" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 204px; height: 13px">
            </td>
            <td style="height: 13px">
            </td>
            <td style="height: 13px">
            </td>
        </tr>
        <tr>
            <td colspan="3" style="height: 13px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="id_session" DataSourceID="objSeccionesIguales" ForeColor="#333333"
                    GridLines="None">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                        <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
                        <asp:BoundField DataField="id_session" HeaderText="Id." InsertVisible="False" ReadOnly="True"
                            SortExpression="id_session" />
                        <asp:BoundField DataField="session_cod" HeaderText="Seccion" SortExpression="session_cod" />
                        <asp:BoundField DataField="materia" HeaderText="Cod. Mat." SortExpression="materia" />
                        <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
                        <asp:BoundField DataField="mat_credit" HeaderText="Creditos" SortExpression="mat_credit" />
                        <asp:BoundField DataField="Inscritos" HeaderText="Inscritos" SortExpression="Inscritos" />
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
                        <asp:ControlParameter ControlID="lblmateria" Name="materia" PropertyName="Text" Type="String" DefaultValue="{0}" />
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

