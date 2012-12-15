<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="ServiciosOdontologia.aspx.cs" Inherits="ServiciosOdontologia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 20px; font-family: Arial">SERVICIOS DE ODONTOLOGIA
        <hr />
    </span>Nuevos servicios de odontologia<br />
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                Descripcion</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="219px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                Costo</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="88px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="height: 23px">
            </td>
            <td style="height: 23px">
                .</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                    OnClick="ImageButton1_Click" />&nbsp;<asp:ImageButton ID="ImageButton3" runat="server"
                        ImageUrl="~/images/botones/btn_cancelar.jpg" OnClick="ImageButton3_Click" />
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
                    OnClick="ImageButton2_Click" /></td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="id_serv_odon" DataSourceID="ObjectDataSource1" ForeColor="#333333"
        GridLines="None" Width="627px">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <Columns>
            <asp:CommandField CancelText="Cancelar" DeleteText="Borrar" EditText="Editar" InsertText="Insertar"
                NewText="Nuevo" SelectText="Seleccionar" ShowDeleteButton="True" ShowEditButton="True"
                UpdateText="Actualizar" />
            <asp:BoundField DataField="servicio" HeaderText="Servicio" SortExpression="servicio" />
            <asp:BoundField DataField="costo" HeaderText="Costo" SortExpression="costo" />
        </Columns>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dsUniversidadTableAdapters.Servicios_OdontologiaTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_serv_odon" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="servicio" Type="String" />
            <asp:Parameter Name="costo" Type="Decimal" />
            <asp:Parameter Name="Original_id_serv_odon" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="servicio" Type="String" />
            <asp:Parameter Name="costo" Type="Decimal" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

