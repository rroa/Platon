<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="DesactivarEstudiante.aspx.cs" Inherits="DesactivarEstudiante"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 18pt; font-family: Arial">DESACTIVAR / ACTIVAR ESTUDIANTES</span>
    <hr />
    <table>
        <tr>
            <td align="left" style="text-align: left">
                &nbsp;<asp:Label ID="Label3" runat="server" Font-Names="Arial" Font-Size="12px" Text="Escriba la matr&iacute;cula del estudiante"></asp:Label></td>
        </tr>
        <tr>
            <td align="left">
                <asp:TextBox ID="txtEstudiante" runat="server" Width="139px"></asp:TextBox>&nbsp;<asp:ImageButton
                    ID="btnBuscarEstudiante" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                    /></td>
        </tr>
        <tr>
            <td style="text-align: center" valign="top">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="cod_stu" DataSourceID="ObjectDataSource1" Font-Names="Arial"
                    Font-Size="12px" ForeColor="#333333" GridLines="None" OnDataBound="GridView1_DataBound">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="matricula" HeaderText="Matricula" SortExpression="matricula" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                        <asp:BoundField DataField="cedula" HeaderText="Cedula" SortExpression="cedula" />
                        <asp:BoundField DataField="carrera_nombre" HeaderText="Carrera" SortExpression="carrera_nombre" />
                        <asp:CheckBoxField DataField="EstActivo" HeaderText="Activo" SortExpression="EstActivo" />
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtEstudiante" DefaultValue="{0}" Name="matricula"
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="height: 26px; text-align: center">
                <asp:Button ID="btnEstudianteDesactivar" runat="server" OnClick="btnEstudianteDesactivar_Click"
                    Text="Desactivar" />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Activar" Width="90px" /></td>
        </tr>
        <tr>
            <td style="height: 14px">
            </td>
        </tr>
    </table>
</asp:Content>

