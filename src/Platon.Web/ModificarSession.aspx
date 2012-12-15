<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ModificarSession.aspx.cs" Inherits="ModificarSession"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 18pt; font-family: Arial">MODIFICACION DE SECCIONES DE CLASES
        <hr />
    </span>
    <table>
        <tr>
            <td colspan="4" style="height: 21px">
                <span style="font-family: Arial">
                Secciones Activas</span></td>
        </tr>
        <tr>
            <td colspan="4">
                Nombre de la materia:
                <asp:TextBox ID="txtmateria" runat="server" Width="191px"></asp:TextBox>&nbsp;<asp:Button
                    ID="Button1" runat="server" Text="Buscar" /><br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="id_session" DataSourceID="ObjectDataSource1" ForeColor="#333333"
                    GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Font-Names="Arial" Font-Size="12px">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
                        <asp:BoundField DataField="session_cod" HeaderText="Seccion" SortExpression="session_cod" />
                        <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad" />
                        <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
                        <asp:BoundField DataField="materia" HeaderText="Materia" SortExpression="materia" />
                        <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
                        <asp:BoundField DataField="profesor" HeaderText="Profesor" ReadOnly="True" SortExpression="profesor" />
                        <asp:BoundField DataField="horario" HeaderText="Horario" SortExpression="horario" />
                        <asp:TemplateField HeaderText="F. Inicio" SortExpression="f_inicio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("f_inicio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("f_inicio", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="F. Fin" SortExpression="f_fin">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("f_fin") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("f_fin", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBymateria" TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtmateria" DefaultValue="{0}" Name="materia_desc"
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:Label ID="Label3" runat="server" Text="Profesor"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlprofesor" runat="server" DataSourceID="objProfesor" DataTextField="profesor"
                    DataValueField="id_profesor" Width="150px" OnDataBound="ddlprofesor_DataBound">
                </asp:DropDownList></td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Capacidad"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtCapacidad" runat="server" Width="31px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="height: 15px">
                Horario</td>
            <td style="height: 15px">
                <asp:TextBox ID="txthorario" runat="server" Width="217px"></asp:TextBox></td>
            <td style="height: 15px">
                </td>
            <td style="height: 15px">
                </td>
        </tr>
        <tr>
            <td style="height: 15px">
                Fecha de Inicio</td>
            <td style="height: 15px">
                <asp:TextBox ID="txtfechainicio" runat="server"></asp:TextBox><br />
                <span style="font-size: 11px; color: #ff0000; font-family: Arial">Ej: mm/dd/aaaa</span></td>
            <td style="height: 15px">
                Fecha Fin</td>
            <td style="height: 15px">
                <asp:TextBox ID="txtfechafin" runat="server"></asp:TextBox><br />
                <span style="font-size: 8pt; color: #ff0000; font-family: Arial">Ej: mm/dd/aaaa</span></td>
        </tr>
        <tr>
            <td colspan="4" style="height: 14px">
                <asp:Label ID="lblmsg" runat="server" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 15px">
            </td>
            <td style="height: 15px">
            </td>
            <td style="height: 15px">
            </td>
            <td style="height: 15px">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                    OnClick="btnGuardar_Click" /></td>
            <td>
            </td>
            <td>
                <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/images/botones/btn_cancelar.jpg"
                    OnClick="btnCancelar_Click" /></td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="objMateria" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
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
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="objProfesor" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.ProfesorFullNameTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_profesor" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="objectRecintos" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
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
</asp:Content>

