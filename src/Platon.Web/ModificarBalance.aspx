<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="ModificarBalance.aspx.cs" Inherits="ModificarBalance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Arial"><span style="font-size: 24px">MODULO DE MODIFICACION
        DE BALANCES
        <hr />
    </span><span style="font-size: 12px">Matrícula del estudiante: </span></span>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><span style="font-size: 12px;
        font-family: Arial">&nbsp;</span><asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" /><br />
    <br />
    <span style="font-size: 12px; font-family: Arial">Balances Activos<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="id_balance" DataSourceID="objViewBalance" Font-Names="Arial" Font-Size="12px"
            ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="{0}" Name="matricula" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
    </span>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                Monto Servicio</td>
            <td>
                <asp:TextBox ID="txtservicio" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
    Cargo por inscripción:</td>
            <td>
    <asp:TextBox ID="txtinscripcion" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
    Total de creditos:</td>
            <td>
            <asp:TextBox ID="txtcreditos" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
    Cargo por créditos:</td>
            <td>
    <asp:TextBox ID="txtcargocredito" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Modificar" /></td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="#FF0000"></asp:Label><br />
</asp:Content>

