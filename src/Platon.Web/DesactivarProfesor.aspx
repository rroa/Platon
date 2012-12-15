<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="DesactivarProfesor.aspx.cs" Inherits="DesactivarProfesor"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">DESACTIVAR / ACTIVAR PROFESORES
        <hr />
    </span>
    <table>
        <tr>
            <td align="left" style="text-align: left">
                <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Size="12px" Text="Inserte el Nombre del nombre del profesor"></asp:Label></td>
        </tr>
        <tr>
            <td align="left">
                <asp:TextBox ID="txtProfesor" runat="server" Width="139px"></asp:TextBox>&nbsp;<asp:ImageButton
                    ID="btnBuscarProfesor" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                    OnClick="btnBuscarProfesor_Click" /></td>
        </tr>
        <tr>
            <td style="text-align: center" valign="top">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="id_profesor" Font-Names="Arial" Font-Size="12px"
                    ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                        <asp:BoundField DataField="prof_nombre" HeaderText="Nombre" SortExpression="prof_nombre" />
                        <asp:BoundField DataField="prof_apellido" HeaderText="Apellido" SortExpression="prof_apellido" />
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
            <td style="height: 33px; text-align: center">
                <asp:Button ID="btnProfesoresDesactivar" runat="server" OnClick="btnProfesoresDesactivar_Click"
                    Text="Desactivar" />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Activar" Width="90px" /></td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dsUniversidadTableAdapters.ProfesoresTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_profesor" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="prof_cedula" Type="String" />
            <asp:Parameter Name="prof_nombre" Type="String" />
            <asp:Parameter Name="prof_apellido" Type="String" />
            <asp:Parameter Name="prof_f_nac" Type="DateTime" />
            <asp:Parameter Name="prof_f_ingreso" Type="DateTime" />
            <asp:Parameter Name="prof_telefono" Type="String" />
            <asp:Parameter Name="prof_direccion" Type="String" />
            <asp:Parameter Name="activo" Type="Boolean" />
            <asp:Parameter Name="Original_id_profesor" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="prof_cedula" Type="String" />
            <asp:Parameter Name="prof_nombre" Type="String" />
            <asp:Parameter Name="prof_apellido" Type="String" />
            <asp:Parameter Name="prof_f_nac" Type="DateTime" />
            <asp:Parameter Name="prof_f_ingreso" Type="DateTime" />
            <asp:Parameter Name="prof_telefono" Type="String" />
            <asp:Parameter Name="prof_direccion" Type="String" />
            <asp:Parameter Name="activo" Type="Boolean" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByNombre"
        TypeName="dsUniversidadTableAdapters.ProfesoresTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_profesor" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="prof_cedula" Type="String" />
            <asp:Parameter Name="prof_nombre" Type="String" />
            <asp:Parameter Name="prof_apellido" Type="String" />
            <asp:Parameter Name="prof_f_nac" Type="DateTime" />
            <asp:Parameter Name="prof_f_ingreso" Type="DateTime" />
            <asp:Parameter Name="prof_telefono" Type="String" />
            <asp:Parameter Name="prof_direccion" Type="String" />
            <asp:Parameter Name="activo" Type="Boolean" />
            <asp:Parameter Name="Original_id_profesor" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtProfesor" Name="prof_nombre" PropertyName="Text"
                Type="String" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="prof_cedula" Type="String" />
            <asp:Parameter Name="prof_nombre" Type="String" />
            <asp:Parameter Name="prof_apellido" Type="String" />
            <asp:Parameter Name="prof_f_nac" Type="DateTime" />
            <asp:Parameter Name="prof_f_ingreso" Type="DateTime" />
            <asp:Parameter Name="prof_telefono" Type="String" />
            <asp:Parameter Name="prof_direccion" Type="String" />
            <asp:Parameter Name="activo" Type="Boolean" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

