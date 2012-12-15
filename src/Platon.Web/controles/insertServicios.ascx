<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertServicios.ascx.cs" Inherits="controles_insertServicios" %>
<span style="font-size: 24px; font-family: Arial">ADMINISTRACION DE SERVICIOS
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
    border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid">
    <tr>
        <td colspan="3" style="height: 24px">
        </td>
    </tr>
    <tr>
        <td valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid;
                font-family: Arial">
                <tr>
                    <td colspan="2" style="border-right: black 1px solid; border-top: black 1px solid;
                        padding-left: 5px; border-left: black 1px solid; border-bottom: black 1px solid;
                        height: 30px; background-color: whitesmoke">
                        <strong>INSERTAR SERVICIOS</strong></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>Servicio</strong></td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtnombre" runat="server" Font-Names="Arial" Font-Size="12px"
                            Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>Costo</strong></td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtcosto" runat="server" Font-Names="Arial" Font-Size="12px" Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>Tiene Formulario?</strong></td>
                    <td style="padding-left: 5px">
                        <asp:CheckBox ID="CheckBox1" runat="server" /></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px; height: 18px">
                    </td>
                    <td style="padding-left: 5px; height: 18px">
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="padding-left: 5px; height: 31px">
                        <asp:Label ID="lblmsg" runat="server" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left: 5px; height: 34px">
                        &nbsp;<asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                            OnClick="btnGuardar_Click1" />
                        &nbsp;
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_cancelar.jpg"
                            OnClick="ImageButton1_Click" /></td>
                </tr>
            </table>
        </td>
        <td style="width: 35px" valign="top">
        </td>
        <td valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid;
                font-family: Arial">
                <tr>
                    <td colspan="2" style="border-right: black 1px solid; border-top: black 1px solid;
                        padding-left: 5px; border-left: black 1px solid; border-bottom: black 1px solid;
                        height: 30px; background-color: whitesmoke">
                        <strong>SERVICIOS ACTUALES</strong></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gvServicios" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_servicios" DataSourceID="objServicios"
                            Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:CommandField CancelText="Cancelar" EditText="Editar" ShowEditButton="True" UpdateText="Actualizar" />
                                <asp:BoundField DataField="descripcion" HeaderText="Servicio" SortExpression="descripcion" />
                                <asp:TemplateField HeaderText="Costo" SortExpression="costo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("costo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("costo", "{0:C}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="objServicios" runat="server" DeleteMethod="Delete"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByActivo" TypeName="dsUniversidadTableAdapters.ServiciosTableAdapter" InsertMethod="Insert" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_id_servicios" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="descripcion" Type="String" />
                                <asp:Parameter Name="costo" Type="Decimal" />
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
            </table>
        </td>
    </tr>
</table>
