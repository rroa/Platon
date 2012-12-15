<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertCarrera.ascx.cs" Inherits="controles_insertCarrera" %>
<span style="font-size: 24px; font-family: Arial">CARRERAS UNIVERSITARIAS
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td style="width: 285px" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid;
                font-family: ARIAL">
                <tr>
                    <td colspan="2" style="padding-left: 5px; border-bottom: black 1px solid; height: 30px;
                        background-color: whitesmoke">
                        <strong><span style="font-family: Arial">INSERTAR CARRERA</span></strong></td>
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
                    <td style="padding-left: 5px; height: 15px">
                        <strong>Siglas</strong></td>
                    <td style="padding-left: 5px; height: 15px">
                        <asp:TextBox ID="txtsiglas" runat="server" Font-Names="Arial" Font-Size="12px" Width="91px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>Cantidad Cr&eacute;ditos</strong></td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtcreditos" runat="server" Font-Names="Arial" Font-Size="12px"
                            Width="66px"></asp:TextBox>
                        <span style="font-size: 8pt; color: #ff0000">(solo n&uacute;meros)</span></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px;">
                        <strong>Titulo de graduado</strong></td>
                    <td style="padding-left: 5px;">
                        <asp:TextBox ID="txttitulo" runat="server" Width="196px"></asp:TextBox></td>
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
                        height: 23px" colspan="2">
                    <asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                            OnClick="ImageButton1_Click" />
                        &nbsp;
                        <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/images/botones/btn_cancelar.jpg"
                            OnClick="btnCancelar_Click1" /></td>
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
                        <strong>CARRERAS</strong></td>
                </tr>
                <tr>
                    <td style="height: 15px">
                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 5px; padding-left: 5px;">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_carrera" DataSourceID="objCarrera"
                            Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:CommandField CancelText="Cancelar" EditText="Editar" ShowEditButton="True" UpdateText="Actualizar" />
                                <asp:BoundField DataField="carrera_nombre" HeaderText="Carrera" SortExpression="carrera_nombre" />
                                <asp:BoundField DataField="carrera_siglas" HeaderText="Siglas" SortExpression="carrera_siglas" />
                                <asp:BoundField DataField="carrera_cant_credito" HeaderText="Creditos" SortExpression="carrera_cant_credito" />
                                <asp:BoundField DataField="carrera_titulo" HeaderText="Titulo" SortExpression="carrera_titulo" />
                            </Columns>
                            <RowStyle BackColor="#FFFBD6" HorizontalAlign="Left" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="objCarrera" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.CarreraTableAdapter"
                            UpdateMethod="Update">
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
            </table>
        </td>
    </tr>
</table>
