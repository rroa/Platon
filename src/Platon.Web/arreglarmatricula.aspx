<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="arreglarmatricula.aspx.cs" Inherits="arreglarmatricula" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">ARREGLAR MATRICULAS
        <hr />
    </span><span style="font-size: 9pt; font-family: Arial">Escriba la matrícula del estudiante<br />
    </span>
    <asp:TextBox ID="txtmatricula" runat="server" Font-Names="Arial"></asp:TextBox>
    <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg" />&nbsp;
    <asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
        OnClick="btnNuevo_Click" /><br />
    <asp:DetailsView ID="dvDatos" runat="server" AutoGenerateRows="False" CellPadding="4" DataSourceID="objporMatrcula" Font-Names="Arial" Font-Size="12px"
        ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="matricula" HeaderText="Matricula" SortExpression="matricula" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
            <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
            <asp:TemplateField HeaderText="F. inscripci&#243;n" SortExpression="f_inscripcion">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("f_inscripcion") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("f_inscripcion") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("f_inscripcion", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="carrera_nombre" HeaderText="Carrera" SortExpression="carrera_nombre" />
        </Fields>
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
    <asp:ObjectDataSource ID="objporMatrcula" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <span style="font-size: 13px; color: #ff0000; font-family: Arial"><strong>NUEVA MATRICULA
        <asp:TextBox ID="txtnuevamatricula" runat="server"></asp:TextBox>&nbsp;<asp:ImageButton ID="ImageButton1"
            runat="server" ImageUrl="~/images/botones/btn_registrar.jpg" OnClick="ImageButton1_Click" /><br />
        </strong></span><br />
        <asp:Label ID="lblmsg" runat="server" Font-Names="Arial" Font-Size="13px"></asp:Label>
</asp:Content>

