<%@ Page Language="C#" MasterPageFile="~/mpDirectivaNM.master" AutoEventWireup="true" CodeFile="ReciboAcuerdoPago.aspx.cs" Inherits="ReciboAcuerdoPago" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <rsweb:reportviewer id="ReportViewer1" runat="server" font-names="Verdana" font-size="8pt"
        height="400px" width="748px">
<LocalReport ReportPath="ReciboPagoAcuerdo.rdlc"><DataSources>
<rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_PagosAAcuerdos"></rsweb:ReportDataSource>
</DataSources>
</LocalReport>
</rsweb:reportviewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByPago"
        TypeName="dsUniversidadTableAdapters.PagosAAcuerdosTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_acuerdo_pagos" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_acuerdo" Type="Int32" />
            <asp:Parameter Name="pagos" Type="Decimal" />
            <asp:Parameter Name="fecha" Type="DateTime" />
            <asp:Parameter Name="activo" Type="Boolean" />
            <asp:Parameter Name="matricula" Type="String" />
            <asp:Parameter Name="Original_id_acuerdo_pagos" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="{0}" Name="pago" SessionField="PagoAcuerdo" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="id_acuerdo" Type="Int32" />
            <asp:Parameter Name="pagos" Type="Decimal" />
            <asp:Parameter Name="fecha" Type="DateTime" />
            <asp:Parameter Name="activo" Type="Boolean" />
            <asp:Parameter Name="matricula" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

