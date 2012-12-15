<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="RecordNotasOficial.aspx.cs" Inherits="RecordNotas" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">RECORD DE NOTAS OFICIAL</span>
    <hr />
    <br />
    <span style="font-size: 12px; font-family: Arial">Escriba la matr&iacute;cula del estudiante
        para visualizar su record de notas<br />
    </span>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><span style="font-size: 12px;
        font-family: Arial"> </span>
    <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" /><br />
    <rsweb:ReportViewer ID="ReportViewer2" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="400px" Width="100%">
        <LocalReport ReportPath="Record_de_Notas_Oficial_Sub.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="dsUniversidad_View_RecordDeNotas" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.View_RecordDeNotasTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="matricula" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <span style="font-size: 12px; font-family: Arial">Haga clic en el bot&oacute;n de refrescar
        para actualizar el reporte<br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
            Height="400px" Width="100%">
            <LocalReport ReportPath="Record_de_Notas_Oficial.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_View_RecordDeNotas" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.View_RecordDeNotasTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="matricula" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp;&nbsp;
    </span>
</asp:Content>

