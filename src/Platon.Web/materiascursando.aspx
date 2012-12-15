<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="materiascursando.aspx.cs" Inherits="materiascursando"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 12px; font-family: Arial">
    Por favor escriba su matr&iacute;cula para consultar las clases que esta tomando<br />
        <br />
    </span>
    <asp:TextBox
        ID="TextBox1" runat="server"></asp:TextBox>
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
        OnClick="ImageButton1_Click" /><br />
    <br />
    <asp:GridView ID="GridView1"
        runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource1"
        Font-Names="Arial" Font-Size="8.3pt" ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="matricula" HeaderText="Matricula" SortExpression="matricula" />
            <asp:BoundField DataField="session_cod" HeaderText="Seccion" SortExpression="session_cod" />
            <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad" />
            <asp:BoundField DataField="ano" HeaderText="Ano" SortExpression="ano" />
            <asp:BoundField DataField="profesor" HeaderText="Profesor" ReadOnly="True" SortExpression="profesor" />
            <asp:BoundField DataField="mat_cod" HeaderText="Materia" SortExpression="mat_cod" />
            <asp:BoundField DataField="Expr1" HeaderText="Aula" SortExpression="Expr1" />
        </Columns>
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.EstudianteenclasesTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="{0}" Name="matricula" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    &nbsp;
</asp:Content>

