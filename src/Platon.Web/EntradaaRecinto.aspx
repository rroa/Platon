<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="EntradaaRecinto.aspx.cs" Inherits="EntradaaRecinto"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">PERMISOS DE RECINTO A USUARIO
        <hr />
    </span>Usuarios:
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_user"
        DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
            <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
            <asp:BoundField DataField="rol" HeaderText="Rol" SortExpression="rol" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByActivo"
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
    <br />
    Seleccione el recinto<br />
    <asp:DropDownList ID="ddlRecinto" runat="server" DataSourceID="ObjectDataSource2"
        DataTextField="recinto_nombre" DataValueField="id_recinto" OnDataBound="ddlRecinto_DataBound"
        Width="282px">
    </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dsUniversidadTableAdapters.RecintoTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_recinto" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="recinto_nombre" Type="String" />
            <asp:Parameter Name="siglas" Type="String" />
            <asp:Parameter Name="rec_dir" Type="String" />
            <asp:Parameter Name="rec_tel" Type="String" />
            <asp:Parameter Name="Original_id_recinto" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="recinto_nombre" Type="String" />
            <asp:Parameter Name="siglas" Type="String" />
            <asp:Parameter Name="rec_dir" Type="String" />
            <asp:Parameter Name="rec_tel" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
        OnClick="ImageButton1_Click" />
</asp:Content>

