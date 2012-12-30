<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="EstudiantesInactivos.aspx.cs" Inherits="EstudiantesInactivos" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" ID="scriptManager1"></asp:ScriptManager>
    <span style="font-size: 24px; font-family: Arial">ESTUDIANTES INACTIVOS
        <hr />
    </span>
    <br />
    Ciclo:
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsCiclo" DataTextField="nombre"
        DataValueField="nombre" Width="132px" OnDataBound="DropDownList1_DataBound" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList><asp:ObjectDataSource ID="odsCiclo" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCicloByActivo"
        TypeName="dsUniversidadTableAdapters.CicloTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_ciclo" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="ano" Type="Int32" />
            <asp:Parameter Name="f_inicio" Type="DateTime" />
            <asp:Parameter Name="f_fin" Type="DateTime" />
            <asp:Parameter Name="activo" Type="Boolean" />
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="fecha_recargo" Type="DateTime" />
            <asp:Parameter Name="recargoaplicado" Type="Boolean" />
            <asp:Parameter Name="Original_id_ciclo" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ano" Type="Int32" />
            <asp:Parameter Name="f_inicio" Type="DateTime" />
            <asp:Parameter Name="f_fin" Type="DateTime" />
            <asp:Parameter Name="activo" Type="Boolean" />
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="fecha_recargo" Type="DateTime" />
            <asp:Parameter Name="recargoaplicado" Type="Boolean" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <rsweb:reportviewer id="ReportViewer1" runat="server" font-names="Verdana" font-size="8pt"
        height="400px" width="100%">
<LocalReport ReportPath="reportes\estudiantesinactivos.rdlc"><DataSources>
    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_EstudiantesInactivos" />
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
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.EstudiantesInactivosTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="ciclo" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

