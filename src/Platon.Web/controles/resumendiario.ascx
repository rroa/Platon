<%@ Control Language="C#" AutoEventWireup="true" CodeFile="resumendiario.ascx.cs" Inherits="controles_resumendiario" %>
<span style="font-family: Arial"><span style="font-size: 24px">RESUMEN DIARIO
    <hr />
</span>
    <table>
        <tr>
            <td colspan="2">
                <span style="font-size: 12px"><strong>Seleccione el d&iacute;a del que desea generar el resumen diario</strong></span></td>
        </tr>
        <tr>
            <td colspan="2">
<asp:Calendar ID="CalResumen" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
    BorderWidth="1px" DayNameFormat="Full" Font-Names="Arial" Font-Size="12px" ForeColor="#663399"
    Height="200px" ShowGridLines="True" Width="220px" SelectedDate="2008-02-16" OnSelectionChanged="CalResumen_SelectionChanged1" >
    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
    <SelectorStyle BackColor="#FFCC66" />
    <OtherMonthDayStyle ForeColor="#CC9966" />
    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
</asp:Calendar>
                <br />
                <asp:Label ID="lbldia" runat="server" Font-Names="Arial" Font-Size="14px"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <span style="font-size: 12px"><strong>
                    <asp:Label ID="Label1" runat="server" Text="Ganancias por servicios" Font-Size="12px"></asp:Label></strong></span></td>
            <td>
                <span style="font-size: 12px"><strong>
                    <asp:Label ID="Label2" runat="server" Text="Ganancias por matriculacion" Font-Size="12px"></asp:Label></strong></span></td>
        </tr>
        <tr>
            <td valign="top">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="id_pago" DataSourceID="ObjectDataSource1" Font-Names="Arial"
                    Font-Size="12px" ForeColor="#333333" GridLines="None" EmptyDataText="No se registraron entradas por servicios">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="matricula" HeaderText="Matricula" SortExpression="matricula" />
                        <asp:BoundField DataField="concepto" HeaderText="Concepto" SortExpression="concepto" />
                        <asp:TemplateField HeaderText="Fecha" SortExpression="fecha">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Monto" SortExpression="monto">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("monto") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("monto", "{0:C}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByFechaTipo"
                    TypeName="dsUniversidadTableAdapters.viewCajaPagoEstudianteTableAdapter">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Servicio" Name="tipo" Type="String" />
                        <asp:ControlParameter ControlID="CalResumen" Name="fecha" PropertyName="SelectedDate"
                            Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td valign="top">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="ObjectDataSource2" Font-Names="Arial"
                    Font-Size="12px" ForeColor="#333333" GridLines="None" EmptyDataText="No se registraron entradas por matriculacion" DataKeyNames="id_pago" >
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="matricula" HeaderText="Matricula" SortExpression="matricula" />
                        <asp:BoundField DataField="concepto" HeaderText="Concepto" SortExpression="concepto" />
                        <asp:TemplateField HeaderText="Fecha" SortExpression="fecha">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Monto" SortExpression="monto">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("monto") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("monto", "{0:C}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByFechaTipo"
                    TypeName="dsUniversidadTableAdapters.viewCajaPagoEstudianteTableAdapter">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Inscripcion" Name="tipo" Type="String" />
                        <asp:ControlParameter ControlID="CalResumen" Name="fecha" PropertyName="SelectedDate"
                            Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td valign="top">
                </td>
            <td>
                </td>
        </tr>
    </table>
</span><br />
<span style="font-size: 9pt; font-family: Arial">&nbsp;<img src="images/print.jpg" /></span>Si desea imprimir el resumen diario.
<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Clic aqui</asp:LinkButton><br />
