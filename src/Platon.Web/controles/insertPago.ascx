<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertPago.ascx.cs" Inherits="controles_insertPago" %>
<span style="font-size: 15px; font-family: Arial"><strong><span style="font-size: 24px;
    font-family: Arial">CAJA - PAGO DE SERVICIOS Y MATRICULACION
    
</span>
    </strong></span>
<span style="font-size: 12px; font-family: Arial">
    <br />
    <hr />
    <asp:Panel ID="PanelRecargo" runat="server" BorderColor="Red" BorderStyle="Solid"
        BorderWidth="2px" Height="50px" Visible="False" Width="559px">
        <asp:Label ID="lblpanel" runat="server" Font-Bold="True" ForeColor="#FF0000"></asp:Label>&nbsp;<br />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="APLICAR RECARGOS" /></asp:Panel>
    <br />
    Escriba la matr&iacute;cula del estudiante</span><br />
<asp:TextBox ID="txtmatricula" runat="server" Font-Names="Arial"></asp:TextBox>
<asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
    OnClick="btnBuscar_Click" />&nbsp;
<asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
    OnClick="btnNuevo_Click" /><br />
<br />
<asp:DetailsView ID="dvDatos" runat="server" AutoGenerateRows="False" CellPadding="4"
    DataKeyNames="cod_stu" DataSourceID="objporMatrcula" Font-Names="Arial" Font-Size="12px"
    ForeColor="#333333" GridLines="None">
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <Fields>
        <asp:BoundField DataField="matricula" HeaderText="Matr&#237;cula" SortExpression="matricula" />
        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
        <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
        <asp:BoundField DataField="f_nacimiento" HeaderText="F. de nacimiento" SortExpression="f_nacimiento" />
        <asp:BoundField DataField="telefono" HeaderText="Tel&#233;fono" SortExpression="telefono" />
        <asp:BoundField DataField="cedula" HeaderText="C&#233;dula" SortExpression="cedula" />
        <asp:BoundField DataField="ano_ingreso" HeaderText="A&#241;o de ingreso" SortExpression="ano_ingreso" />
        <asp:TemplateField HeaderText="Fecha de ingreso" SortExpression="fecha_ingreso">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha_ingreso") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha_ingreso") %>'></asp:TextBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha_ingreso", "{0:d}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Fields>
    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
</asp:DetailsView>
<asp:ObjectDataSource ID="objporMatrcula" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.BuscarEstudianteporMatriculaTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
            PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
<br />
<hr />
<span style="font-family: Arial">
<strong><span>Pago de servicios<br />
</span></strong><span style="font-size: 12px">Seleccione un servicio para saldarlo</span></span><br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_balance"
    DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Names="Arial" Font-Size="13px">
    <Columns>
        <asp:CommandField ShowSelectButton="True" SelectText="&gt;&gt;" />
        <asp:BoundField DataField="matricula" HeaderText="Matricula" SortExpression="matricula" />
        <asp:BoundField DataField="concepto" HeaderText="Concepto" SortExpression="concepto" />
        <asp:BoundField DataField="monto" HeaderText="Monto" SortExpression="monto" />
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
    <AlternatingRowStyle BackColor="White" /><FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
</asp:GridView>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByMatricula"
    TypeName="dsUniversidadTableAdapters.BalancePendienteTableAdapter" UpdateMethod="Update">
    <DeleteParameters>
        <asp:Parameter Name="Original_id_balance" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="matricula" Type="String" />
        <asp:Parameter Name="concepto" Type="String" />
        <asp:Parameter Name="monto" Type="Decimal" />
        <asp:Parameter Name="fecha" Type="DateTime" />
        <asp:Parameter Name="activo" Type="Boolean" />
        <asp:Parameter Name="Original_id_balance" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="matricula" Type="String" />
        <asp:Parameter Name="concepto" Type="String" />
        <asp:Parameter Name="monto" Type="Decimal" />
        <asp:Parameter Name="fecha" Type="DateTime" />
        <asp:Parameter Name="activo" Type="Boolean" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
            PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
<br />
<asp:Button ID="Button1" runat="server" Text="Pagar servicio" OnClick="Button1_Click" Font-Bold="True" Font-Names="Arial" Font-Size="15px" /><br />
<br />
<asp:Button ID="btnAcuerdoServ" runat="server" Font-Bold="True" Font-Size="10px"
    OnClick="btnAcuerdoServ_Click" Text="Realizar acuerdo de pago" Width="278px" /><br />
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ReciboPagoServicio.aspx"
    Target="_blank" Visible="False">Imprimir ultimo pago</asp:HyperLink><br />
