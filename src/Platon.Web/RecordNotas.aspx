<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="RecordNotas.aspx.cs" Inherits="RecordNotas" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">RECORD DE NOTAS</span>
    <hr />
    <br />
    <span style="font-size: 12px; font-family: Arial">Escriba la matr&iacute;cula del estudiante
        para visualizar su record de notas<br />
    </span>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><span style="font-size: 12px;
        font-family: Arial">&nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/edit.gif"
            OnClick="ImageButton1_Click" />
    </span>
    <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" /><br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="ObjectDataSource1" Font-Names="Arial" Font-Size="12px" ForeColor="#333333"
        GridLines="None" Width="632px">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />
        <Columns>
            <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
            <asp:BoundField DataField="mat_cod" HeaderText="Mat. Cod." SortExpression="mat_cod" />
            <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
            <asp:BoundField DataField="nota" HeaderText="Nota(L)" SortExpression="nota" />
            <asp:BoundField DataField="nota_num" HeaderText="Nota(N)" SortExpression="nota_num" />
        </Columns>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.View_RecordDeNotasTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="matricula" PropertyName="Text" Type="String" DefaultValue="{0}" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <span style="font-size: 12px; font-family: Arial">Haga clic en el bot&oacute;n de refrescar
        para actualizar el reporte<br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
            Height="400px" Width="100%" ZoomMode="PageWidth">
            <LocalReport ReportPath="Record_de_Notas.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="dsUniversidad_View_RecordDeNotas" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="dsUniversidad_Convalidaciones" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.ConvalidacionesTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="matricula" PropertyName="Text" Type="String" DefaultValue="{0}" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.View_RecordDeNotasTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="matricula" PropertyName="Text" Type="String" DefaultValue="{0}" />
            </SelectParameters>
        </asp:ObjectDataSource>
        &nbsp;&nbsp;
    </span>
</asp:Content>

