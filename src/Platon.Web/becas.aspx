<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="becas.aspx.cs" Inherits="becas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">BECAS
        <hr />
    </span>
    <asp:Panel ID="pBuscar" runat="server" DefaultButton="btnBuscar">
        <table>
            <tr>
                <td valign="middle">
                    Matrícula</td>
                <td>
                    <asp:TextBox ID="txtbuscar" runat="server" Font-Names="Arial" Font-Size="12px"></asp:TextBox></td>
                <td>
                    <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                        OnClick="btnBuscar_Click1" /></td>
            </tr>
        </table>
    </asp:Panel>
    <asp:DetailsView ID="dvBuscar" runat="server" AutoGenerateRows="False" CellPadding="4"
        DataKeyNames="cod_stu" DataSourceID="objBuscar_Matri" Font-Names="Arial" Font-Size="13px"
        ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <EmptyDataRowStyle ForeColor="Red" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="matricula" HeaderText="Matr&#237;cula" SortExpression="matricula" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
            <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
            <asp:BoundField DataField="cod_stu" HeaderText="C&#243;digo" InsertVisible="False"
                ReadOnly="True" SortExpression="cod_stu" />
            <asp:BoundField DataField="id_recinto" HeaderText="Recinto Id." SortExpression="id_recinto" />
            <asp:BoundField DataField="carrera_nombre" HeaderText="Carrera" SortExpression="carrera_nombre" />
        </Fields>
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
    <asp:ObjectDataSource ID="objBuscar_Matri" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Estudiantes_ForSearchTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtbuscar" DefaultValue="{0}" Name="matricula" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="lblEstudianteNo" runat="server" Font-Bold="True" Font-Names="Arial"
        Font-Size="14px" ForeColor="Red" Text="EL ESTUDIANTE NO HA SIDO ENCONTRADO" Visible="False"></asp:Label><br />
    <br />
    <table border="0" cellpadding="0" cellspacing="0" style="font-size: 13px; font-family: Arial">
        <tr>
            <td style="height: 19px">
                Porciento en la inscripción&nbsp;</td>
            <td style="height: 19px">
                <asp:TextBox ID="txtinscripcion" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="height: 19px">
                Porciento en los créditos</td>
            <td style="height: 19px">
                <asp:TextBox ID="txtcreditos" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                Porciento en los servicios</td>
            <td>
                <asp:TextBox ID="txtservicios" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                Fecha de emisión</td>
            <td>
                <asp:TextBox ID="txtfecha" runat="server"></asp:TextBox><br />
                <span style="font-size: 8pt; color: #ff0000"><strong>Ej: mm/dd/aaaa</strong></span></td>
        </tr>
        <tr>
            <td>
                Otorgada por:</td>
            <td>
                <asp:TextBox ID="txtpatrocinador" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="height: 15px">
            </td>
            <td style="height: 15px">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" />&nbsp;
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Nuevo" /></td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblmsg" runat="server"></asp:Label><br />
    <br />
    <asp:Button ID="btnDesactivar" runat="server" OnClick="btnDesactivar_Click" Text="Desactivar beca" /><br />
</asp:Content>

