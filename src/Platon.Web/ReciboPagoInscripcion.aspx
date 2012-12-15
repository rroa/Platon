<%@ Page Language="C#" MasterPageFile="~/mpDirectivaNM.master" AutoEventWireup="true" CodeFile="ReciboPagoInscripcion.aspx.cs" Inherits="ReciboPagoInscripcion"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="700px">
        <LocalReport ReportPath="ReciboPagoInscripcion.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_tblPagoMatriculacion" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByIdPago"
        TypeName="dsUniversidadTableAdapters.tblPagoMatriculacionTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="idpago" SessionField="ReciboInscripcion" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="matricula" Type="String" />
            <asp:Parameter Name="id_concepto" Type="String" />
            <asp:Parameter Name="fecha" Type="DateTime" />
            <asp:Parameter Name="monto" Type="Decimal" />
            <asp:Parameter Name="id_ciclo" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

