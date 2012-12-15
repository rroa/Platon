<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BajasAnadidas.ascx.cs" Inherits="controles_BajasAnadidas" %>
<span style="font-size: 24px; font-family: Arial">BAJAS Y AÑADIDAS
    <hr />
</span>
<asp:Label ID="lblmensaje" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="14px"
    ForeColor="#FF0000"></asp:Label><br />
<table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; font-family: Arial">
    <tr>
        <td colspan="4" style="height: 30px; background-color: transparent">
            <strong><span style="font-size: 12pt"></span></strong></td>
        <td colspan="1" style="height: 30px; background-color: transparent">
        </td>
        <td colspan="1" style="height: 30px; background-color: transparent; width: 35px;">
            <span style="color: whitesmoke">.........</span></td>
        <td align="center" colspan="1" style="width: 418px; height: 30px; background-color: whitesmoke">
            <strong><span style="font-size: 14px; font-family: Arial">Materias seleccionadas por el estudiante</span></strong></td>
    </tr>
    <tr>
        <td colspan="5" rowspan="4" valign="top">
            <strong><span style="font-size: 12px; font-family: Arial">SELECCIONE EL CRITERIO DE
                BUSQUEDA DEL ESTUDIANTE:</span></strong>&nbsp;<br />
            <br />
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td valign="top">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Names="Arial" Font-Size="12px" RepeatColumns="2">
                <asp:ListItem Selected="True">Matr&#237;cula</asp:ListItem>
                <asp:ListItem>Apellido</asp:ListItem>
            </asp:RadioButtonList></td>
                    <td valign="top">
            <asp:TextBox ID="txtbuscar" runat="server" Font-Names="Arial" Font-Size="12px"></asp:TextBox></td>
                    <td valign="top">
            <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                OnClick="btnBuscar_Click1" /></td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gvBuscar" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="cod_stu" DataSourceID="objBuscar_Matri"
                Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvBuscar_SelectedIndexChanged" >
                <Columns>
                    <asp:CommandField CancelText="Cancelar" EditText="Editar" SelectText="Seleccionar"
                        ShowSelectButton="True" UpdateText="Actualizar" />
                    <asp:BoundField DataField="cod_stu" HeaderText="C&#243;digo" InsertVisible="False"
                        ReadOnly="True" SortExpression="cod_stu" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="matricula" HeaderText="Matr&#237;cula" SortExpression="matricula" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="objBuscar_Matri" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Estudiantes_ForSearchTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtbuscar" DefaultValue="{0}" Name="matricula" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="objBuscar_Apell" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDataByApellido" TypeName="dsUniversidadTableAdapters.Estudiantes_ForSearchTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtbuscar" DefaultValue="{0}" Name="apellido" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
            <strong>Seleccione el periodo para agregar materias<br />
                <asp:DropDownList ID="ddlciclo" runat="server" DataSourceID="odsCiclo" DataTextField="nombre"
                    DataValueField="nombre" AutoPostBack="True">
                </asp:DropDownList><asp:ObjectDataSource ID="odsCiclo" runat="server" DeleteMethod="Delete"
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCicloByActivo"
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
            </strong>
        </td>
        <td rowspan="2" style="width: 35px; height: 192px;">
        </td>
        <td align="center" rowspan="2" style="width: 418px; height: 192px;" valign="top">
            <asp:Label ID="lblMatricula" runat="server" Font-Bold="True" Font-Size="13pt" Font-Names="Arial"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="id_session_stud" DataSourceID="ObjectDataSource2" Font-Names="Arial"
                Font-Size="12px" ForeColor="#333333" GridLines="None" Height="124px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnDataBound="GridView1_DataBound">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" SelectImageUrl="~/images/arrow1_s.gif" ShowSelectButton="True" SelectText="Dar Baja" />
                    <asp:BoundField DataField="session_materia" HeaderText="Id. Materia" SortExpression="session_materia" />
                    <asp:BoundField DataField="mat_cod" HeaderText="Materia" SortExpression="mat_cod" />
                    <asp:BoundField DataField="mat_credit" HeaderText="Creditos" SortExpression="mat_credit" />
                    <asp:BoundField DataField="session_cod" HeaderText="Seccion" SortExpression="session_cod" />
                    <asp:BoundField DataField="profesor" HeaderText="Profesor" ReadOnly="True" SortExpression="profesor" />
                    <asp:TemplateField HeaderText="Fecha de Inscripci&#243;n" SortExpression="f_inscripcion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("f_inscripcion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("f_inscripcion", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="session_id" HeaderText="Cod. de secci&#243;n" SortExpression="session_id" />
                    <asp:BoundField DataField="horario" HeaderText="Horario" SortExpression="horario" />
                </Columns>
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.SessiondeEstudianteTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblMatricula" DefaultValue="{0}" Name="matricula"
                        PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
    <tr>
    </tr>
    <tr>
        <td style="width: 35px; height: 18px">
        </td>
        <td align="center" rowspan="1" style="width: 418px; height: 18px; background-color: whitesmoke;" valign="top">
            <span style="font-family: Arial"><span style="font-size: 14px">
            <strong>Materias disponibles
                para añadir</strong><br />
            </span></span>
        </td>
    </tr>
    <tr>
        <td style="width: 35px; height: 18px">
        </td>
        <td align="center" rowspan="1" style="width: 418px; height: 18px;" valign="top">
            <strong>
                <br />
            <asp:TextBox ID="txtBusquedaSesion" runat="server"></asp:TextBox>&nbsp;<asp:ImageButton
                ID="btnBuscarSeccion" runat="server" ImageUrl="~/images/botones/btn_buscarseccion.jpg" OnClick="btnBuscarSeccion_Click"
                />&nbsp;<asp:ImageButton ID="ImageButton1" runat="server"
                    ImageUrl="~/images/botones/btn_vertodo.jpg" OnClick="ImageButton1_Click" /><br />
            <br />
            <asp:GridView ID="gvSessiones" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="id_session" Font-Names="Arial" Font-Size="12px" ForeColor="#333333"
                GridLines="None" OnSelectedIndexChanged="gvSessiones_SelectedIndexChanged">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/add.gif" SelectText="Seleccionar"
                        ShowSelectButton="True" />
                    <asp:BoundField DataField="session_cod" HeaderText="Seccion" SortExpression="session_cod" />
                    <asp:BoundField DataField="session_materia" HeaderText="Id. Mat." SortExpression="session_materia" />
                    <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
                    <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
                    <asp:BoundField DataField="Inscritos" HeaderText="Inscritos" SortExpression="Inscritos" />
                    <asp:BoundField DataField="horario" HeaderText="Horario" SortExpression="horario" />
                </Columns>
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="objSecc_Act" runat="server"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByCiclo"
                TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlciclo" Name="ciclo" PropertyName="SelectedValue"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="objBusquedaSession" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySeccionCiclo"
                TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtBusquedaSesion" Name="session_cod" PropertyName="Text"
                        Type="String" DefaultValue="{0}" />
                    <asp:ControlParameter ControlID="ddlciclo" DefaultValue="" Name="ciclo" PropertyName="SelectedValue"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            </strong></td>
    </tr>
    <tr>
        <td align="center" colspan="7" rowspan="1" valign="top">
            &nbsp; &nbsp;&nbsp;
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Size="15px" Font-Names="Arial"></asp:Label><br />
        </td>
    </tr>
    <tr>
        <td align="center" colspan="7" style="height: 24px">
            Haga clic en la impresora para imprimir la hoja de inscripci&oacute;n<asp:ImageButton ID="ImageButton2"
                runat="server" ImageUrl="~/images/print.jpg" OnClick="ImageButton2_Click" /></td>
    </tr>
</table>
