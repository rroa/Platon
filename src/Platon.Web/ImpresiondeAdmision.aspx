<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ImpresiondeAdmision.aspx.cs" Inherits="ImpresiondeAdmision"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <rsweb:reportviewer id="ReportViewer1" runat="server" font-names="Arial" font-size="8pt"
        width="650px">
<LocalReport ReportPath="FormularioAdmision.rdlc"><DataSources>
<rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_Vista_Dt_Estudiante"></rsweb:ReportDataSource>
</DataSources>
</LocalReport>
</rsweb:reportviewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="{0}" Name="matricula" SessionField="matricula_inscri"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

