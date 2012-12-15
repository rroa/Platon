<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="imprimirPensum.aspx.cs" Inherits="imprimirPensum" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">IMPRESION DE PENSUM</span>
    <hr />
    <br />
    <span style="font-size: 9pt; font-family: Arial">Seleccione la carrera para generar
        el pensum </span>
    <asp:DropDownList ID="ddlcarreras" runat="server" DataSourceID="objCarrera" DataTextField="carrera_nombre"
        DataValueField="id_carrera" Width="400px" AutoPostBack="True" OnSelectedIndexChanged="ddlcarreras_SelectedIndexChanged">
    </asp:DropDownList><asp:ObjectDataSource ID="objCarrera" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dsUniversidadTableAdapters.CarreraTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_carrera" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="carrera_nombre" Type="String" />
            <asp:Parameter Name="carrera_cant_credito" Type="Int32" />
            <asp:Parameter Name="carrera_siglas" Type="String" />
            <asp:Parameter Name="carrera_titulo" Type="String" />
            <asp:Parameter Name="Original_id_carrera" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="carrera_nombre" Type="String" />
            <asp:Parameter Name="carrera_cant_credito" Type="Int32" />
            <asp:Parameter Name="carrera_siglas" Type="String" />
            <asp:Parameter Name="carrera_titulo" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <br />
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="400px" Width="655px" ZoomMode="PageWidth">
        <LocalReport ReportPath="reportes\rptImprimirPensum.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_view_Pensum" />
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="centroestudio_CentroEstudio" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
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
        SelectMethod="GetDataByCarrera" TypeName="dsUniversidadTableAdapters.view_PensumTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlcarreras" Name="id_carrera" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

