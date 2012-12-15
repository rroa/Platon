<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="ResumenDiarioCajero.aspx.cs" Inherits="ResumenDiarioCajero"%>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">RESUMEN DIARIO
        <hr />
    </span><strong><span style="font-size: 9pt"><span style="font-family: Arial">Seleccione
        el día del que desea generar el resumen diario</span></span></strong><br />
    <asp:Calendar ID="CalResumen" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
        BorderWidth="1px" DayNameFormat="Full" Font-Names="Arial" Font-Size="12px" ForeColor="#663399"
        Height="200px" OnSelectionChanged="CalResumen_SelectionChanged" SelectedDate="2008-02-16"
        ShowGridLines="True" Width="220px">
        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        <SelectorStyle BackColor="#FFCC66" />
        <OtherMonthDayStyle ForeColor="#CC9966" />
        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
    </asp:Calendar>
    <asp:Label ID="lbldia" runat="server" Font-Names="Arial" Font-Size="14px"></asp:Label><br />
    <br />
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="400px" Width="100%">
        <LocalReport ReportPath="reportes\ResumenDiarioCajero.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_viewCajaPagoEstudiante" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByFechaUsuario" TypeName="dsUniversidadTableAdapters.viewCajaPagoEstudianteTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="CalResumen" Name="fecha" PropertyName="SelectedDate"
                Type="DateTime" />
            <asp:SessionParameter Name="usuario" SessionField="idUsuario" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

