<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="EstudiantesActivos.aspx.cs" Inherits="EstudiantesActivos" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Arial"><span style="font-size: 24px">ESTUDIANTES ACTIVOS EN
        EL CICLO ACTUAL
        <hr />
    </span>Resumen</span>:<br />
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="400px" Width="90%">
        <LocalReport ReportPath="reportes\EstudiantesActivosResumen.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_Conteo_EstudiantesActivos" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.Conteo_EstudiantesActivosTableAdapter">
    </asp:ObjectDataSource>
    <br />
    <br />
    <span style="font-family: Arial">Detalle<br />
        <rsweb:ReportViewer ID="ReportViewer2" runat="server" Font-Names="Verdana" Font-Size="8pt"
            Height="400px" Width="90%">
            <LocalReport ReportPath="reportes\EstudiantesActivosDetalle.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="dsUniversidad_view_EstudiantesActivos" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.view_EstudiantesActivosTableAdapter">
        </asp:ObjectDataSource>
    </span>
</asp:Content>

