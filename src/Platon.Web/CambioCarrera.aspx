<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="CambioCarrera.aspx.cs" Inherits="CambioCarrera"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">CAMBIO DE CARRERA
        <hr />
    </span>
    <asp:CheckBox ID="CkkCambio" runat="server" Enabled="False" Text="Confirmar Cambio" /><br />
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="height: 24px">
            </td>
            <td style="height: 24px">
            </td>
            <td style="height: 24px">
            </td>
            <td style="height: 24px">
            </td>
            <td style="width: 19px; height: 24px">
            </td>
            <td style="height: 24px">
            </td>
            <td style="height: 24px">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <span style="font-family: Arial; font-size: 9pt;"><strong>Matr&iacute;cula</strong></span></td>
            <td>
                <asp:TextBox ID="txtmatricula" runat="server"></asp:TextBox></td>
            <td>
                <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg" OnClick="btnBuscar_Click" /></td>
            <td style="width: 19px">
            </td>
            <td>
                <span style="font-size: 9pt; font-family: Arial"><strong>Nueva carrera</strong></span></td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1"
                    DataTextField="carrera_nombre" DataValueField="id_carrera" OnDataBound="DropDownList1_DataBound">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
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
            <td style="height: 25px">
            </td>
            <td style="height: 25px" colspan="3">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4"
                    DataSourceID="objEstudiante" Font-Names="Arial" Font-Size="9pt" ForeColor="#333333"
                    GridLines="None">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="matricula" HeaderText="Matr&iacute;cula" SortExpression="matricula" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                        <asp:BoundField DataField="cedula" HeaderText="C&eacute;dula" SortExpression="cedula" />
                        <asp:BoundField DataField="telefono" HeaderText="Tel&eacute;fono" SortExpression="telefono" />
                        <asp:BoundField DataField="carrera_nombre" HeaderText="Carrera" SortExpression="carrera_nombre" />
                    </Fields>
                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
                <asp:ObjectDataSource ID="objEstudiante" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <br />
            </td>
            <td style="width: 19px; height: 25px">
            </td>
            <td style="height: 25px">
                <span style="font-size: 9pt; font-family: Arial">Motivo del Cambio</span></td>
            <td style="height: 25px">
                <asp:TextBox ID="txtmotivo" runat="server" Width="307px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
            </td>
            <td colspan="3">
                <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Size="10pt" Text="Est&aacute; inscrito en la carrera : "></asp:Label>
                <asp:Label ID="lblcarrera" runat="server" Font-Names="Arial"></asp:Label></td>
            <td colspan="1" style="width: 19px">
            </td>
            <td colspan="1">
            </td>
            <td colspan="1">
                <asp:ImageButton ID="btnInscribir" runat="server" ImageUrl="~/images/botones/btn_inscribir.jpg"
                    OnClick="btnInscribir_Click" /></td>
        </tr>
        <tr>
            <td style="height: 26px">
            </td>
            <td style="height: 26px">
            </td>
            <td style="height: 26px">
            </td>
            <td style="height: 26px">
                <asp:Label ID="lblnoinsc" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblidstudent" runat="server" Visible="False"></asp:Label></td>
            <td style="width: 19px; height: 26px">
            </td>
            <td style="height: 26px">
            </td>
            <td style="height: 26px">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td align="center" colspan="6">
                <asp:Label ID="lblmsg" runat="server" Font-Names="Arial" Font-Bold="True" Font-Size="15px"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

