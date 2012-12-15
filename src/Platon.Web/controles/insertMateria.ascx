<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertMateria.ascx.cs" Inherits="controles_insertMateria" %>
<span style="font-size: 24px; font-family: Arial">MATERIAS
    <hr />
</span>&nbsp;<br />
<table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid">
    <tr>
        <td valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid;
                font-family: Arial">
                <tr>
                    <td colspan="2" style="border-right: black 1px solid; border-top: black 1px solid;
                        padding-left: 5px; border-left: black 1px solid; border-bottom: black 1px solid;
                        height: 30px; background-color: whitesmoke">
                        <strong>INSERTAR MATERIA</strong></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>Materia</strong></td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtnombre" runat="server" Font-Names="Arial" Font-Size="12px"
                            Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>C&oacute;digo</strong></td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtcodigo" runat="server" Font-Names="Arial" Font-Size="12px"
                            Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        Cr&eacute;ditos</td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtcreditos" runat="server" Font-Names="Arial" Font-Size="12px"
                            Width="59px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px; height: 18px">
                        HT:</td>
                    <td style="padding-left: 5px; height: 18px">
                        <asp:TextBox ID="txtht" runat="server" Font-Names="Arial" Font-Size="12px" Width="59px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px; height: 18px">
                        HP:</td>
                    <td style="padding-left: 5px; height: 18px">
                        <asp:TextBox ID="txthp" runat="server" Font-Names="Arial" Font-Size="12px" Width="59px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="padding-left: 5px; height: 31px">
                        <asp:Label ID="lblmsg" runat="server" Font-Names="Arial" Font-Size="15px" Font-Bold="True"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left: 5px; height: 34px">
                        &nbsp;<asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                            OnClick="btnGuardar_Click1" />
                        &nbsp;
                        <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/images/botones/btn_cancelar.jpg"
                            OnClick="btnCancelar_Click1" /></td>
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
                        <strong>MATERIAS ACTUALES</strong></td>
                </tr>
                <tr>
                    <td>
                        Nombre:</td>
                    <td>
                        <asp:TextBox ID="txtCodigoBuscar" runat="server" Width="143px"></asp:TextBox>
                        <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gvMateria" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_materia" DataSourceID="objMaterias"
                            Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:CommandField CancelText="Cancelar" DeleteText="Borrar" EditText="Editar" InsertText="Insertar"
                                    NewText="Nuevo" SelectText="Seleccionar" ShowEditButton="True" UpdateText="Actualizar" />
                                <asp:BoundField DataField="mat_cod" HeaderText="Codigo" SortExpression="mat_cod" />
                                <asp:BoundField DataField="materia_desc" HeaderText="Nombre" SortExpression="materia_desc" />
                                <asp:BoundField DataField="mat_credit" HeaderText="Creditos" SortExpression="mat_credit" />
                                <asp:BoundField DataField="mat_ht" HeaderText="HT" SortExpression="mat_ht" />
                                <asp:BoundField DataField="mat_hp" HeaderText="HP" SortExpression="mat_hp" />
                            </Columns>
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="objMaterias" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.MateriaTableAdapter"
                            UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_id_materia" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="mat_cod" Type="String" />
                                <asp:Parameter Name="materia_desc" Type="String" />
                                <asp:Parameter Name="mat_credit" Type="Int32" />
                                <asp:Parameter Name="Original_id_materia" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="mat_cod" Type="String" />
                                <asp:Parameter Name="materia_desc" Type="String" />
                                <asp:Parameter Name="mat_credit" Type="Int32" />
                            </InsertParameters>
                        </asp:ObjectDataSource><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByBusquedamateria_desc" TypeName="dsUniversidadTableAdapters.MateriaTableAdapter"
                            UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_id_materia" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="mat_cod" Type="String" />
                                <asp:Parameter Name="materia_desc" Type="String" />
                                <asp:Parameter Name="mat_credit" Type="Int32" />
                                <asp:Parameter Name="Original_id_materia" Type="Int32" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtCodigoBuscar" DefaultValue="{0}" Name="materia_desc"
                                    PropertyName="Text" Type="String" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="mat_cod" Type="String" />
                                <asp:Parameter Name="materia_desc" Type="String" />
                                <asp:Parameter Name="mat_credit" Type="Int32" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
&nbsp;
