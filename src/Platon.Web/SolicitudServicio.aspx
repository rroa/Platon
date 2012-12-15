<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="SolicitudServicio.aspx.cs" Inherits="SolicitudServicio"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">SOLICITUD DE SERVICIOS
        <hr />
    </span>
    <br />
    <table>
        <tr>
            <td style="width: 100px">
                <asp:Label ID="Label1" runat="server" Text="Matr&iacute;cula" Width="64px" Font-Bold="True" Font-Names="Arial" Font-Size="13px"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtMatricula" runat="server"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg" OnClick="ImageButton1_Click" /></td>
        </tr>
        <tr>
            <td colspan="3" style="border-bottom: black 1px solid">
                <asp:DetailsView ID="dvEstudiante" runat="server" AutoGenerateRows="False" CellPadding="4"
                    DataKeyNames="cod_stu" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None"
                    Height="50px" Width="292px" OnItemCommand="dvEstudiante_ItemCommand" Font-Names="Arial" Font-Size="12px" OnDataBound="dvEstudiante_DataBound">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="matricula" HeaderText="Matricula" SortExpression="matricula" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                        <asp:BoundField DataField="cedula" HeaderText="C&#233;dula" SortExpression="cedula" />
                        <asp:BoundField DataField="telefono" HeaderText="Tel&#233;fono" SortExpression="telefono" />
                        <asp:TemplateField HeaderText="F. Nacimiento" SortExpression="f_nacimiento">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("f_nacimiento") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("f_nacimiento") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("f_nacimiento") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                    <EmptyDataRowStyle ForeColor="Red" />
                </asp:DetailsView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.BuscarEstudianteporMatriculaTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtMatricula" Name="matricula" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Label ID="lblcarrera" runat="server" Visible="False"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 16px; text-align: center">
                <strong><span style="font-size: 12px; font-family: Arial">Servicios Disponibles con Formularios</span></strong></td>
            <td>
                <span style="font-size: 12px; font-family: Arial"><strong>
                Servicios Disponibles sin Formularios</strong></span></td>
        </tr>
        <tr>
            <td colspan="2" align="left" valign="top">
                <asp:GridView ID="gvServicios" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="id_servicios" DataSourceID="ObjectDataSource2" ForeColor="#333333"
                    GridLines="None" OnSelectedIndexChanged="gvServicios_SelectedIndexChanged" Font-Names="Arial" Font-Size="12px" AllowPaging="True" Enabled="False">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripci&#243;n" SortExpression="descripcion" />
                        <asp:BoundField DataField="costo" HeaderText="Costo" SortExpression="costo" />
                        <asp:CheckBoxField DataField="formulario" HeaderText="Form." SortExpression="formulario" />
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByTieneForm"
                    TypeName="dsUniversidadTableAdapters.ServiciosTableAdapter">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id_servicios" Type="Int32" />
                    </DeleteParameters>
                </asp:ObjectDataSource>
            </td>
            <td align="left" valign="top"><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="id_servicios" DataSourceID="ObjectDataSource3" ForeColor="#333333"
                    GridLines="None" Font-Names="Arial" Font-Size="12px" AllowPaging="True" Enabled="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripci&#243;n" SortExpression="descripcion" />
                    <asp:BoundField DataField="costo" HeaderText="Costo" SortExpression="costo" />
                    <asp:CheckBoxField DataField="formulario" HeaderText="Form." SortExpression="formulario" />
                </Columns>
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete"
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByNotieneForm"
                    TypeName="dsUniversidadTableAdapters.ServiciosTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id_servicios" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="descripcion" Type="String" />
                        <asp:Parameter Name="costo" Type="Decimal" />
                        <asp:Parameter Name="activo" Type="Boolean" />
                        <asp:Parameter Name="formulario" Type="Boolean" />
                        <asp:Parameter Name="Original_id_servicios" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="descripcion" Type="String" />
                        <asp:Parameter Name="costo" Type="Decimal" />
                        <asp:Parameter Name="activo" Type="Boolean" />
                        <asp:Parameter Name="formulario" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="height: 30px" valign="middle">
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial"></asp:Label></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/botones/btn_agregar.jpg"
                    OnClick="ImageButton2_Click" />&nbsp;
                <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
                    OnClick="btnCancelar_Click" /></td>
        </tr>
    </table>
</asp:Content>

