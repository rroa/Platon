<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ImprimirResumenEntreFechas.aspx.cs" Inherits="ImprimirResumenDiario"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">
    RESUMEN ENTRA RANGO DE FECHAS</span>
    <hr />
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="400px" Width="660px">
        <LocalReport ReportPath="ImprimirResumenEntreFechas.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_viewCajaPagoEstudiante" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByRangoFecha" TypeName="dsUniversidadTableAdapters.viewCajaPagoEstudianteTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="fecha" SessionField="fechasel1" Type="DateTime" />
            <asp:SessionParameter Name="fecha2" SessionField="fechasel2" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

