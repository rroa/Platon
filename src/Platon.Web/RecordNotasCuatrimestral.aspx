<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="RecordNotasCuatrimestral.aspx.cs" Inherits="RecordNotasCuatrimestral" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 18pt; font-family: Arial">RECORD DE NOTAS CUATRIMESTRAL</span>&nbsp;
    <hr />
    <br />
    <span style="font-size: 12px; font-family: Arial">Escriba la matrícula del estudiante
        para visualizar su record de notas<br />
    </span>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><span style="font-size: 12px;
        font-family: Arial">&nbsp; </span>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Buscar" /><br />
    <br />
    <span style="font-size: 10pt; font-family: Arial">Cuatrimestre:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odsCiclo"
            DataTextField="nombre" DataValueField="nombre">
        </asp:DropDownList><asp:ObjectDataSource ID="odsCiclo" runat="server" DeleteMethod="Delete"
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="dsUniversidadTableAdapters.CicloTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id_ciclo" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ano" Type="Int32" />
                <asp:Parameter Name="f_inicio" Type="DateTime" />
                <asp:Parameter Name="f_fin" Type="DateTime" />
                <asp:Parameter Name="activo" Type="Boolean" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="fecha_recargo" Type="DateTime" />
                <asp:Parameter Name="recargoaplicado" Type="Boolean" />
                <asp:Parameter Name="recargo_2" Type="DateTime" />
                <asp:Parameter Name="recargo_3" Type="DateTime" />
                <asp:Parameter Name="recargo_4" Type="DateTime" />
                <asp:Parameter Name="fecha_bajasanadidas" Type="DateTime" />
                <asp:Parameter Name="fecha_retiro" Type="DateTime" />
                <asp:Parameter Name="fecha_inscripcion" Type="DateTime" />
                <asp:Parameter Name="Original_id_ciclo" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ano" Type="Int32" />
                <asp:Parameter Name="f_inicio" Type="DateTime" />
                <asp:Parameter Name="f_fin" Type="DateTime" />
                <asp:Parameter Name="activo" Type="Boolean" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="fecha_recargo" Type="DateTime" />
                <asp:Parameter Name="recargoaplicado" Type="Boolean" />
                <asp:Parameter Name="recargo_2" Type="DateTime" />
                <asp:Parameter Name="recargo_3" Type="DateTime" />
                <asp:Parameter Name="recargo_4" Type="DateTime" />
                <asp:Parameter Name="fecha_bajasanadidas" Type="DateTime" />
                <asp:Parameter Name="fecha_retiro" Type="DateTime" />
                <asp:Parameter Name="fecha_inscripcion" Type="DateTime" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </span>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="ObjectDataSource1" Font-Names="Arial" Font-Size="12px" ForeColor="#333333"
        GridLines="None" Width="632px">
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />
        <Columns>
            <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
            <asp:BoundField DataField="mat_cod" HeaderText="Mat. Cod." SortExpression="mat_cod" />
            <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
            <asp:BoundField DataField="nota" HeaderText="Nota(L)" SortExpression="nota" />
            <asp:BoundField DataField="nota_num" HeaderText="Nota(N)" SortExpression="nota_num" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatriculaCiclo" TypeName="dsUniversidadTableAdapters.View_RecordDeNotasTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="{0}" Name="matricula" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="ciclo" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <span style="font-size: 12px; font-family: Arial">Haga clic en el botón de refrescar
        para actualizar el reporte<br />
        <rsweb:reportviewer id="ReportViewer1" runat="server" font-names="Verdana" font-size="8pt"
            height="400px" width="100%">
<LocalReport ReportPath="reportes\Record_de_NotasCuatrimestral.rdlc"><DataSources>
<rsweb:ReportDataSource Name="dsUniversidad_View_RecordDeNotas" DataSourceId="ObjectDataSource2"></rsweb:ReportDataSource>
</DataSources>
</LocalReport>
</rsweb:reportviewer>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByMatriculaCiclo" TypeName="dsUniversidadTableAdapters.View_RecordDeNotasTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="{0}" Name="matricula" PropertyName="Text"
                    Type="String" />
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="ciclo" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        &nbsp; </span>
</asp:Content>

