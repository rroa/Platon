<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="Pagos.aspx.cs" Inherits="Pagos"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 15px; font-family: Arial"><strong><span style="font-size: 24px;
        font-family: Arial">CAJA - PAGO DE SERVICIOS</span></strong></span><span
            style="font-size: 12px; font-family: Arial"><br />
            <br />
            Escriba la matr&iacute;cula del estudiante</span><br />
    <asp:TextBox ID="txtmatricula" runat="server" Font-Names="Arial"></asp:TextBox>
    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/images/botones/edit.gif"
        OnClick="ImageButton4_Click" />
    <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
         />&nbsp;
    <asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg" OnClick="btnNuevo_Click"
        /><br />
    <asp:DetailsView ID="dvDatos" runat="server" AutoGenerateRows="False" CellPadding="4"
        DataKeyNames="cod_stu" DataSourceID="objporMatrcula" Font-Names="Arial" Font-Size="12px"
        ForeColor="#333333" GridLines="None" OnDataBound="DetailsView1_DataBound">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="cod_stu" HeaderText="Codigo" InsertVisible="False" ReadOnly="True"
                SortExpression="cod_stu" />
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
    <strong><span style="font-family: Arial">Deudas pendiente de pago<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="id_balance" DataSourceID="objViewBalance" Font-Names="Arial" Font-Size="12px"
            ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                <asp:BoundField DataField="id_balance" HeaderText="No." InsertVisible="False" ReadOnly="True"
                    SortExpression="id_balance" />
                <asp:BoundField DataField="concepto" HeaderText="Concepto" SortExpression="concepto" />
                <asp:BoundField DataField="monto" HeaderText="Monto Servicio" SortExpression="monto" />
                <asp:TemplateField HeaderText="Cargo Inscripcion" SortExpression="inscripcion">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("inscripcion") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("inscripcion", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="cant_creditos" HeaderText="Creditos" SortExpression="cant_creditos" />
                <asp:TemplateField HeaderText="Cargo Creditos" SortExpression="total_por_Creditos">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("total_por_Creditos") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("total_por_Creditos", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                <asp:BoundField DataField="ciclo" HeaderText="Ciclo" SortExpression="ciclo" />
                <asp:BoundField DataField="tipo" HeaderText="Tipo" SortExpression="tipo" />
                <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" />
            </Columns>
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="objViewBalance" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.viewCajaBalanceEstudianteTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:DataList ID="DataList1" runat="server" Font-Names="Arial" Font-Size="12px" OnDeleteCommand="DataList1_DeleteCommand">
            <ItemTemplate>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left" style="width: 136px; height: 46px;" valign="top">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("codigo") %>'></asp:Label></td>
                        <td align="left" style="width: 128px; height: 46px;" valign="top">
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("tipo") %>'></asp:Label></td>
                        <td align="left" style="width: 128px; height: 46px;" valign="top">
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("monto") %>'></asp:Label></td>
                        <td align="left" style="width: 160px; height: 46px;" valign="top">
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("fecha") %>'></asp:Label></td>
                        <td align="left" style="width: 160px; height: 46px;" valign="top">
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>EFECTIVO</asp:ListItem>
                                <asp:ListItem>TARJETA</asp:ListItem>
                                <asp:ListItem>CHEQUE</asp:ListItem>
                                <asp:ListItem>BONO</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="left" style="width: 160px; height: 46px;" valign="top">
                            <asp:TextBox ID="TextBox3" runat="server" Width="50px"></asp:TextBox></td>
                        <td align="left" style="width: 160px; height: 46px" valign="top">
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("ciclo") %>'></asp:Label></td>
                        <td style="height: 46px">
                            <asp:LinkButton ID="delete" runat="server" CommandName="Delete" Font-Bold="True"
                                Font-Size="15px" ForeColor="Red" Text="  X"></asp:LinkButton></td>
                    </tr>
                </table>
            </ItemTemplate>
            <HeaderTemplate>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left" style="width: 136px; background-color: #990000" valign="top">
                            <strong><span style="color: #ffffff">Codigo</span></strong></td>
                        <td align="left" style="width: 128px; background-color: #990000" valign="top">
                            <strong><span style="color: #ffffff">Tipo</span></strong></td>
                        <td align="left" style="width: 128px; background-color: #990000" valign="top">
                            <span style="color: #ffffff"><strong>Monto</strong></span></td>
                        <td align="left" style="width: 160px; background-color: #990000" valign="top">
                            <strong><span style="color: #ffffff">Fecha</span></strong></td>
                            <td align="left" style="width: 160px; background-color: #990000" valign="top">
                            <strong><span style="color: #ffffff">Tipo Pago</span></strong></td>
                            <td align="left" style="width: 160px; background-color: #990000" valign="top">
                            <strong><span style="color: #ffffff">Monto a Pagar</span></strong></td>
                        <td align="left" style="width: 160px; background-color: #990000" valign="top">
                            <span style="color: #ffffff">Ciclo</span></td>
                        <td style="background-color: #990000">
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
        </asp:DataList></span></strong><span style="font-size: 12px; font-family: Arial"><strong><br />
    </strong></span>
    <asp:Button ID="Button2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"
        OnClick="Button2_Click" Text="Pagar" /><br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/PagosRecibo.aspx" Target="_blank"
        Visible="False">Imprimir Recibo</asp:HyperLink>
    &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    <asp:Label ID="lblmsg" runat="server" ForeColor="#0000FF"></asp:Label>
    <hr />
    <span style="font-size: 12px; font-family: Arial"><strong>Ultimos pagos realizados</strong></span>
    &nbsp; &nbsp;&nbsp;<br />
    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="id_Recibo" DataSourceID="objPagos" EmptyDataText="No hay pagos realizados"
        Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="id_Recibo" HeaderText="No. Recibo" InsertVisible="False"
                ReadOnly="True" SortExpression="id_Recibo" />
            <asp:BoundField DataField="fecha_hora" HeaderText="Fecha" SortExpression="fecha_hora" />
            <asp:CommandField SelectText="Imprimir" ShowSelectButton="True" />
        </Columns>
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="objPagos" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.ReciboMatriculaTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

