<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ListadoSecciones.aspx.cs" Inherits="ListadoSecciones"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" ID="scriptManager1"></asp:ScriptManager>
    <span style="font-family: Arial">
    <span style="font-size: 24px;">LISTADO DE SECCIONES
        <hr />
    </span><span style="font-size: 12px">Seleccione el recinto : </span></span>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource2"
        DataTextField="recinto_nombre" DataValueField="id_recinto" Width="233px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dsUniversidadTableAdapters.RecintoTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_recinto" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="recinto_nombre" Type="String" />
            <asp:Parameter Name="siglas" Type="String" />
            <asp:Parameter Name="rec_dir" Type="String" />
            <asp:Parameter Name="rec_tel" Type="String" />
            <asp:Parameter Name="Original_id_recinto" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="recinto_nombre" Type="String" />
            <asp:Parameter Name="siglas" Type="String" />
            <asp:Parameter Name="rec_dir" Type="String" />
            <asp:Parameter Name="rec_tel" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <span style="font-size: 12px; font-family: Arial">Haga clic en el boton REFRESH para
        actualizar el reporte<br />
    </span>
    <br />
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="400px" Width="700px" ZoomMode="FullPage">
        <LocalReport ReportPath="reportes\ListadoSecciones.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_Secciones_Activas" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByRecinto" TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="recinto" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

