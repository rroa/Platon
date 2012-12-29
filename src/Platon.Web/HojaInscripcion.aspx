<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="HojaInscripcion.aspx.cs" Inherits="HojaInscripcion"  %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" ID="scriptManager1"></asp:ScriptManager>
    <span style="font-size: 24px; font-family: Arial">IMPRESION DE HOJA DE INSCRIPCION
        <hr />
        <span style="font-size: 12px">Escriba la matr&iacute;cula del estudiante y el ciclo
            de inscripci&oacute;n para imprimir su hoja
            de selecci&oacute;n de materias.<br />
            <br />
            <asp:TextBox ID="txtmatricula" runat="server"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" /><br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="objCiclo"
                DataTextField="nombre" DataValueField="nombre" Width="155px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList><br />
            <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>
            <asp:ObjectDataSource ID="objCiclo" runat="server" DeleteMethod="Delete"
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByActivoSinRecargo"
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
            &nbsp;<br />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
                Height="400px" Width="779px" ZoomMode="PageWidth" ShowParameterPrompts="False">
                <LocalReport ReportPath="HojaSeleccion.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsUniversidad_Vista_total_a_pagarXsemestre" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="dsUniversidad_Vista_Dt_Estudiante" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="dsUniversidad_SessiondeEstudiante" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource4" Name="centroestudio_CentroEstudio" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource5" Name="dsUniversidad_Ciclo" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource6" Name="dsUniversidad_tblUsrData" />
                    </DataSources>
                </LocalReport>
                <ServerReport ReportPath="/rptUNIREMHOS/rptHojaInscripcion" />
            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" DeleteMethod="Delete"
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByNombre"
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
                    <asp:Parameter Name="recargo_2" Type="DateTime" />
                    <asp:Parameter Name="recargo_3" Type="DateTime" />
                    <asp:Parameter Name="recargo_4" Type="DateTime" />
                    <asp:Parameter Name="fecha_bajasanadidas" Type="DateTime" />
                    <asp:Parameter Name="fecha_retiro" Type="DateTime" />
                    <asp:Parameter Name="fecha_inscripcion" Type="DateTime" />
                    <asp:Parameter Name="Original_id_ciclo" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="nombre" PropertyName="SelectedValue"
                        Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="ano" Type="Int32" />
                    <asp:Parameter Name="f_inicio" Type="DateTime" />
                    <asp:Parameter Name="f_fin" Type="DateTime" />
                    <asp:Parameter Name="activo" Type="Boolean" />
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="fecha_recargo" Type="DateTime" />
                    <asp:Parameter Name="recargoaplicado" Type="Boolean" />
                    <asp:Parameter Name="recargo_2" Type="DateTime" />
                    <asp:Parameter Name="recargo_3" Type="DateTime" />
                    <asp:Parameter Name="recargo_4" Type="DateTime" />
                    <asp:Parameter Name="fecha_bajasanadidas" Type="DateTime" />
                    <asp:Parameter Name="fecha_retiro" Type="DateTime" />
                    <asp:Parameter Name="fecha_inscripcion" Type="DateTime" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" DeleteMethod="Delete"
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
            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.SessiondeEstudianteTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
                        PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
                        PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDataByMatriculaCiclo" TypeName="dsUniversidadTableAdapters.Vista_total_a_pagarXsemestreTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtmatricula" DefaultValue="{0}" Name="matricula"
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="ciclo" PropertyName="SelectedValue"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource><asp:ObjectDataSource ID="ObjectDataSource6" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDataByIdUser" TypeName="dsUniversidadTableAdapters.tblUsrDataTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_usr_data" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter Name="usr_name" Type="String" />
                    <asp:Parameter Name="pass_wd" Type="String" />
                    <asp:Parameter Name="scrt_qst" Type="String" />
                    <asp:Parameter Name="scrt_ans" Type="String" />
                    <asp:Parameter Name="Original_id_usr_data" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="usuario" SessionField="idUsuario" Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter Name="usr_name" Type="String" />
                    <asp:Parameter Name="pass_wd" Type="String" />
                    <asp:Parameter Name="scrt_qst" Type="String" />
                    <asp:Parameter Name="scrt_ans" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </span></span>
</asp:Content>

