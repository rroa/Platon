<%@ Control Language="C#" AutoEventWireup="true" CodeFile="mensajes.ascx.cs" Inherits="controles_mensajes" %>
<span style="font-size: 13pt; font-family: Arial"><strong><span style="font-size: 24px;
    font-family: Arial">MENSAJES DE INICIO</span>
    <hr />
</strong></span>
<br />
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td align="left" style="height: 36px" valign="top">
            <span style="font-family: Arial; font-size: 9pt;">T&iacute;tulo</span></td>
        <td align="left" style="height: 36px" valign="top">
            <asp:TextBox ID="txtTitulo" runat="server" Font-Names="Arial" Width="280px" Font-Size="12px"></asp:TextBox></td>
    </tr>
    <tr>
        <td align="left" style="height: 95px" valign="top">
            <span style="font-family: Arial; font-size: 9pt;">Mensaje</span></td>
        <td align="left" style="height: 95px" valign="top">
            <asp:TextBox ID="txtMensaje" runat="server" Font-Names="Arial" Height="79px" TextMode="MultiLine"
                Width="315px" Font-Size="12px"></asp:TextBox></td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <asp:Button ID="Button1" runat="server" Font-Names="Arial" Text="Publicar Mensaje" OnClick="Button1_Click" Font-Size="12px" /></td>
    </tr>
</table>
<br />
<asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
    ForeColor="Red"></asp:Label><br />
<hr />
<br />
<span style="font-family: Arial"><strong>Mensajes</strong></span><br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
    DataKeyNames="id_msg" DataSourceID="objMensajes" Font-Names="Arial" Font-Size="12px"
    ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <Columns>
        <asp:CommandField SelectText="Desactivar" ShowSelectButton="True" />
        <asp:BoundField DataField="titulo" HeaderText="T&#237;tulo" SortExpression="titulo" />
        <asp:BoundField DataField="autor" HeaderText="Autor" SortExpression="autor" />
        <asp:TemplateField HeaderText="Fecha" SortExpression="fecha_post">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha_post") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha_post", "{0:d}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
<asp:ObjectDataSource ID="objMensajes" runat="server" DeleteMethod="Delete"
    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetMensajeByActivo"
    TypeName="dsUniversidadTableAdapters.tblMensajeTableAdapter" UpdateMethod="Update">
    <DeleteParameters>
        <asp:Parameter Name="Original_id_msg" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="fecha_post" Type="DateTime" />
        <asp:Parameter Name="titulo" Type="String" />
        <asp:Parameter Name="mensaje" Type="String" />
        <asp:Parameter Name="autor" Type="String" />
        <asp:Parameter Name="activo" Type="Boolean" />
        <asp:Parameter Name="Original_id_msg" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="fecha_post" Type="DateTime" />
        <asp:Parameter Name="titulo" Type="String" />
        <asp:Parameter Name="mensaje" Type="String" />
        <asp:Parameter Name="autor" Type="String" />
        <asp:Parameter Name="activo" Type="Boolean" />
    </InsertParameters>
</asp:ObjectDataSource>
