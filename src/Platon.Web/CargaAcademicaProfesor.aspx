<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="CargaAcademicaProfesor.aspx.cs" Inherits="CargaAcademicaProfesor" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">CARGA ACADEMICA POR PROFESOR
        <hr />
    </span>Seleccione el profesor
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odsProfesor"
        DataTextField="profesor" DataValueField="id_profesor" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList><asp:ObjectDataSource ID="odsProfesor" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.ProfesorFullNameTableAdapter">
    </asp:ObjectDataSource>
    <br />
    <rsweb:reportviewer id="ReportViewer1" runat="server" font-names="Verdana" font-size="8pt"
        height="400px" width="100%">
<LocalReport ReportPath="reportes\rptCargaAcademicaProfesor.rdlc"><DataSources>
<rsweb:ReportDataSource Name="dsUniversidad_CargaAcademicaProfesor_SELECT" DataSourceId="ObjectDataSource1"></rsweb:ReportDataSource>
</DataSources>
</LocalReport>
</rsweb:reportviewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.CargaAcademicaProfesor_SELECTTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="profesor" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

