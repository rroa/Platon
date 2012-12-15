<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="cancelarpago.aspx.cs" Inherits="cancelarpago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">CANCELAR PAGOS</span>
    <hr />
    <span><span style="color: #ff0000"><strong>Advertencia: Verifique bien el pago antes de cancelarlo,
        esta operacion es irreversible</strong></span><br />
        <br />
        1. Seleccione la fecha en la que se efectu&oacute; el pago:<br />
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999"
            CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
            ForeColor="Black" Height="179px" Width="200px">
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <SelectorStyle BackColor="#CCCCCC" />
            <WeekendDayStyle BackColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
        </asp:Calendar>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="id_pago" DataSourceID="ObjectDataSource1" Font-Names="Arial" Font-Size="12px"
            ForeColor="#333333" GridLines="None">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                <asp:BoundField DataField="id_pago" HeaderText="No. Pago" ReadOnly="True" SortExpression="id_pago" />
                <asp:BoundField DataField="no_recibo" HeaderText="No. Recibo" SortExpression="no_recibo" />
                <asp:BoundField DataField="id_balance" HeaderText="No. deuda" SortExpression="id_balance" />
                <asp:BoundField DataField="matricula" HeaderText="Matricula" SortExpression="matricula" />
                <asp:BoundField DataField="tipo" HeaderText="Tipo" SortExpression="tipo" />
                <asp:BoundField DataField="concepto" HeaderText="Concepto" SortExpression="concepto" />
                <asp:TemplateField HeaderText="Monto" SortExpression="monto">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("monto") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("monto", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha" SortExpression="fecha">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha", "{0:d}") %>'></asp:Label>
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
            SelectMethod="GetDataByFecha" TypeName="dsUniversidadTableAdapters.viewCajaPagoEstudianteTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" DefaultValue="{0}" Name="fecha" PropertyName="SelectedDate"
                    Type="DateTime" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        VERIFIQUE BIEN LOS DATOS DEL PAGO<br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4"
            DataKeyNames="id_pago" DataSourceID="ObjectDataSource2" Font-Names="Arial" Font-Size="12px"
            ForeColor="#333333" GridLines="None">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <Fields>
                <asp:BoundField DataField="id_pago" HeaderText="No. Pago" ReadOnly="True" SortExpression="id_pago" />
                <asp:BoundField DataField="no_recibo" HeaderText="No. Recibo" SortExpression="no_recibo" />
                <asp:BoundField DataField="id_balance" HeaderText="Cod, deuda" SortExpression="id_balance" />
                <asp:BoundField DataField="id_student" HeaderText="Cod. Estudiante" SortExpression="id_student" />
                <asp:BoundField DataField="matricula" HeaderText="Matricula" SortExpression="matricula" />
                <asp:BoundField DataField="tipo" HeaderText="Tipo" SortExpression="tipo" />
                <asp:BoundField DataField="concepto" HeaderText="Concepto" SortExpression="concepto" />
                <asp:BoundField DataField="ciclo" HeaderText="Ciclo" SortExpression="ciclo" />
                <asp:BoundField DataField="formapago" HeaderText="Forma de pago" SortExpression="formapago" />
                <asp:TemplateField HeaderText="Monto" SortExpression="monto">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("monto") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("monto") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("monto", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha" SortExpression="fecha">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:DetailsView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByPago" TypeName="dsUniversidadTableAdapters.viewCajaPagoEstudianteTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="pago" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:Label ID="lblmsg" runat="server"></asp:Label><br />
        <br />
        <asp:Button ID="Button1" runat="server" Font-Bold="True" ForeColor="#FF0000" Height="35px"
            OnClick="Button1_Click" Text="CANCELAR PAGO" />&nbsp;<asp:Button ID="Button2" runat="server"
                OnClick="Button2_Click" Text="NUEVO" /></span>
</asp:Content>

