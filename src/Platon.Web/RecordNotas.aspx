<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="RecordNotas.aspx.cs" Inherits="RecordNotas" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager runat="server" ID="scriptManager"></asp:ScriptManager>
    <span style="font-size: 24px; font-family: Arial">RECORD DE NOTAS</span>
    <hr />
    <br />
    <span style="font-size: 12px; font-family: Arial">Escriba la matr&iacute;cula del estudiante
        para visualizar su record de notas<br />
    </span>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><span style="font-size: 12px; font-family: Arial">&nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/edit.gif"
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
        <rsweb:ReportViewer id="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportPath="Record_de_Notas.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource Name="dsUniversidad_View_RecordDeNotas" DataSourceId="ObjectDataSource2"></rsweb:ReportDataSource>
                    <rsweb:ReportDataSource Name="dsUniversidad_Convalidaciones" DataSourceId="ObjectDataSource3"></rsweb:ReportDataSource>
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        &nbsp;&nbsp;
    <asp:ObjectDataSource runat="server" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.ConvalidacionesTableAdapter" ID="ObjectDataSource3" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="matricula" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
        <asp:ObjectDataSource runat="server" SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.View_RecordDeNotasTableAdapter" ID="ObjectDataSource2" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="matricula" Type="String"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
    </span>
</asp:Content>

