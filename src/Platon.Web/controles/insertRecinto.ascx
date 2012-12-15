<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertRecinto.ascx.cs" Inherits="controles_insertRecinto" %>
<%@  Register TagPrefix="ew"   Namespace="eWorld.UI.Compatibility"  Assembly="eWorld.UI.Compatibility" %>

<span style="font-size: 24px; font-family: Arial">RECINTO UNIVERSITARIO</span>&nbsp;
<hr />
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td style="width: 285px" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid;
                font-family: Arial">
                <tr>
                    <td colspan="2" style="padding-left: 5px; border-bottom: black 1px solid; height: 30px;
                        background-color: whitesmoke">
                        <strong>REGISTRO DE RECINTO</strong></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>Nombre</strong></td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtnombre" runat="server" Font-Names="Arial" Font-Size="12px"
                            Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>SIGLAS</strong></td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtsiglas" runat="server" Font-Names="Arial" Font-Size="12px"
                            Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>Tel&eacute;fono</strong></td>
                    <td style="padding-left: 5px">
                        <ew:MaskedTextBox ID="txttelefono" runat="server" Font-Names="Arial" Font-Size="12px"
                            Mask="999-999-9999" MaxLength="12" TabIndex="8" ValidationExpression="\d{3}-\d{3}-\d{4}"
                            Width="200px"></ew:MaskedTextBox></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>Direcci&oacute;n</strong></td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtdireccion" runat="server" Font-Names="Arial" Font-Size="12px"
                            TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="height: 30px">
                    </td>
                    <td style="height: 30px">
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 30px">
                        <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
                </tr>
                <tr>
                    <td style="height: 15px">
                    </td>
                    <td style="height: 15px">
                    </td>
                </tr>
                <tr>
                    <td style="border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;
                        height: 23px">
                    </td>
                    <td style="border-right: black 1px solid; border-top: black 1px solid; border-bottom: black 1px solid;
                        height: 23px">
                        <asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                            OnClick="btnGuardar_Click" />
                        &nbsp;
                        <asp:ImageButton ID="tnCancelar" runat="server" ImageUrl="~/images/botones/btn_cancelar.jpg"
                            OnClick="tnCancelar_Click" /></td>
                </tr>
            </table>
        </td>
        <td style="width: 50px" valign="top">
        </td>
        <td valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid;
                font-family: Arial">
                <tr>
                    <td style="padding-left: 5px; border-bottom: black 1px solid; height: 30px; background-color: whitesmoke">
                        <strong>RECINTOS REGISTRADOS</strong></td>
                </tr>
                <tr>
                    <td style="height: 15px">
                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 5px; padding-left: 5px; height: 13px">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            DataKeyNames="id_recinto" DataSourceID="objRecintos" Font-Names="Arial" Font-Size="12px"
                            ForeColor="#333333" GridLines="None">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:CommandField DeleteText="Borrar" EditText="Editar" InsertText="Insertar" NewText="Nuevo"
                                    SelectText="Seleccionar" ShowEditButton="True" UpdateText="Actualizar" CancelText="Cancelar" />
                                <asp:BoundField DataField="recinto_nombre" HeaderText="Nombre" SortExpression="recinto_nombre" />
                                <asp:BoundField DataField="siglas" HeaderText="Siglas" SortExpression="siglas" />
                                <asp:BoundField DataField="rec_dir" HeaderText="Direcci&oacute;n" SortExpression="rec_dir" />
                                <asp:BoundField DataField="rec_tel" HeaderText="Tel&#233;fono" SortExpression="rec_tel" />
                            </Columns>
                            <RowStyle BackColor="#FFFBD6" HorizontalAlign="Left" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="objRecintos" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.RecintoTableAdapter"
                            UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_id_recinto" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="recinto_nombre" Type="String" />
                                <asp:Parameter Name="siglas" Type="String" />
                                <asp:Parameter Name="rec_dir" Type="String" />
                                <asp:Parameter Name="rec_tel" Type="String" />
                                <asp:Parameter Name="Original_id_recinto" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="recinto_nombre" Type="String" />
                                <asp:Parameter Name="siglas" Type="String" />
                                <asp:Parameter Name="rec_dir" Type="String" />
                                <asp:Parameter Name="rec_tel" Type="String" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
