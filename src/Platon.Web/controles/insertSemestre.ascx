<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertSemestre.ascx.cs" Inherits="controles_insertSemestre" %>
<span style="font-size: 24px; font-family: Arial">MANTENIMIENTO DE CUATRIMESTRE
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; font-family: Arial">
    <tr>
        <td>
            <strong>
            Nombre del Cuatrimestre</strong></td>
        <td>
            <asp:TextBox ID="txtperiodo" runat="server" Width="280px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="height: 21px">
        </td>
        <td style="height: 21px">
            <asp:ImageButton ID="btnInsertar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                OnClick="btnInsertar_Click1" /></td>
    </tr>
    <tr>
        <td colspan="2" style="height: 21px">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
    </tr>
    <tr>
        <td style="height: 22px">
        </td>
        <td style="height: 22px">
        </td>
    </tr>
    <tr>
        <td colspan="2" style="height: 18px; background-color: whitesmoke">
            <strong>CUATRIMESTRES ACTUALES</strong></td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:GridView ID="gvPeriodo" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="id_sem" DataSourceID="ObjectSemestre" CellPadding="4" Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None">
                <Columns>
                    <asp:CommandField CancelText="Cancelar" DeleteText="Borrar" EditText="Editar" InsertText="Insertar"
                        NewText="Nuevo" SelectText="Seleccionar" ShowDeleteButton="True" ShowEditButton="True"
                        UpdateText="Actualizar" />
                    <asp:BoundField DataField="id_sem" HeaderText="C&#243;digo" InsertVisible="False" ReadOnly="True"
                        SortExpression="id_sem" />
                    <asp:BoundField DataField="descripcion" HeaderText="Cuatrimestre" SortExpression="descripcion" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectSemestre" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.SemestreTableAdapter"
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_sem" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="Original_id_sem" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
</table>
