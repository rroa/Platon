<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertCiclo.ascx.cs" Inherits="controles_insertCiclo" %>
<span style="font-size: 24px; font-family: Arial">CICLOS
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td style="width: 285px" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid;
                font-family: Arial">
                <tr>
                    <td colspan="2" style="padding-left: 5px; border-bottom: black 1px solid; height: 30px;
                        background-color: whitesmoke">
                        <strong>CREACION DE CICLOS</strong></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td style="height: 24px; text-align: center">
                        <strong>Nombre<br />
                        </strong>
                            <span style="font-size: 8pt; color: #ff0000;">Ej: 0000-0000/0</span></td>
                    <td style="height: 24px">
                        <asp:TextBox ID="txtnombreciclo" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>Fecha de Inicio</strong></td>
                    <td style="padding-left: 5px">
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" DayNameFormat="Shortest" Font-Names="Arial" Font-Size="12px"
                            ForeColor="#663399" Height="9px" Width="59px" BorderWidth="1px" ShowGridLines="True">
                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                            <SelectorStyle BackColor="#FFCC66" />
                            <OtherMonthDayStyle ForeColor="#CC9966" />
                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        </asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>Fecha Final</strong></td>
                    <td style="padding-left: 5px">
                        &nbsp;<asp:Calendar ID="Calendar2" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" DayNameFormat="Shortest" Font-Names="Arial" Font-Size="12px"
                            ForeColor="#663399" Height="17px" Width="53px" BorderWidth="1px" ShowGridLines="True">
                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                            <SelectorStyle BackColor="#FFCC66" />
                            <OtherMonthDayStyle ForeColor="#CC9966" />
                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        </asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td style="height: 30px">
                        Fecha límite de inscripción</td>
                    <td style="height: 30px">
                        <asp:TextBox ID="txtinscripcion" runat="server"></asp:TextBox><br />
                        <span style="font-size: 8pt; color: #ff0000">Ej. mm/dd/aaaa</span></td>
                </tr>
                <tr>
                    <td style="height: 30px">
                        Fecha de Recargos Primer Mes</td>
                    <td style="height: 30px">
                        <asp:TextBox ID="txtprimermes" runat="server"></asp:TextBox><br />
                        <span style="font-size: 8pt; color: #ff0000">Ej. mm/dd/aaaa</span></td>
                </tr>
                <tr>
                    <td style="height: 30px">
                        Fecha de Recargos Segundo Mes</td>
                    <td style="height: 30px">
                        <asp:TextBox ID="txtsegundomes" runat="server"></asp:TextBox><br />
                        <span style="font-size: 8pt; color: #ff0000">Ej. mm/dd/aaaa</span></td>
                </tr>
                <tr>
                    <td style="height: 30px">
                        Fecha de Recargos Tercer Mes</td>
                    <td style="height: 30px">
                        <asp:TextBox ID="txttercermes" runat="server"></asp:TextBox><br />
                        <span style="font-size: 8pt; color: #ff0000">Ej. mm/dd/aaaa</span></td>
                </tr>
                <tr>
                    <td style="height: 30px">
                        Fecha de Recargos Cuarto Mes</td>
                    <td style="height: 30px">
                        <asp:TextBox ID="txtcuartomes" runat="server"></asp:TextBox><br />
                        <span style="font-size: 8pt; color: #ff0000">Ej. mm/dd/aaaa</span></td>
                </tr>
                <tr>
                    <td style="height: 30px">
                        Fecha limite de Bajas y Añadidas</td>
                    <td style="height: 30px">
                        <asp:TextBox ID="txtbajasanadidas" runat="server"></asp:TextBox><br />
                        <span style="font-size: 8pt; color: #ff0000">Ej. mm/dd/aaaa</span></td>
                </tr>
                <tr>
                    <td style="height: 30px">
                        Fecha limite de Retiro</td>
                    <td style="height: 30px">
                        <asp:TextBox ID="txtretiro" runat="server"></asp:TextBox><br />
                        <span style="font-size: 8pt; color: #ff0000">Ej. mm/dd/aaaa</span></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 30px">
                        <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
                </tr>
                <tr>
                    <td style="height: 15px">
                    </td>
                    <td style="height: 15px">
                    </td>
                </tr>
                <tr>
                    <td style="border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;
                        height: 23px" colspan="2">
                        &nbsp;<asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                            OnClick="btnGuardar_Click1" />
                        &nbsp;
                        <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/images/botones/btn_cancelar.jpg"
                            OnClick="btnCancelar_Click1" /></td>
                </tr>
            </table>
        </td>
        <td style="width: 50px" valign="top">
        </td>
        <td valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid;
                font-family: Arial">
                <tr>
                    <td style="padding-left: 5px; border-bottom: black 1px solid; height: 30px; background-color: whitesmoke">
                        <strong>CICLOS</strong></td>
                </tr>
                <tr>
                    <td style="height: 15px">
                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 5px; padding-left: 5px;">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_ciclo" DataSourceID="objCiclos"
                            Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="id_ciclo" HeaderText="Id ciclo" InsertVisible="False"
                                    ReadOnly="True" SortExpression="id_ciclo" />
                                <asp:BoundField DataField="nombre" HeaderText="Ciclo" SortExpression="nombre" />
                                <asp:BoundField DataField="ano" HeaderText="A&#241;o" SortExpression="ano" />
                                <asp:TemplateField HeaderText="F. de inicio" SortExpression="f_inicio">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("f_inicio") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("f_inicio", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="F. final" SortExpression="f_fin">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("f_fin") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("f_fin", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="F. recargo" SortExpression="fecha_recargo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("fecha_recargo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("fecha_recargo", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="activo" HeaderText="Activo" SortExpression="activo" />
                            </Columns>
                            <RowStyle BackColor="#FFFBD6" HorizontalAlign="Left" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="objCiclos" runat="server" DeleteMethod="Delete"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetCicloByActivo" TypeName="dsUniversidadTableAdapters.CicloTableAdapter">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_id_ciclo" Type="Int32" />
                            </DeleteParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br />
<span style="font-size: 12px;"><span style="font-family: Arial"><strong>DESACTIVAR CICLOS Y SECCIONES
    EN ESTE</strong><br />
    <br />
    <strong>Nota:</strong><br />
    Al desactivar un ciclo ya pasado se desactivar&aacute;n las secciones dentro de &eacute;ste ciclo
    pero las deudas de los estudiantes seguir&aacute;n permaneciendo activas.<br />
    <br />
</span>
    <span style="color: #ff0000; font-family: Arial;">Advertencia, una vez desactivado el ciclo no hay vuelta
        atras.<br />
        <br />
        </span></span><span style="font-family: Arial"><span style="font-size: 12px"><strong>
        CICLOS ACTIVOS</strong><br />
    </span></span>
        
        <asp:GridView ID="GridView2" runat="server" CellPadding="4" Font-Names="Arial" Font-Size="12px"
            ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="objCiclos" DataKeyNames="nombre" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField SelectText="Desactivar" ShowSelectButton="True" />
                <asp:BoundField DataField="nombre" HeaderText="Ciclo" SortExpression="nombre" />
                <asp:TemplateField HeaderText="Fecha de inicio" SortExpression="f_inicio">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("f_inicio") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("f_inicio", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha de fin" SortExpression="f_fin">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("f_fin") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("f_fin", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
