<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="estudiantesXEntrada.aspx.cs" Inherits="estudiantesXEntrada"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 12px; font-family: Arial"><span style="font-size: 24px">REPORTE
        DE ESTUDIANTES POR CICLO DE ENTRADA</span>
        <hr />
        <br />
        Escriba el a&ntilde;o que desea consultar<br />
        <br />
    </span>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    Ej.: 2008<span style="font-size: 12px; font-family: Arial"><br />
        <br />
        Seleccione el per&iacute;odo de entrada que desea consultar<br />
        <br />
    </span>
    <asp:GridView ID="gvPeriodo" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="id_periodo" DataSourceID="objPeriodo" Font-Names="Arial" Font-Size="12px"
        ForeColor="#333333" GridLines="None" Width="262px" OnSelectedIndexChanged="gvPeriodo_SelectedIndexChanged">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripci&#243;n" SortExpression="descripcion" />
        </Columns>
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="objPeriodo" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.PeriodoTableAdapter"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_periodo" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="numero" Type="Int32" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="mes_inicio" Type="Int32" />
            <asp:Parameter Name="mes_fin" Type="Int32" />
            <asp:Parameter Name="Original_id_periodo" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="numero" Type="Int32" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="mes_inicio" Type="Int32" />
            <asp:Parameter Name="mes_fin" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    &nbsp;<span style="font-size: 12px; font-family: Arial"><br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
            Height="400px" Width="700px" ZoomMode="FullPage">
            <LocalReport ReportPath="reportes\rptEstudiantesXentrada.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_Vista_Dt_Estudiante" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByPeriodoEntrada" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="{0}" Name="ano" PropertyName="Text"
                    Type="Int32" />
                <asp:ControlParameter ControlID="gvPeriodo" Name="periodo" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </span>
</asp:Content>

