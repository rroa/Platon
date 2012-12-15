<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertPeriodo.ascx.cs" Inherits="controles_insertPeriodo" %>
<span style="font-size: 24px; font-family: Arial">PERIODOS DE CLASE
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; font-family: Arial">
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
        <td colspan="2" style="height: 23px">
            <strong>Complete el formulario para crear un nuevo período</strong></td>
        <td style="width: 40px; height: 23px;">
        </td>
        <td style="height: 23px">
        </td>
    </tr>
    <tr>
        <td style="height: 23px">
        </td>
        <td style="height: 23px">
        </td>
        <td style="width: 40px; height: 23px;">
        </td>
        <td style="height: 23px; background-color: whitesmoke">
            <strong>
            Per&iacute;odos Actuales</strong></td>
    </tr>
    <tr>
        <td>
            <strong>
            C&oacute;digo</strong></td>
        <td>
            <asp:TextBox ID="txtnumero" runat="server" Width="55px"></asp:TextBox></td>
        <td style="width: 40px">
        </td>
        <td rowspan="4" valign="top">
            <asp:GridView ID="gvPeriodo" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="id_periodo" DataSourceID="ObjectPeriodo" Font-Names="Arial" Font-Size="12px"
                ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:CommandField CancelText="Cancelar" EditText="Editar" ShowEditButton="True" UpdateText="Actualizar" />
                    <asp:BoundField DataField="numero" HeaderText="Codigo" SortExpression="numero" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripcion" SortExpression="descripcion" />
                    <asp:BoundField DataField="mes_inicio" HeaderText="Mes de Inicio" SortExpression="mes_inicio" />
                    <asp:BoundField DataField="mes_fin" HeaderText="Mes de fin" SortExpression="mes_fin" />
                </Columns>
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectPeriodo" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.PeriodoTableAdapter"
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_periodo" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="numero" Type="Int32" />
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="mes_inicio" Type="Int32" />
                    <asp:Parameter Name="mes_fin" Type="Int32" />
                    <asp:Parameter Name="Original_id_periodo" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="numero" Type="Int32" />
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="mes_inicio" Type="Int32" />
                    <asp:Parameter Name="mes_fin" Type="Int32" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <strong>
            Mes Inicio</strong></td>
        <td>
            <asp:Calendar ID="calinicio" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" DayNameFormat="Shortest" Font-Names="Arial" Font-Size="9pt"
                ForeColor="#663399" Height="28px" Width="7px" BorderWidth="1px" ShowGridLines="True">
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                <SelectorStyle BackColor="#FFCC66" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
            </asp:Calendar>
        </td>
        <td style="width: 40px">
        </td>
    </tr>
    <tr>
        <td>
            <strong>
            Mes F&iacute;n</strong></td>
        <td>
            <asp:Calendar ID="calfin" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" DayNameFormat="Shortest" Font-Names="Arial" Font-Size="9pt"
                ForeColor="#663399" Height="20px" Width="35px" BorderWidth="1px" ShowGridLines="True">
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                <SelectorStyle BackColor="#FFCC66" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
            </asp:Calendar>
        </td>
        <td style="width: 40px">
        </td>
    </tr>
    <tr>
        <td>
            <strong>
            Descripci&oacute;n</strong></td>
        <td>
            <asp:TextBox ID="txtdescripcion" runat="server"></asp:TextBox></td>
        <td style="width: 40px">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="4" style="height: 30px">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Size="15px" Font-Names="Arial"></asp:Label></td>
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
