<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="cambioClave.aspx.cs" Inherits="cambioClave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">CAMBIO DE CLAVE A USUARIOS
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
                <asp:ObjectDataSource ID="objUsuarios" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.UsuariosSistemaTableAdapter">
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
                <asp:Panel ID="Panel1" runat="server" Visible="False" Width="400px">
                    <table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; width: 100%;
                        font-family: Arial; height: 100%">
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
                                <asp:TextBox ID="txtnombre" runat="server" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                Apellido</td>
                            <td>
                                <asp:TextBox ID="txtapellido" runat="server" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="height: 19px">
                                Cédula</td>
                            <td style="height: 19px">
                                <asp:TextBox ID="txtcedula" runat="server" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="height: 22px">
                                Nueva Clave</td>
                            <td style="height: 22px">
                                <asp:TextBox ID="txtclave" runat="server" TextMode="Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="height: 22px">
                                Repetir Clave</td>
                            <td style="height: 22px">
                                <asp:TextBox ID="txtclave2" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtclave2"
                                    ControlToValidate="txtclave" ErrorMessage="CompareValidator">Las claves deben ser iguales</asp:CompareValidator></td>
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
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
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
</asp:Content>

