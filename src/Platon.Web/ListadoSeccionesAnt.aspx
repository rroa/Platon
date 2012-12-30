<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="ListadoSeccionesAnt.aspx.cs" Inherits="ListadoSeccionesAnt" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Arial"><span style="font-size: 18pt">LISTADO DE SECCIONES
        <hr />
    </span><span style="font-size: 12px">Seleccione el ciclo: </span></span>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource2"
        DataTextField="nombre" DataValueField="nombre" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.CicloTableAdapter"></asp:ObjectDataSource>
    <span style="font-size: 12px; font-family: Arial">Haga clic en el boton REFRESH para
        actualizar el reporte<br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
            Height="400px" Width="100%">
            <LocalReport ReportPath="reportes\ListadoSeccionesAnt.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_VistaSecciones" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByCiclo" TypeName="dsUniversidadTableAdapters.VistaSeccionesTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="ciclo" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </span>
</asp:Content>

