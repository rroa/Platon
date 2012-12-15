<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="InformeCalificacionFinal.aspx.cs" Inherits="InformeCalificacionFinal"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Century Gothic"><span style="font-family: Arial"><span style="font-size: 16pt"><span style="font-size: 24px">IMPRESION
        DE INFORME DE CALIFICACION FINAL
            <hr />
        </span>
    </span><span style="font-size: 12px"><strong>Nota :</strong>
            <br />
            Seleccione una secci&oacute;n para ver los estudiantes.
        <br />
        Luego haga clic en el botón de refrescar dentro del visualizador de reportes.</span></span><br />
        <br />
        <span style="font-size: 9pt; font-family: Arial">Sección: </span>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><span style="font-size: 12px;
            font-family: Arial"> </span>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Buscar" /><br />
    </span>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="id_session" Font-Names="Arial"
        Font-Size="12px" ForeColor="#333333" GridLines="None" DataSourceID="ObjectDataSource3">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
            <asp:BoundField DataField="session_cod" HeaderText="Secci&#243;n" SortExpression="session_cod" />
            <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
            <asp:BoundField DataField="profesor" HeaderText="Profesor" ReadOnly="True" SortExpression="profesor" />
            <asp:BoundField DataField="horario" HeaderText="Horario" SortExpression="horario" />
        </Columns>
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByID_Session" TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="{0}" Name="session_cod"
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <rsweb:reportviewer id="ReportViewer1" runat="server" font-names="Arial" font-size="8pt"
        height="400px" width="700px">
<LocalReport ReportPath="reportes\InformeCalificacionFinal.rdlc"><DataSources>
    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_Estudiantes_en_sesion" />
</DataSources>
</LocalReport>
</rsweb:reportviewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataBySession" TypeName="dsUniversidadTableAdapters.Estudiantes_en_sesionTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="session" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

