<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="eliminarmateria.aspx.cs" Inherits="eliminarnota" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">ELIMINAR MATERIA DEL RECORD
        <hr />
    </span>
    <table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; font-family: Arial">
        <tr>
            <td style="width: 205px">
            </td>
            <td>
            </td>
            <td style="width: 101px">
            </td>
        </tr>
        <tr>
            <td style="width: 205px">
                Escriba la matrícula del estudiante</td>
            <td>
                <asp:TextBox ID="txtmatricula" runat="server" Font-Names="Arial" Font-Size="12px"
                    Width="160px"></asp:TextBox></td>
            <td style="width: 101px">
                <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                    OnClick="btnBuscar_Click1" /></td>
        </tr>
        <tr>
            <td style="width: 205px; height: 14px">
            </td>
            <td style="height: 14px">
            </td>
            <td style="width: 101px; height: 14px">
            </td>
        </tr>
        <tr>
            <td colspan="3" valign="top">
                <asp:DetailsView ID="dvDatos" runat="server" AutoGenerateRows="False" CellPadding="4"
                    DataKeyNames="cod_stu" DataSourceID="objporMatrcula" Font-Names="Arial" Font-Size="12px"
                    ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="matricula" HeaderText="Matr&#237;cula" SortExpression="matricula" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                        <asp:BoundField DataField="cedula" HeaderText="C&#233;dula" SortExpression="cedula" />
                        <asp:BoundField DataField="f_nacimiento" HeaderText="F. de nacimiento" SortExpression="f_nacimiento" />
                        <asp:BoundField DataField="telefono" HeaderText="Tel&#233;fono" SortExpression="telefono" />
                        <asp:BoundField DataField="ano_ingreso" HeaderText="A&#241;o de ingreso" SortExpression="ano_ingreso" />
                        <asp:TemplateField HeaderText="Fecha de ingreso" SortExpression="fecha_ingreso">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha_ingreso") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha_ingreso") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha_ingreso", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
                <asp:ObjectDataSource ID="objporMatrcula" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.BuscarEstudianteporMatriculaTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 205px; height: 14px">
            </td>
            <td style="height: 14px">
            </td>
            <td style="width: 101px; height: 14px">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 24px">
                <strong>Materias del estudiante</strong></td>
            <td style="width: 101px; height: 24px">
            </td>
        </tr>
        <tr>
            <td colspan="3" valign="top">
                <br />
                <asp:GridView ID="gvSecciones" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="id_nota" DataSourceID="objSessiondeEstudiante" Font-Names="Arial"
                    Font-Size="12px" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                        <asp:BoundField DataField="session_cod" HeaderText="Seccion" SortExpression="session_cod" />
                        <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
                        <asp:BoundField DataField="nota" HeaderText="Nota (Lit.)" SortExpression="nota" />
                        <asp:BoundField DataField="nota_num" HeaderText="Nota (Num.)" SortExpression="nota_num" />
                        <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
                        <asp:TemplateField HeaderText="F. Inscripcion" SortExpression="f_inscripcion">
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
                    SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.view_Notas_EstudiantesTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 205px; height: 13px">
            </td>
            <td style="height: 13px">
            </td>
            <td style="width: 101px; height: 13px">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 205px">
            </td>
            <td>
            </td>
            <td style="width: 101px">
            </td>
        </tr>
        <tr>
            <td style="width: 205px; height: 16px">
            </td>
            <td style="height: 16px">
                <asp:ImageButton ID="btnRegistrar" runat="server" ImageUrl="~/images/botones/btn_eliminar.jpg"
                    OnClick="btnRegistrar_Click1" /></td>
            <td style="width: 101px; height: 16px">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
                    OnClick="ImageButton1_Click" /></td>
        </tr>
    </table>
</asp:Content>

