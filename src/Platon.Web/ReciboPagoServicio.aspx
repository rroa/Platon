<%@ Page Language="C#" MasterPageFile="~/mpDirectivaNM.master" AutoEventWireup="true" CodeFile="ReciboPagoServicio.aspx.cs" Inherits="ReciboPagoServicio"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="400px" Width="700px">
        <LocalReport ReportPath="ReciboPagoServicio.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_PagoServicio" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByIdPago" TypeName="dsUniversidadTableAdapters.PagoServicioTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="idpago" SessionField="ReciboServicio" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

