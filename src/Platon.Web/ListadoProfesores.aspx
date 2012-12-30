<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ListadoProfesores.aspx.cs" Inherits="ListadoProfesores"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
    <span style="font-size: 24px; font-family: Arial">LISTADO DE PROFESORES
        <hr />
    </span>
    <br />
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="400px" Width="700px">
        <LocalReport ReportPath="reportes\ListadoProfesores.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_Profesores" />
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
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByActivo"
        TypeName="dsUniversidadTableAdapters.ProfesoresTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_profesor" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="prof_cedula" Type="String" />
            <asp:Parameter Name="prof_nombre" Type="String" />
            <asp:Parameter Name="prof_apellido" Type="String" />
            <asp:Parameter Name="prof_f_nac" Type="DateTime" />
            <asp:Parameter Name="prof_f_ingreso" Type="DateTime" />
            <asp:Parameter Name="prof_telefono" Type="String" />
            <asp:Parameter Name="prof_direccion" Type="String" />
            <asp:Parameter Name="activo" Type="Boolean" />
            <asp:Parameter Name="Original_id_profesor" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="prof_cedula" Type="String" />
            <asp:Parameter Name="prof_nombre" Type="String" />
            <asp:Parameter Name="prof_apellido" Type="String" />
            <asp:Parameter Name="prof_f_nac" Type="DateTime" />
            <asp:Parameter Name="prof_f_ingreso" Type="DateTime" />
            <asp:Parameter Name="prof_telefono" Type="String" />
            <asp:Parameter Name="prof_direccion" Type="String" />
            <asp:Parameter Name="activo" Type="Boolean" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

