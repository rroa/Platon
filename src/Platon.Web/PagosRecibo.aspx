<%@ Page Language="C#" MasterPageFile="~/mpDirectivaNM.master" AutoEventWireup="true" CodeFile="PagosRecibo.aspx.cs" Inherits="PagosRecibo" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <rsweb:reportviewer id="ReportViewer1" runat="server" width="90%" Font-Names="Verdana" Font-Size="8pt" Height="400px" ShowParameterPrompts="False">
        <LocalReport ReportPath="reportes\PagosRecibo.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_viewRecibo" />
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="centroestudio_CentroEstudio" />
            </DataSources>
        </LocalReport>
        <ServerReport ReportPath="/rptUNIREMHOS/rptRecibo" />
    </rsweb:reportviewer>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="centroestudioTableAdapters.CentroEstudioTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_idcentro" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="siglas" Type="String" />
            <asp:Parameter Name="Original_idcentro" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idcentro" Type="Int32" />
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="siglas" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByRecibo" TypeName="dsUniversidadTableAdapters.viewReciboTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="recibo" SessionField="IdReciboImpresion" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

