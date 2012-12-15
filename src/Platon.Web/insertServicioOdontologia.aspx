<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="insertServicioOdontologia.aspx.cs" Inherits="insertServicioOdontologia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 20px; font-family: Arial">SERVICIOS DE ODONTOLOGIA
        <hr />
    </span>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
        <tr>
            <td valign="top">
                <table style="font-size: 12px; font-family: Arial">
                    <tr>
                        <td colspan="2">
                            <strong>INSERTAR SERVICIOS</strong></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span style="color: #ffffff">.</span></td>
                    </tr>
                    <tr>
                        <td>
                            Servicio</td>
                        <td>
                            <asp:TextBox ID="txtservicio" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            Costo</td>
                        <td>
                            <asp:TextBox ID="txtcosto" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Guardar" />
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cancelar" /></td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="lblmsg" runat="server"></asp:Label></td>
            <td valign="top">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_serv_odon" DataSourceID="ObjectDataSource1"
                    ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField CancelText="Cancelar" DeleteText="Borrar" EditText="Editar" InsertText="Insertar"
                            NewText="Nuevo" SelectText="Seleccionar" ShowDeleteButton="True" ShowEditButton="True"
                            UpdateText="Actualizar" />
                        <asp:BoundField DataField="id_serv_odon" HeaderText="Id." InsertVisible="False" ReadOnly="True"
                            SortExpression="id_serv_odon" />
                        <asp:BoundField DataField="servicio" HeaderText="Servicio" SortExpression="servicio" />
                        <asp:BoundField DataField="costo" HeaderText="Costo" SortExpression="costo" />
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
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
            </td>
        </tr>
    </table>
</asp:Content>

