<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cxcestudiante.ascx.cs" Inherits="controles_cxcestudiante" %>
<span style="font-size: 24px; font-family: Arial">CUENTAS POR COBRAR A ESTUDIANTES
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td style="height: 36px; width: 397px;">
            <span style="font-family: Arial; font-size: 12px;">Escriba la matr&iacute;cula del estudiante
                que desea consultar</span></td>
        <td style="height: 36px">
        </td>
    </tr>
    <tr>
        <td style="width: 397px">
            <asp:TextBox ID="txtmatricula" runat="server" Width="200px"></asp:TextBox>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg" /></td>
        <td>
            </td>
    </tr>
</table>
<br />
DEUDAS DEL ESTUDIANTE<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
    DataKeyNames="id_balance" DataSourceID="ObjectDataSource1" EmptyDataText="Este estudiante no tiene deudas pendiente"
    Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None">
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <Columns>
        <asp:BoundField DataField="id_balance" HeaderText="Cod." ReadOnly="True" SortExpression="id_balance" />
        <asp:BoundField DataField="tipo" HeaderText="Tipo" SortExpression="tipo" />
        <asp:BoundField DataField="concepto" HeaderText="Concepto" SortExpression="concepto" />
        <asp:TemplateField HeaderText="Balance" SortExpression="Balance">
            <EditItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Balance") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Balance", "{0:C}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="ciclo" HeaderText="Ciclo" SortExpression="ciclo" />
        <asp:TemplateField HeaderText="Fecha" SortExpression="fecha">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("fecha", "{0:d}") %>'></asp:Label>
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
    SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.viewCajaBalanceEstudianteTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
            PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
<br />
<br />
<span style="font-size: 12px; font-family: Arial">&nbsp;<img src="images/print.jpg" />Si desea imprimir un reporte de la Cuenta por Pagar de este estudiante.</span>
<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Clic aqui</asp:LinkButton><br />
<br />
<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
    OnClick="ImageButton2_Click" />
