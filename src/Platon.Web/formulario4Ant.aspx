<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="formulario4Ant.aspx.cs" Inherits="estudiantesenseccion" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

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
    <span style="font-size: 12px; font-family: Arial">Seleccione el ciclo:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource2"
            DataTextField="nombre" DataValueField="nombre">
        </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.CicloTableAdapter"></asp:ObjectDataSource>
        <br />
        <span style="font-size: 13px; font-family: Arial">Código de la sección: </span>
        <asp:TextBox ID="txtcodigo" runat="server"></asp:TextBox><span style="font-size: 13px;
            font-family: Arial">&nbsp;</span><asp:Button ID="Button1" runat="server" Text="Buscar" /><br />
        <br />
        <asp:GridView ID="gvSecciones" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="id_session" DataSourceID="odsSeccion" Font-Names="Arial" Font-Size="13px"
            ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvSecciones_SelectedIndexChanged">
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />
            <Columns>
                <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                <asp:BoundField DataField="session_cod" HeaderText="Secci&#243;n" SortExpression="session_cod" />
                <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
                <asp:BoundField DataField="ciclo_ano" HeaderText="A&#241;o" SortExpression="ciclo_ano" />
                <asp:BoundField DataField="materia" HeaderText="Asignatura" SortExpression="materia" />
                <asp:BoundField DataField="materia_desc" HeaderText="Asignatura" SortExpression="materia_desc" />
                <asp:BoundField DataField="mat_credit" HeaderText="Cr." SortExpression="mat_credit" />
                <asp:BoundField DataField="profesor" HeaderText="Profesor" ReadOnly="True" SortExpression="profesor" />
                <asp:BoundField DataField="horario" HeaderText="Horario" SortExpression="horario" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="odsSeccion" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByCodigoCiclo" TypeName="dsUniversidadTableAdapters.VistaSeccionesTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="ciclo" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="txtcodigo" DefaultValue="{0}" Name="codigo" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </span>
    <br />
    <br />    
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="400px" Width="100%">
        <LocalReport ReportPath="reportes\NotasViejas\formulario4_Final.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource7" Name="dsHistorial_EstudianteSeccionAnt" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataBySession" TypeName="dsHistorialTableAdapters.EstudianteSeccionAntTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvSecciones" Name="session" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </div>
</asp:Content>

