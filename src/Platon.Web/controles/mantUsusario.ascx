<%@ Control Language="C#" AutoEventWireup="true" CodeFile="mantUsusario.ascx.cs" Inherits="controles_mantUsusario" %>
<span style="font-size: 24px; font-family: Arial">USUARIOS DEL SISTEMA
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; width: 100%;
    font-family: Arial; height: 100%">
    <tr>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_user" DataSourceID="objUsuarios"
                Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:CommandField SelectText="Modificar" ShowSelectButton="True" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="cedula" HeaderText="C&#233;dula" SortExpression="cedula" />
                    <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
                    <asp:BoundField DataField="descripcion" HeaderText="Rol" SortExpression="descripcion" />
                </Columns>
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="objUsuarios" runat="server"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.UsuariosSistemaTableAdapter">
            </asp:ObjectDataSource>
        </td>
    </tr>
    <tr>
        <td style="height: 20px">
        </td>
        <td style="height: 20px">
        </td>
        <td style="height: 20px">
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Panel ID="Panel1" runat="server" Visible="False">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%; font-size: 12px; font-family: Arial;">
                    <tr>
                        <td colspan="2" style="background-color: gainsboro">
                            <strong><span style="font-size: 11pt">Modificar Usuario</span></strong></td>
                    </tr>
                    <tr>
                        <td style="height: 18px">
                        </td>
                        <td style="height: 18px">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>USUARIO</strong></td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="12pt"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            Nombre</td>
                        <td>
                            <asp:TextBox ID="txtnombre" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            Apellido</td>
                        <td>
                            <asp:TextBox ID="txtapellido" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="height: 19px">
                            C&eacute;dula</td>
                        <td style="height: 19px">
                            <asp:TextBox ID="txtcedula" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            Sexo</td>
                        <td>
                            <asp:RadioButtonList ID="rblsexo" runat="server" RepeatColumns="2" Font-Names="Arial" Font-Size="12px">
                                <asp:ListItem Selected="True">M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td>
                            Tel&eacute;fono</td>
                        <td>
                            <asp:TextBox ID="txttelefono" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            Direcci&oacute;n</td>
                        <td>
                            <asp:TextBox ID="txtdireccion" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            Lugar de Nacimiento</td>
                        <td>
                            <asp:TextBox ID="txtlugar" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            Fecha de Nacimiento</td>
                        <td>
                            <asp:TextBox ID="txtfecha" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            Estado Civil</td>
                        <td>
                            <asp:DropDownList ID="ddlestado" runat="server">
                                <asp:ListItem>Soltero</asp:ListItem>
                                <asp:ListItem>Casado</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            Rol</td>
                        <td>
                            <asp:DropDownList ID="ddlrol" runat="server" DataSourceID="objRoles" DataTextField="descripcion"
                                DataValueField="id_rol">
                            </asp:DropDownList><asp:ObjectDataSource ID="objRoles" runat="server" DeleteMethod="Delete"
                                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                                TypeName="dsUniversidadTableAdapters.RolTableAdapter" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_id_rol" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="descripcion" Type="String" />
                                    <asp:Parameter Name="Original_id_rol" Type="Int32" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="descripcion" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 22px">
                        </td>
                        <td style="height: 22px">
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                                OnClick="btnGuardar_Click1" /></td>
                    </tr>
                    <tr>
                        <td style="height: 22px">
                        </td>
                        <td style="height: 22px">
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Size="15px" Font-Names="Arial"></asp:Label></td>
    </tr>
    <tr>
        <td style="height: 19px">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/listadoUsuarios.aspx">Imprimir Listado de Usuarios</asp:HyperLink></td>
        <td style="height: 19px">
        </td>
        <td style="height: 19px">
        </td>
    </tr>
</table>
