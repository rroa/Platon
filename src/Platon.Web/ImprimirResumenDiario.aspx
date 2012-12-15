<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ImprimirResumenDiario.aspx.cs" Inherits="ImprimirResumenDiario"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="400px" Width="662px">
        <LocalReport ReportPath="ImprimirResumenDiario.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_viewCajaPagoEstudiante" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByFecha" TypeName="dsUniversidadTableAdapters.viewCajaPagoEstudianteTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="fecha" SessionField="fechasel" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

