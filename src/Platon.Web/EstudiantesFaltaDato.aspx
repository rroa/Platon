<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="EstudiantesFaltaDato.aspx.cs" Inherits="EstudiantesFaltaDato"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 20px; font-family: Arial">ESTUDIANTES CON REQUISITOS PENDIENTES
        <hr />
    </span>
    <rsweb:reportviewer id="ReportViewer1" runat="server" font-names="Verdana" font-size="8pt"
        height="400px" width="700px" zoommode="FullPage">
<LocalReport ReportPath="reportes\EstudiantesFaltaDato.rdlc"><DataSources>
    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_Vista_Dt_Estudiante" />
</DataSources>
</LocalReport>
</rsweb:reportviewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByDatos" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
    </asp:ObjectDataSource>
</asp:Content>

