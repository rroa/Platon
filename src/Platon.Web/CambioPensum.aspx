<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="CambioPensum.aspx.cs" Inherits="CambioPensum"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 20px; font-family: Arial">CAMBIO DE PENSUM
        <hr />
    </span>
    <br />
    <span style="font-size: 12px; font-family: Arial">Escriba la matricula del estudiante:<br />
    </span>
    <asp:TextBox ID="txtmatricula" runat="server" Width="196px"></asp:TextBox><span style="font-size: 12px;
        font-family: Arial"> </span>
    <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" /><br />
    <br />
    <span style="font-size: 12px; font-family: Arial">Carrera: </span>
    <asp:Label ID="lblcarrera" runat="server"></asp:Label><br />
    <span style="font-size: 12px; font-family: Arial">Pensum inscrito: </span>
    <asp:Label ID="lblpensum" runat="server"></asp:Label><br />
    <asp:Label ID="lblcarreraid" runat="server" Visible="False"></asp:Label><br />
    <span style="font-size: 12px; font-family: Arial">
        <asp:Label ID="lblcodstu" runat="server" Visible="False"></asp:Label><br />
        <br />
        Pensum de la carrera<br />
    </span>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="no_pensum" DataSourceID="objPensum" Font-Names="Arial" Font-Size="12px"
        ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
            <asp:BoundField DataField="no_pensum" HeaderText="Numero de Pensum" SortExpression="no_pensum" />
        </Columns>
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="objPensum" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByCarreraPensum"
        TypeName="dsUniversidadTableAdapters.PensumTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_pensum" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_carrera" Type="Int32" />
            <asp:Parameter Name="id_materia" Type="Int32" />
            <asp:Parameter Name="prereq" Type="Int32" />
            <asp:Parameter Name="semestre" Type="Int32" />
            <asp:Parameter Name="no_pensum" Type="Int32" />
            <asp:Parameter Name="Original_id_pensum" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="lblcarreraid" Name="carrera" PropertyName="Text"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="id_carrera" Type="Int32" />
            <asp:Parameter Name="id_materia" Type="Int32" />
            <asp:Parameter Name="prereq" Type="Int32" />
            <asp:Parameter Name="semestre" Type="Int32" />
            <asp:Parameter Name="no_pensum" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:Label ID="lblmsg" runat="server" Font-Names="Arial" Font-Size="12px"></asp:Label><br />
    <br />
    <asp:Button ID="btnCambiar" runat="server" OnClick="btnCambiar_Click" Text="Cambiar Pensum" />
</asp:Content>

