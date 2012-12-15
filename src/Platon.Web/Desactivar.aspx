<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="Desactivar.aspx.cs" Inherits="Desactivar"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">DESACTIVAR/ACTIVAR USUARIOS
        <hr />
    </span>
    <br />
    <table>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="Label2" runat="server" Text="Escriba el nombre del usuario del sistema" Width="250px" Font-Names="Arial" Font-Size="12px"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtUsuario" runat="server" Width="139px"></asp:TextBox>&nbsp;<asp:ImageButton
                    ID="btnBuscarUsuario" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg" OnClick="btnBuscarUsuario_Click"
                    /></td>
        </tr>
        <tr>
            <td style="text-align: center" valign="top">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="id_user" ForeColor="#333333" GridLines="None" AllowPaging="True" Font-Names="Arial" Font-Size="12px">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                        <asp:CheckBoxField DataField="activo" HeaderText="activo" SortExpression="activo" />
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; height: 33px;">
                <asp:Button ID="btnUsuariosDesactivar" runat="server" Text="Desactivar" OnClick="btnUsuariosDesactivar_Click" />
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Activar" Width="90px" /></td>
        </tr>
        <tr>
            <td style="text-align: center; height: 14px;">
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dsUniversidadTableAdapters.tblUsuarioTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_user" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="apellido" Type="String" />
            <asp:Parameter Name="cedula" Type="String" />
            <asp:Parameter Name="sexo" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="lugar_nacimiento" Type="String" />
            <asp:Parameter Name="fecha_nacimiento" Type="DateTime" />
            <asp:Parameter Name="estado_civil" Type="String" />
            <asp:Parameter Name="rol" Type="Int32" />
            <asp:Parameter Name="Original_id_user" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="f_ingreso" Type="DateTime" />
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="apellido" Type="String" />
            <asp:Parameter Name="cedula" Type="String" />
            <asp:Parameter Name="sexo" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="lugar_nacimiento" Type="String" />
            <asp:Parameter Name="fecha_nacimiento" Type="DateTime" />
            <asp:Parameter Name="estado_civil" Type="String" />
            <asp:Parameter Name="rol" Type="Int32" />
            <asp:Parameter Name="activo" Type="Boolean" />
        </InsertParameters>
    </asp:ObjectDataSource>
    &nbsp; &nbsp;
    <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByNombre"
        TypeName="dsUniversidadTableAdapters.tblUsuarioTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_user" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="apellido" Type="String" />
            <asp:Parameter Name="cedula" Type="String" />
            <asp:Parameter Name="sexo" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="lugar_nacimiento" Type="String" />
            <asp:Parameter Name="fecha_nacimiento" Type="DateTime" />
            <asp:Parameter Name="estado_civil" Type="String" />
            <asp:Parameter Name="rol" Type="Int32" />
            <asp:Parameter Name="Original_id_user" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtUsuario" Name="nombre" PropertyName="Text" Type="String" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="f_ingreso" Type="DateTime" />
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="apellido" Type="String" />
            <asp:Parameter Name="cedula" Type="String" />
            <asp:Parameter Name="sexo" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="lugar_nacimiento" Type="String" />
            <asp:Parameter Name="fecha_nacimiento" Type="DateTime" />
            <asp:Parameter Name="estado_civil" Type="String" />
            <asp:Parameter Name="rol" Type="Int32" />
            <asp:Parameter Name="activo" Type="Boolean" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <br />
</asp:Content>

