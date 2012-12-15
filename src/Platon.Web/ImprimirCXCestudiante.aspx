<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ImprimirCXCestudiante.aspx.cs" Inherits="ImprimirCXCestudiante"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="400px" Width="658px" ZoomMode="PageWidth">
        <LocalReport ReportPath="imprimircxcestudiante.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_viewCajaBalanceEstudiante" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.viewCajaBalanceEstudianteTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="matricula" SessionField="matrireport" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