<br />
Ultimos 10 pagos realizados por el estudiante<br />
<asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="id_pago"
    DataSourceID="ObjectDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Names="Arial" Font-Size="13px" EmptyDataText="No se han realizado pagos de servicios" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <Columns>
        <asp:CommandField SelectText="Imprimir recibo" ShowSelectButton="True" />
        <asp:BoundField DataField="matricula" HeaderText="Matricula" SortExpression="matricula" />
        <asp:BoundField DataField="concepto" HeaderText="Concepto" SortExpression="concepto" />
        <asp:TemplateField HeaderText="Monto" SortExpression="monto">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("monto") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("monto", "{0:C}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Fecha" SortExpression="fecha">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fecha") %>'></asp:TextBox>
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
<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetDataBy10Pagos" TypeName="dsUniversidadTableAdapters.PagoServicioTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
            PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
<br />
<hr />
<br />
<hr/>
<strong><span style="font-family: Arial">Pago de matriculaci&oacute;n<br />
</span></strong>
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4"
    DataSourceID="objCargos" Font-Names="Arial" Font-Size="12px" ForeColor="#333333"
    GridLines="None">
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <Fields>
        <asp:BoundField DataField="id_ciclo" HeaderText="Ciclo" SortExpression="id_ciclo" />
        <asp:BoundField DataField="matricula" HeaderText="Matr&#237;cula" SortExpression="matricula" />
        <asp:TemplateField HeaderText="Cargo por inscripci&#243;n" SortExpression="CostoInscripcion">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CostoInscripcion") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CostoInscripcion") %>'></asp:TextBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CostoInscripcion", "{0:C}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CantidadCreditos" HeaderText="Cantidad de cr&#233;ditos" SortExpression="CantidadCreditos" />
        <asp:TemplateField HeaderText="Cargo por asignaturas" SortExpression="CargoporAsignaturas">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CargoporAsignaturas") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CargoporAsignaturas") %>'></asp:TextBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("CargoporAsignaturas", "{0:C}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Total cargos" SortExpression="Total">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Total") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Total") %>'></asp:TextBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Total", "{0:C}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Fields>
    <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
</asp:DetailsView>
<asp:ObjectDataSource ID="objCargos" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetCargosByMatricula" TypeName="dsUniversidadTableAdapters.CargosAPagarTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
            PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
&nbsp;<br />
&nbsp;<span style="font-size: 12px; font-family: Arial"><strong>Monto a pagar </strong>
</span>
<asp:TextBox ID="txtmonto" runat="server"></asp:TextBox><strong><span style="font-size: 8pt;
    color: #ff0000">(solo números)</span></strong><br />
&nbsp;<span style="font-size: 12px; font-family: Arial"><strong>Concepto &nbsp; &nbsp;
    &nbsp; &nbsp;
    <asp:DropDownList ID="ddlConcepto" runat="server">
        <asp:ListItem>Abono a matriculacion del periodo</asp:ListItem>
        <asp:ListItem>Pago de inscripcion del periodo</asp:ListItem>
        <asp:ListItem>Saldo de matriculacion del periodo</asp:ListItem>
    </asp:DropDownList><br />
</strong></span>
<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Pagar" Font-Bold="True" Font-Names="Arial" Font-Size="15px" /><br />
<br />
<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ReciboPagoInscripcion.aspx"
    Target="_blank" Visible="False">Imprimir recibo</asp:HyperLink>
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
<asp:Label ID="lblmsg" runat="server" ForeColor="#0000FF"></asp:Label><br />
<hr />
<br />
<span style="font-family: Arial"><strong><span style="font-size: 12px">Balance de matriculación</span><br />
</strong></span>
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
    DataSourceID="objBalance" EmptyDataText="No tiene balance" Font-Names="Arial"
    Font-Size="12px" ForeColor="#333333" GridLines="None">
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="Total pagado" SortExpression="Pagos">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Pagos") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Pagos", "{0:C}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Balance pendiente" SortExpression="Balance">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Balance") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Balance", "{0:C}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
<asp:ObjectDataSource ID="objBalance" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.View_PagoMatriculacionTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
            PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
<br />
<span style="font-size: 12px; font-family: Arial"><strong>Ultimos pagos realizados</strong></span>
&nbsp;&nbsp;&nbsp;&nbsp;<br />
<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4"
    DataSourceID="objPagos" EmptyDataText="No hay pagos realizados" Font-Names="Arial"
    Font-Size="12px" ForeColor="#333333" GridLines="None" AllowPaging="True" DataKeyNames="id_pago" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <Columns>
        <asp:CommandField SelectText="Imprimir recibo" ShowSelectButton="True" />
        <asp:BoundField DataField="id_concepto" HeaderText="Concepto" SortExpression="id_concepto" />
        <asp:TemplateField HeaderText="Monto" SortExpression="monto">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("monto") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("monto", "{0:C}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Fecha" SortExpression="fecha">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fecha") %>'></asp:TextBox>
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
<asp:ObjectDataSource ID="objPagos" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.tblPagoMatriculacionTableAdapter">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
            PropertyName="Text" Type="String" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="matricula" Type="String" />
        <asp:Parameter Name="id_concepto" Type="String" />
        <asp:Parameter Name="fecha" Type="DateTime" />
        <asp:Parameter Name="monto" Type="Decimal" />
        <asp:Parameter Name="id_ciclo" Type="String" />
    </InsertParameters>
</asp:ObjectDataSource>
<br />
<asp:Button ID="btnAcuerdoMatri" runat="server" Font-Bold="True" Font-Size="10px"
    Text="Realizar acuerdo de pago" Width="278px" /><br />
