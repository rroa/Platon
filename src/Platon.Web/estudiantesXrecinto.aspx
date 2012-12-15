<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="estudiantesXrecinto.aspx.cs" Inherits="estudiantesXrecinto"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">ESTUDIANTES POR RECINTO
        <hr />
        <span style="font-size: 12px"><span style="font-size: 15px">Recintos:<br />
            <span style="font-size: 12px">Seleccione el recinto que desea consultar y presione el
                boton de refrescar en el reporte.</span></span><br />
        </span>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="id_recinto" DataSourceID="objRecintos" Font-Names="Arial" Font-Size="12px"
            ForeColor="#333333" GridLines="None" Width="480px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                <asp:BoundField DataField="recinto_nombre" HeaderText="Recinto" SortExpression="recinto_nombre" />
                <asp:BoundField DataField="siglas" HeaderText="Siglas" SortExpression="siglas" />
            </Columns>
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="objRecintos" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.RecintoTableAdapter"
            UpdateMethod="Update">
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
        <br />
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
            Height="400px" Width="700px" ZoomMode="FullPage">
            <LocalReport ReportPath="reportes\rptEstudiantexRecinto.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="objRecintos" Name="dsUniversidad_Recinto" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_Vista_Dt_Estudiante" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByRecinto" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id_recinto" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </span>
</asp:Content>

