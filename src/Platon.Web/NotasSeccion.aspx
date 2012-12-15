<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="NotasSeccion.aspx.cs" Inherits="NotasSeccion"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">NOTA DE ESTUDIANTES
        <hr />
    </span><span style="color: #cc0000"><strong>NOTA: ESTE MODULO ES SOLAMENTE PARA PONER
        NOTAS NUMERICAS DEL 0 AL 100<br />
        FAVOR NO UTILIZAR PARA ASIGNAR R, IT, CONV, VAL<br />
    </strong></span>
    <br />
    <table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; font-family: Arial">
        <tr>
            <td style="width: 151px">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="left">
                <asp:Panel ID="Panel1" runat="server" DefaultButton="btnBuscarSeccion" Width="100%">
                <asp:TextBox ID="txtBusquedaSesion" runat="server" Width="172px"></asp:TextBox>&nbsp;
                <asp:ImageButton ID="btnBuscarSeccion" runat="server" ImageUrl="~/images/botones/btn_buscarseccion.jpg"
                    OnClick="btnBuscarSeccion_Click" />&nbsp;
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/botones/btn_vertodo.jpg"
                    OnClick="ImageButton1_Click" /></asp:Panel>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 151px; height: 14px">
            </td>
            <td style="height: 14px">
            </td>
            <td style="height: 14px">
            </td>
        </tr>
        <tr>
            <td colspan="3" valign="top">
                &nbsp;
                <asp:GridView ID="gvSessiones" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="id_session" Font-Names="Arial" Font-Size="12px" ForeColor="#333333"
                    GridLines="None" Width="508px" OnSelectedIndexChanged="gvSessiones_SelectedIndexChanged" >
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                        <asp:BoundField DataField="session_cod" HeaderText="Secci&#243;n" SortExpression="session_cod" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="profesor" HeaderText="profesor" SortExpression="profesor">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="objSecc_Act" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="objBusquedaSession" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByBusquedaSession" TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtBusquedaSesion" DefaultValue="{0}" Name="session_cod"
                            PropertyName="Text" Type="String" />
                        <asp:Parameter DefaultValue="1" Name="id_recinto" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 20px">
                </td>
            <td style="height: 20px">
            </td>
        </tr>
        <tr>
            <td colspan="3" valign="top">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource2">
                    <ItemTemplate>
                        <table style="width: 479px">
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="lblNombreCompleto" runat="server" Font-Bold="True" Text='<%# Eval("NombreCompleto") %>'
                                        Width="225px"></asp:Label></td>
                                <td style="width: 115px">
                                    <asp:Label ID="lblMatricula" runat="server" Font-Bold="True" Text='<%# Eval("matricula") %>'
                                        Width="112px"></asp:Label></td>
                                <td style="width: 55px">
                                    <asp:TextBox ID="txtNota" runat="server" Width="36px"></asp:TextBox></td>
                                <td style="width: 44px">
                                    <asp:DropDownList ID="ddlNotas" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Nota"
                                        DataValueField="Nota" Width="59px" Enabled="False">
                                        <asp:ListItem>A</asp:ListItem>
                                        <asp:ListItem>B</asp:ListItem>
                                        <asp:ListItem>C</asp:ListItem>
                                        <asp:ListItem>D</asp:ListItem>
                                        <asp:ListItem>F</asp:ListItem>
                                        <asp:ListItem>R</asp:ListItem>
                                        <asp:ListItem>IT</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                        </table>
                        <asp:Label ID="cod_stu" runat="server" Text='<%# Eval("id_estudiante") %>' Visible="False"></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td style="height: 17px">
            </td>
            <td style="height: 17px">
            </td>
            <td style="height: 17px">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 151px; height: 18px;">
            </td>
            <td style="height: 18px">
            </td>
            <td style="height: 18px">
            </td>
        </tr>
        <tr>
            <td style="width: 151px; height: 16px;">
            </td>
            <td style="height: 16px">
                <asp:ImageButton ID="btnRegistrar" runat="server" ImageUrl="~/images/botones/btn_registrar.jpg" OnClick="btnRegistrar_Click"
                    /></td>
            <td style="height: 16px">
                <asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
                    OnClick="ImageButton1_Click" /></td>
        </tr>
    </table>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                    TypeName="dsUniversidadTableAdapters.tblNotasTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id_nota" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nota" Type="String" />
                        <asp:Parameter Name="Original_id_nota" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Nota" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataBySession" TypeName="dsUniversidadTableAdapters.Estudiantes_en_sesionTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvSessiones" Name="session" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

