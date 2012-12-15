<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="ListadoMaterias.aspx.cs" Inherits="ListadoMaterias" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 23px; font-family: Arial">Listado de Materias
        <hr />
    </span>
    <rsweb:reportviewer id="ReportViewer1" runat="server" font-names="Verdana" font-size="8pt"
        height="400px" width="700px"> 
        <LocalReport ReportPath="reportes\ListadoMaterias.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_Materia" />
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="centroestudio_CentroEstudio" />
            </DataSources>
        </LocalReport>
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
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dsUniversidadTableAdapters.MateriaTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_materia" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="mat_cod" Type="String" />
            <asp:Parameter Name="materia_desc" Type="String" />
            <asp:Parameter Name="mat_credit" Type="Int32" />
            <asp:Parameter Name="mat_ht" Type="Int32" />
            <asp:Parameter Name="mat_hp" Type="Int32" />
            <asp:Parameter Name="Original_id_materia" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="mat_cod" Type="String" />
            <asp:Parameter Name="materia_desc" Type="String" />
            <asp:Parameter Name="mat_credit" Type="Int32" />
            <asp:Parameter Name="mat_ht" Type="Int32" />
            <asp:Parameter Name="mat_hp" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

