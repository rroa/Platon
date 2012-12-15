<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="PensumEstudiante.aspx.cs" Inherits="imprimirPensum" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">IMPRESION DE PENSUM</span>
    <hr />
    <br />
    <span style="font-size: 9pt; font-family: Arial">Seleccione la carrera para generar
        el pensum </span>
    <asp:DropDownList ID="ddlcarreras" runat="server" DataSourceID="objCarrera" DataTextField="carrera_nombre"
        DataValueField="id_carrera" Width="284px">
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
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="400px" Width="662px" ZoomMode="PageWidth">
        <LocalReport ReportPath="rptImprimirPensumEstudiante.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_view_Pensum" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByCarrera" TypeName="dsUniversidadTableAdapters.view_PensumTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlcarreras" Name="id_carrera" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

