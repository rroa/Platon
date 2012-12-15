<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="formulario1.aspx.cs" Inherits="estudiantesenseccion" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align=center style="text-align: left">
    <span><span style="font-family: Arial"><span style="font-size: 24px">LISTADO
        DE ESTUDIANTES POR SECCION
        <hr />
    </span><span style="font-size: 12px"><strong>
        <br />
        Nota :</strong>
        <br />
    Seleccione una secci&oacute;n para ver los estudiantes. 
        <br />
        Luego haga clic en el bot&oacute;n de
    refrescar dentro del visualizador de reportes.</span></span></span><br />
    <br />
    <span style="font-size: 12px; font-family: Arial">Secci&oacute;n: </span>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><span style="font-size: 12px;
        font-family: Arial"> </span>
    <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" /><br />
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="id_session" Font-Names="Arial"
        Font-Size="12px" ForeColor="#333333" GridLines="None" Width="536px" DataSourceID="ObjectDataSource3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
            <asp:BoundField DataField="session_cod" HeaderText="Secci&#243;n" SortExpression="session_cod" />
            <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
            <asp:BoundField DataField="profesor" HeaderText="Profesor" ReadOnly="True" SortExpression="profesor" />
            <asp:BoundField DataField="horario" HeaderText="Horario" SortExpression="horario" />
        </Columns>
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByID_Session" TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="{0}" Name="session_cod"
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <strong>SEMANA 1</strong><br />
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="400px" Width="100%">
        <LocalReport ReportPath="reportes\NotasViejas\formulario1_1.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsHistorial_EstudianteSeccionAnt" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataBySession" TypeName="dsHistorialTableAdapters.EstudianteSeccionAntTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="session" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <strong>AULA VIRTUAL<br />
        <rsweb:ReportViewer ID="ReportViewer2" runat="server" Font-Names="Verdana" Font-Size="8pt"
            Height="400px" Width="100%">
            <LocalReport ReportPath="reportes\formulario1_AV.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="dsUniversidad_Estudiantes_en_sesion" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataBySession" TypeName="dsUniversidadTableAdapters.Estudiantes_en_sesionTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="session" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <br />
        FINAL<br />
        <rsweb:ReportViewer ID="ReportViewer3" runat="server" Font-Names="Verdana" Font-Size="8pt"
            Height="400px" Width="100%">
            <LocalReport ReportPath="reportes\formulario1_Final.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource4" Name="dsUniversidad_Estudiantes_en_sesion" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataBySession" TypeName="dsUniversidadTableAdapters.Estudiantes_en_sesionTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="session" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </strong>
    </div>
</asp:Content>

