<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertSessionHorario.ascx.cs" Inherits="controles_insertSessionHorario" %>
<span style="font-size: 24px; font-family: Arial">SECCIONES - HORARIOS
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; font-family: Arial; width: 100%;">
    <tr>
        <td colspan="3" style="height: 29px; border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;">
            <strong><span style="font-size: 13px">1. Seleccione una de las secciones activas</span></strong></td>
    </tr>
    <tr>
        <td style="height: 29px; border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;">
            &nbsp;<asp:TextBox ID="txtSecciones" runat="server"></asp:TextBox>
            <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                OnClick="btnBuscar_Click1" /></td>
        <td style="height: 29px; border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;">
            <strong>2. Seleccione uno de los horarios para esta secci&oacute;n</strong></td>
        <td style="height: 29px; border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;">
            <strong><span>3. Seleccione un aula para esta secci&oacute;n en la hora seleccionada</span></strong></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid; height: 29px">
            <asp:GridView ID="gvSessiones" runat="server" AutoGenerateColumns="False" DataKeyNames="id_session" CellPadding="4" Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None" AllowPaging="True">
                <Columns>
                    <asp:CommandField SelectText="&gt;&gt;" ShowSelectButton="True" />
                    <asp:BoundField DataField="session_cod" HeaderText="Clave" SortExpression="session_cod" />
                    <asp:BoundField DataField="materia_desc" HeaderText="Asignatura" SortExpression="materia_desc" />
                    <asp:BoundField DataField="mat_credit" HeaderText="Cr&#233;ditos" SortExpression="mat_credit" />
                    <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjSeccAct" runat="server"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjSeccBusqueda" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDataByID_Session" TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSecciones" Name="session_cod" PropertyName="Text"
                        Type="String" DefaultValue="{0}" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </td>
        <td align="left" valign="top" style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid; height: 29px">
            <asp:GridView ID="gvHorario" runat="server" AutoGenerateColumns="False" DataKeyNames="id_dias"
                DataSourceID="objHorario" CellPadding="4" Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="15" Width="219px">
                <Columns>
                    <asp:CommandField SelectText="&gt;&gt;" ShowSelectButton="True" />
                    <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                    <asp:BoundField DataField="hora" HeaderText="Hora" SortExpression="hora" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="objHorario" runat="server"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.Dias_HorasTableAdapter">
            </asp:ObjectDataSource>
        </td>
        <td valign="top" align="left" style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid; height: 29px">
            <asp:GridView ID="gvAulas" runat="server" AutoGenerateColumns="False" DataKeyNames="id_aula"
                DataSourceID="objAulas" CellPadding="4" Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None" AllowPaging="True" Width="209px">
                <Columns>
                    <asp:CommandField SelectText="&gt;&gt;" ShowSelectButton="True" />
                    <asp:BoundField DataField="nombre" HeaderText="Aula" SortExpression="nombre" />
                    <asp:BoundField DataField="siglas" HeaderText="Recinto" SortExpression="siglas" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        <asp:ObjectDataSource ID="objAulas" runat="server"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.AulaRecintoTableAdapter">
            </asp:ObjectDataSource>
            <br />
            <br />
            &nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_agregar.jpg"
                OnClick="ImageButton1_Click" /><br />
            <br />
            </td>
    </tr>
    <tr>
        <td style="height: 24px" align="left">
            <strong><span style="font-size: 13px"></span></strong></td>
        <td align="left">
            </td>
            <td align="left">
            </td>
    </tr>
    <tr>
        <td align="right" colspan="3">
            &nbsp; &nbsp;
            <br />
            <asp:DataList ID="DataList1" runat="server" Font-Names="Arial" Font-Size="12px" OnDeleteCommand="DataList1_DeleteCommand">
                <ItemTemplate>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" style="width: 136px; height: 18px" valign="top">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("session") %>'></asp:Label></td>
                            <td align="left" style="width: 128px; height: 18px" valign="top">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("ciclo") %>'></asp:Label></td>
                            <td align="left" style="width: 128px; height: 18px" valign="top">
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("dia") %>'></asp:Label></td>
                            <td align="left" style="width: 160px; height: 18px" valign="top">
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("hora") %>'></asp:Label></td>
                            <td align="left" style="width: 160px; height: 18px" valign="top">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("aula") %>'></asp:Label></td>
                            <td align="left" style="width: 160px; height: 18px" valign="top">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("recinto") %>'></asp:Label></td>
                            <td style="height: 18px">
                                <asp:LinkButton ID="delete" runat="server" CommandName="Delete" Font-Bold="True"
                                    Font-Size="15px" ForeColor="Red" Text="  X"></asp:LinkButton></td>
                        </tr>
                    </table>
                </ItemTemplate>
                <HeaderTemplate>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" style="width: 136px; background-color: #990000" valign="top">
                                <strong><span style="color: #ffffff">Seccion</span></strong></td>
                            <td align="left" style="width: 128px; background-color: #990000" valign="top">
                                <strong><span style="color: #ffffff">Ciclo</span></strong></td>
                            <td align="left" style="width: 128px; background-color: #990000" valign="top">
                                <span style="color: #ffffff"><strong>Dia</strong></span></td>
                            <td align="left" style="width: 160px; background-color: #990000" valign="top">
                                <strong><span style="color: #ffffff">Hora</span></strong></td>
                            <td align="left" style="width: 160px; background-color: #990000" valign="top">
                                <strong><span style="color: #ffffff">Aula</span></strong></td>
                            <td align="left" style="width: 160px; background-color: #990000" valign="top">
                                <strong><span style="color: #ffffff">Recinto</span></strong></td>
                            <td style="background-color: #990000">
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
            </asp:DataList>
            <br />
            <asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_insertar.jpg"
                OnClick="btnGuardar_Click1" />&nbsp;
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
                OnClick="ImageButton2_Click" /><br />
        </td>
    </tr>
    <tr>
        <td align="center" colspan="3" rowspan="1" style="height: 24px">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
    </tr>
    <tr>
        <td align="right">
            </td>
        <td>
        </td>
        <td rowspan="1">
        </td>
    </tr>
</table>
