<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="estudiantesXcarreraActivos.aspx.cs" Inherits="estudiantesXcarrera" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 18pt; font-family: Arial">ESTUDIANTES POR CARRERA
        <hr />
    </span><span style="font-size: 12px"><span style="font-size: 15px"><span style="font-family: Arial">
        Seleccione la carrera:
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="objcarrera" DataTextField="carrera_nombre"
            DataValueField="carrera_nombre" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList><asp:ObjectDataSource ID="objcarrera" runat="server" DeleteMethod="Delete"
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
        <br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
            Height="400px" Width="660px" ZoomMode="PageWidth">
            <LocalReport ReportPath="reportes\rptEstudianteXcarreraActivos.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_view_EstudiantesActivos" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByCarrera" TypeName="dsUniversidadTableAdapters.view_EstudiantesActivosTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="carrera" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        &nbsp;
    </span>
    </span></span>
</asp:Content>

