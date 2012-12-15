<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertHorario.ascx.cs" Inherits="controles_insertHorario" %>
<span style="font-size: 24px; font-family: Arial">HORARIO DE CLASES
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0" style="padding-left: 5px; font-size: 12px; font-family: Arial; border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;">
    <tr>
        <td style="height: 21px">
        </td>
        <td style="height: 21px">
        </td>
        <td style="width: 40px; height: 21px">
        </td>
        <td style="height: 21px">
        </td>
    </tr>
    <tr>
        <td colspan="2" style="height: 16px">
            <strong>
            Insertar Horario</strong></td>
        <td style="width: 40px; height: 25px; border-right: black 1px solid; border-left: black 1px solid;">
            <span style="color: #ffffff">.</span></td>
        <td style="height: 16px">
        </td>
    </tr>
    <tr>
        <td style="height: 25px">
        </td>
        <td style="height: 25px">
        </td>
        <td style="width: 40px; height: 25px; border-right: black 1px solid; border-left: black 1px solid;">
            <span style="color: #ffffff">.</span></td>
        <td style="height: 25px">
            <strong>
            Horarios Actuales</strong></td>
    </tr>
    <tr>
        <td>
            Descripci&oacute;n</td>
        <td>
            &nbsp;<asp:TextBox ID="txtdescripcion" runat="server" Font-Names="Arial" Font-Size="12px"></asp:TextBox></td>
        <td style="width: 40px; border-right: black 1px solid; border-left: black 1px solid; height: 25px;">
            <span style="color: #ffffff">.</span></td>
        <td rowspan="4" valign="top">
            <asp:GridView ID="gvHorario" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="id_horario" DataSourceID="objHorario" Font-Names="Arial" Font-Size="12px"
                ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="descripcion" HeaderText="Descripcion" SortExpression="descripcion" />
                    <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                    <asp:TemplateField HeaderText="Hora Inicio" SortExpression="hora">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("hora") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("hora", "{0:t}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hora Fin" SortExpression="hora_fin">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("hora_fin") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("hora_fin", "{0:t}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="objHorario" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.HorarioTableAdapter"
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_horario" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="dia" Type="Int32" />
                    <asp:Parameter Name="hora" Type="DateTime" />
                    <asp:Parameter Name="Original_id_horario" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="dia" Type="Int32" />
                    <asp:Parameter Name="hora" Type="DateTime" />
                </InsertParameters>
            </asp:ObjectDataSource>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            D&iacute;a</td>
        <td>
            &nbsp;<asp:DropDownList ID="ddldia" runat="server" Width="145px" Font-Names="Arial" Font-Size="12px">
                <asp:ListItem Value="1">Lunes</asp:ListItem>
                <asp:ListItem Value="2">Martes</asp:ListItem>
                <asp:ListItem Value="3">Miercoles</asp:ListItem>
                <asp:ListItem Value="4">Jueves</asp:ListItem>
                <asp:ListItem Value="5">Viernes</asp:ListItem>
                <asp:ListItem Value="6">Sabado</asp:ListItem>
                <asp:ListItem Value="7">Domingo</asp:ListItem>
            </asp:DropDownList></td>
        <td style="width: 40px; border-right: black 1px solid; border-left: black 1px solid; height: 25px;">
            <span style="color: #ffffff">.</span></td>
    </tr>
    <tr>
        <td>
            Hora Inicio</td>
        <td>
            &nbsp;<asp:TextBox ID="horahora" runat="server" Width="26px" Font-Names="Arial" Font-Size="12px"></asp:TextBox>:<asp:TextBox
                ID="horaminuto" runat="server" Width="29px" Font-Names="Arial" Font-Size="12px"></asp:TextBox></td>
        <td style="width: 40px; border-right: black 1px solid; border-left: black 1px solid; height: 25px;">
            <span style="color: #ffffff">.</span></td>
    </tr>
    <tr>
        <td>
            Hora Fin</td>
        <td>
            &nbsp;<asp:TextBox ID="FinHora" runat="server" Font-Names="Arial" Font-Size="12px"
                Width="26px"></asp:TextBox>:<asp:TextBox ID="FinMinuto"
                    runat="server" Font-Names="Arial" Font-Size="12px" Width="29px"></asp:TextBox></td>
        <td style="border-right: black 1px solid; border-left: black 1px solid; width: 40px;
            height: 25px">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="4" style="height: 31px; border-top: black 1px solid;">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
    </tr>
    <tr>
        <td>
        </td>
        <td align="right">
            <asp:ImageButton ID="btnInsertar" runat="server" ImageUrl="~/images/botones/btn_insertar.jpg"
                OnClick="btnInsertar_Click1" /></td>
        <td style="width: 40px">
        </td>
        <td>
        </td>
    </tr>
</table>
