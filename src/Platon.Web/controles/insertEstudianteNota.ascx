<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertEstudianteNota.ascx.cs" Inherits="controles_insertEstudianteNota" %>
<%@  Register TagPrefix="ew"   Namespace="eWorld.UI.Compatibility"  Assembly="eWorld.UI.Compatibility" %>

<span style="font-size: 24px; font-family: Arial">NOTA DE ESTUDIANTES
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; font-family: Arial">
    <tr>
        <td>
            Escriba la matr&iacute;cula del estudiante</td>
        <td>
            <ew:MaskedTextBox ID="txtmatricula" runat="server" Font-Names="Arial" Font-Size="12px"
                Mask="99-9999" MaxLength="7" ValidationExpression="\d{2}-\d{4}" Width="150px"></ew:MaskedTextBox>&nbsp;<asp:ImageButton ID="ImageButton2" runat="server"
                    ImageUrl="~/images/botones/edit.gif" OnClick="ImageButton2_Click" /></td>
        <td>
            <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                OnClick="btnBuscar_Click1" /></td>
    </tr>
    <tr>
        <td style="height: 14px;">
        </td>
        <td style="height: 14px">
        </td>
        <td style="height: 14px">
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
                    <asp:BoundField DataField="matricula" HeaderText="Matr&iacute;cula" SortExpression="matricula" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="f_nacimiento" HeaderText="F. de nacimiento" SortExpression="f_nacimiento" />
                    <asp:BoundField DataField="telefono" HeaderText="Tel&eacute;fono" SortExpression="telefono" />
                    <asp:BoundField DataField="cedula" HeaderText="C&eacute;dula" SortExpression="cedula" />
                    <asp:BoundField DataField="ano_ingreso" HeaderText="A&ntilde;o de ingreso" SortExpression="ano_ingreso" />
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
        <td style="height: 14px;">
        </td>
        <td style="height: 14px">
        </td>
        <td style="height: 14px">
        </td>
    </tr>
    <tr>
        <td colspan="2" style="height: 24px">
            <strong>
            Secciones del estudiante</strong></td>
        <td style="height: 24px">
        </td>
    </tr>
    <tr>
        <td colspan="3" valign="top">
            <br />
            <asp:GridView ID="gvSecciones" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="id_session_stud" DataSourceID="objSessiondeEstudiante" Font-Names="Arial"
                Font-Size="12px" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                    <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
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
        </td>
    </tr>
    <tr>
        <td style="height: 13px;">
        </td>
        <td style="height: 13px">
        </td>
        <td style="height: 13px">
        </td>
    </tr>
    <tr>
        <td>
            <strong>Calificaci&oacute;n<br />
            </strong><span style="font-family: Arial">
                <br />
                Nota:<br />
                Debe ser asignada en n&uacute;mero y literal.</span><br />
        </td>
        <td>
            Literal<br />
            <asp:DropDownList ID="ddlNota" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Nota"
                DataValueField="Nota" Width="108px" Font-Names="Arial" OnDataBound="ddlNota_DataBound">
            </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                TypeName="dsUniversidadTableAdapters.tblNotasTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_nota" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nota" Type="String" />
                    <asp:Parameter Name="Original_id_nota" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Nota" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <br />
            N&uacute;mero
            <br />
            <asp:TextBox ID="txtNotaNum" runat="server" Width="50px" MaxLength="3" Font-Names="Arial"></asp:TextBox><br />
            Primer Parcial EE<br />
            <asp:TextBox ID="txtppEE" runat="server" MaxLength="3" Width="50px">0</asp:TextBox><br />
            Primer Parcial PR<br />
            <asp:TextBox ID="txtppPR" runat="server" MaxLength="3" Width="50px">0</asp:TextBox><br />
            Segundo Parcial EE<br />
            <asp:TextBox ID="txtspEE" runat="server" MaxLength="3" Width="50px">0</asp:TextBox><br />
            Segundo Parcial PR<br />
            <asp:TextBox ID="txtspPR" runat="server" MaxLength="3" Width="50px">0</asp:TextBox><br />
            Examen Final<br />
            <asp:TextBox ID="txtef" runat="server" MaxLength="3" Width="50px">0</asp:TextBox></td>
        <td>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="3">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td style="height: 16px;">
        </td>
        <td style="height: 16px">
            <asp:ImageButton ID="btnRegistrar" runat="server" ImageUrl="~/images/botones/btn_registrar.jpg"
                OnClick="btnRegistrar_Click1" /></td>
        <td style="height: 16px">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
                OnClick="ImageButton1_Click" /></td>
    </tr>
</table>
