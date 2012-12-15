<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="DesactSession.aspx.cs" Inherits="DesactUsuario"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 24px; font-family: Arial">DESACTIVAR &nbsp;SECCION
        <hr />
    </span>
    <br />
    <table>
        <tr>
            <td style="text-align: left">
                <span style="font-size: 12px; font-family: Arial">Escriba el c&oacute;digo de la secci&oacute;n&nbsp;
                </span>
                <asp:TextBox ID="txtSesion" runat="server" Width="139px"></asp:TextBox><asp:ImageButton
                    ID="btnBuscarUsuario" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                    OnClick="btnBuscarUsuario_Click" /></td>
        </tr>
        <tr>
            <td style="text-align: center">
                </td>
        </tr>
        <tr>
            <td>
                <span style="font-size: 12px; font-family: Arial">Escriba el nombre de la materia </span>
                <asp:TextBox ID="txtMateria" runat="server" Width="139px"></asp:TextBox><asp:ImageButton
                    ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg" OnClick="ImageButton1_Click" /></td>
        </tr>
        <tr>
            <td style="text-align: center" valign="top">
                <br />
                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="id_session" Font-Names="Arial" Font-Size="12px" ForeColor="#333333"
                    GridLines="None">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
                        <asp:BoundField DataField="session_cod" HeaderText="Seccion" SortExpression="session_cod" />
                        <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
                        <asp:BoundField DataField="mat_credit" HeaderText="Creditos" SortExpression="mat_credit" />
                        <asp:BoundField DataField="profesor" HeaderText="Profesor" ReadOnly="True" SortExpression="profesor" />
                        <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
                        <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad" />
                        <asp:BoundField DataField="Inscritos" HeaderText="Inscritos" SortExpression="Inscritos" />
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="text-align: right" align="right">
                <asp:Button ID="btnUsuariosDesactivar" runat="server" OnClick="btnUsuariosDesactivar_Click"
                    Text="DESACTIVAR" Font-Bold="True" Font-Names="Arial" Font-Size="14px" Height="37px" Width="110px" /></td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByID_Session"
        TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSesion" Name="session_cod" PropertyName="Text"
                Type="String" DefaultValue="{0}" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataBymateria" TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtMateria" Name="materia_desc" PropertyName="Text"
                Type="String" DefaultValue="{0}" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

