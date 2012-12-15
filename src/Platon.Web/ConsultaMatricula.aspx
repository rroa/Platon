<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ConsultaMatricula.aspx.cs" Inherits="ConsultaMatricula" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">CONSULTA DE MATRICULA<br />
    </span>
    <hr />
    <br />
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2" style="height: 29px">
                <span style="font-size: 12px; font-family: Arial">
                Escriba el apellido del estudiante para saber su matr&iacute;cula</span></td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtapellido" runat="server" Width="245px"></asp:TextBox></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Buscar" /></td>
        </tr>
        <tr>
            <td colspan="2" style="height: 16px">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="cod_stu" DataSourceID="objApellido" Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="COPIAR" ShowSelectButton="True" />
                        <asp:BoundField DataField="matricula" HeaderText="Matr&#237;cula" SortExpression="matricula" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                        <asp:BoundField DataField="cedula" HeaderText="C&#233;dula" SortExpression="cedula" />
                        <asp:BoundField DataField="telefono" HeaderText="Tel&#233;fono" SortExpression="telefono" />
                        <asp:BoundField DataField="carrera_nombre" HeaderText="Carrera" SortExpression="carrera_nombre" />
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="objApellido" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByApellido" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtapellido" DefaultValue="{0}" Name="apellido"
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    <span style="font-size: 12px; font-family: Arial"><strong>Nota:</strong><br />
        No es necesario escribir el apellido completo, con una parte de &eacute;ste ya puede consultar.</span>
</asp:Content>

