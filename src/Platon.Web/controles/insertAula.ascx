<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertAula.ascx.cs" Inherits="controles_insertAula" %>
<span style="font-size: 24px; font-family: Arial">AULAS
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
                        <strong><span style="font-size: 12px; font-family: Arial">NUEVAS AULAS</span></strong></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong><span style="font-size: 12px; font-family: Arial">Nombre</span></strong></td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtnombre" runat="server" Font-Names="Arial" Font-Size="12px"
                            Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong><span style="font-size: 12px; font-family: Arial">Recinto</span></strong></td>
                    <td style="padding-left: 5px">
                        <asp:DropDownList ID="ddlRecinto" runat="server" DataSourceID="objRecintos" DataTextField="siglas"
                            DataValueField="id_recinto" Font-Names="Arial" Font-Size="12px" Width="200px" OnDataBound="ddlRecinto_DataBound">
                        </asp:DropDownList><asp:ObjectDataSource ID="objRecintos" runat="server" DeleteMethod="Delete"
                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                            TypeName="dsUniversidadTableAdapters.RecintoTableAdapter" UpdateMethod="Update">
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
                    </td>
                </tr>
                <tr>
                    <td style="height: 30px">
                        Capacidad</td>
                    <td style="height: 30px">
                        <asp:TextBox ID="txtcapacidad" runat="server" Width="66px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 30px">
                        <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="12px"></asp:Label></td>
                </tr>
                <tr>
                    <td style="height: 15px">
                    </td>
                    <td style="height: 15px">
                    </td>
                </tr>
                <tr>
                    <td style="border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;
                        height: 23px">
                    </td>
                    <td style="border-right: black 1px solid; border-top: black 1px solid; border-bottom: black 1px solid;
                        height: 23px">
                        <asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                            OnClick="ImageButton1_Click" />
                        &nbsp;
                        <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/images/botones/btn_cancelar.jpg"
                            OnClick="ImageButton2_Click" />
                    </td>
                </tr>
            </table>
        </td>
        <td style="width: 50px" valign="bottom">
            <asp:TextBox ID="txtModid_aula" runat="server" BackColor="Transparent" Enabled="False"
                ForeColor="Transparent" ReadOnly="True" Visible="False" Width="1px"></asp:TextBox></td>
        <td valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid;
                font-family: Arial">
                <tr>
                    <td style="padding-left: 5px; border-bottom: black 1px solid; height: 30px; background-color: whitesmoke" colspan="2">
                        <strong><span style="font-size: 12px; font-family: Arial">AULAS DISPONIBLES</span></strong></td>
                </tr>
                <tr>
                    <td style="height: 15px" colspan="2">
                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 5px; padding-left: 5px; height: 13px" colspan="2">
                        <br />
                        Recintos:
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="objRecintos"
                            DataTextField="recinto_nombre" DataValueField="id_recinto" Width="242px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" DataKeyNames="id_aula" DataSourceID="objAulas" Font-Names="Arial"
                            Font-Size="12px" ForeColor="#333333" GridLines="None" Width="301px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                                <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                                <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad" />
                            </Columns>
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="objAulas" runat="server" DeleteMethod="Delete"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByRecinto" TypeName="dsUniversidadTableAdapters.AulaTableAdapter">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_id_aula" Type="Int32" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="recinto" PropertyName="SelectedValue"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-right: 5px; padding-left: 5px; height: 26px; background-color: whitesmoke">
                        <strong><span style="font-size: 12px; font-family: Arial">Modificar Aulas</span></strong></td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-right: 5px; padding-left: 5px; height: 12px; background-color: white">
                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 5px; padding-left: 5px; width: 57px; height: 13px;"
                        valign="middle" align="left">
                        <span style="font-family: Arial"><span style="font-size: 12px">
                        <strong>Nombre</strong></span></span></td>
                    <td style="padding-right: 5px; padding-left: 5px; height: 13px; width: 207px;">
                        <asp:TextBox ID="txtModNombre" runat="server" Width="191px" Font-Names="Arial"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="padding-right: 5px; padding-left: 5px; width: 57px; height: 13px; text-align: left" align="left">
                        <strong><span style="font-size: 12px; font-family: Arial">Recinto</span></strong></td>
                    <td style="padding-right: 5px; padding-left: 5px; height: 13px; width: 207px;">
                        <asp:DropDownList ID="ddlModRecinto" runat="server" DataSourceID="ObjModRecinto"
                            DataTextField="recinto_nombre" DataValueField="id_recinto" Width="191px" Font-Names="Arial">
                        </asp:DropDownList><asp:ObjectDataSource ID="ObjModRecinto" runat="server" DeleteMethod="Delete"
                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                            TypeName="dsUniversidadTableAdapters.RecintoTableAdapter" UpdateMethod="Update">
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
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-right: 5px; padding-left: 5px; width: 57px; height: 13px">
                        <strong>Capacidad</strong></td>
                    <td style="padding-right: 5px; padding-left: 5px; width: 207px; height: 13px">
                        <asp:TextBox ID="txtcapacidadre" runat="server" Font-Names="Arial" Width="77px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left" style="padding-right: 5px; padding-left: 5px; width: 57px; height: 13px;
                        text-align: center">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                            OnClick="ImageButton1_Click1" /></td>
                    <td style="padding-right: 5px; padding-left: 5px; height: 13px; width: 207px;">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
