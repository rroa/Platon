<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="FormBalancePendienteViejo.aspx.cs" Inherits="Balance_Pendiente_Viejo"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial"><span style="font-size: 17pt">REGISTRO DE DEUDAS MANUAL</span>
        <hr />
    </span>
    <br />
    <table style="font-size: 12px; font-family: Arial">
        <tr>
            <td style="width: 125px" align="left" valign="top">
                <strong>
                MATRICULA</strong></td>
            <td style="width: 389px" align="left" valign="top">
                <asp:TextBox ID="txtmatricula" runat="server"></asp:TextBox>
                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg" /></td>
        </tr>
        <tr>
            <td style="width: 125px" align="left" valign="top">
                ESTUDIANTE</td>
            <td style="width: 389px" align="left" valign="top">
                <asp:DetailsView ID="dvDatos" runat="server" AutoGenerateRows="False" CellPadding="4"
                    DataKeyNames="cod_stu" DataSourceID="objporMatrcula" Font-Names="Arial" Font-Size="12px"
                    ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="matricula" HeaderText="Matr&#237;cula" SortExpression="matricula" />
                        <asp:BoundField DataField="cod_stu" HeaderText="C&#243;digo" InsertVisible="False" ReadOnly="True"
                            SortExpression="cod_stu" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                        <asp:BoundField DataField="f_nacimiento" HeaderText="F. de nacimiento" SortExpression="f_nacimiento" />
                        <asp:BoundField DataField="telefono" HeaderText="Tel&#233;fono" SortExpression="telefono" />
                        <asp:BoundField DataField="cedula" HeaderText="C&#233;dula" SortExpression="cedula" />
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
            <td style="width: 125px" align="left" valign="top">
                CONCEPTO</td>
            <td style="width: 389px" align="left" valign="top">
                <asp:TextBox ID="txtconcepto" runat="server" Width="275px"></asp:TextBox>
                <strong><span style="font-size: 8pt; color: #ff0000">no usar comas (,)</span></strong></td>
        </tr>
        <tr>
            <td style="width: 125px; height: 21px" align="left" valign="top">
                MONTO</td>
            <td style="width: 389px; height: 21px" align="left" valign="top">
                <asp:TextBox ID="txtmonto" runat="server"></asp:TextBox><span style="font-size: 8pt;
                    color: #ff0000"><strong>(solo n&uacute;meros)</strong></span></td>
        </tr>
        <tr>
            <td style="width: 125px">
            </td>
            <td style="width: 389px">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: right">
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                    OnClick="ImageButton2_Click" />
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
                    OnClick="ImageButton1_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

