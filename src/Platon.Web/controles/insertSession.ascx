<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertSession.ascx.cs" Inherits="controles_insertSession" %>
<span style="font-size: 24px; font-family: Arial">SECCIONES DE CLASES
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0" style="height: 100%">
    <tr>
        <td align="center" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid;
                font-family: Arial">
                <tr>
                    <td align="left" colspan="2" style="padding-left: 5px; height: 25px" valign="middle">
                        Complete los datos para crear una nueva secci&oacute;n de clases</td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        <strong>
                        C&oacute;digo</strong></td>
                    <td align="left" style="padding-left: 5px">
                        <asp:TextBox ID="txtcodigo" runat="server" Font-Names="Arial" Font-Size="12px"
                            TabIndex="1" Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px; height: 19px">
                        <strong>
                        Ciclo</strong></td>
                    <td align="left" style="padding-left: 5px; height: 19px">
                        <asp:GridView ID="gvCiclo" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="nombre" DataSourceID="objCiclo" Font-Names="Arial" Font-Size="12px"
                            PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <Columns>
                                <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                                <asp:BoundField DataField="nombre" HeaderText="Ciclo" SortExpression="nombre" />
                                <asp:BoundField DataField="ano" HeaderText="A&#241;o" SortExpression="ano" />
                                <asp:TemplateField HeaderText="F. Inicio" SortExpression="f_inicio">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("f_inicio") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("f_inicio", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="F. Fin" SortExpression="f_fin">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("f_fin") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("f_fin", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="objCiclo" runat="server" DeleteMethod="Delete"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetCicloByActivo" TypeName="dsUniversidadTableAdapters.CicloTableAdapter" InsertMethod="Insert" UpdateMethod="Update">
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
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        <strong>
                        Materia</strong></td>
                    <td align="left" style="padding-left: 5px">
                        <asp:DropDownList ID="ddlMateria" runat="server" DataSourceID="objMateria" DataTextField="materia"
                            DataValueField="id_materia" Font-Names="Arial" Font-Size="12px" TabIndex="15"
                            Width="279px">
                        </asp:DropDownList><asp:ObjectDataSource ID="objMateria" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                            TypeName="dsUniversidadTableAdapters.viewMateriaTableAdapter" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_id_materia" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="mat_credit" Type="Int32" />
                                <asp:Parameter Name="Original_id_materia" Type="Int32" />
                            </UpdateParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        <span><strong>Profesor</strong></span></td>
                    <td align="left" style="padding-left: 5px; color: #ff0000">
                        <asp:DropDownList ID="ddlProfesor" runat="server" DataSourceID="objProfesor" DataTextField="profesor"
                            DataValueField="id_profesor" Font-Names="Arial" Font-Size="12px" TabIndex="15"
                            Width="251px">
                        </asp:DropDownList><asp:ObjectDataSource ID="objProfesor" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                            TypeName="dsUniversidadTableAdapters.ProfesorFullNameTableAdapter">
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        <strong>
                        Capacidad</strong></td>
                    <td align="left" style="padding-left: 5px">
                        <asp:TextBox ID="txtcapacidad" runat="server" Font-Names="Arial" Font-Size="12px"
                            TabIndex="6" Width="46px"></asp:TextBox>
                        <span style="font-size: 8pt; color: #ff0000">solo número</span></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        <strong>Horario</strong></td>
                    <td align="left" style="padding-left: 5px">
                        <asp:TextBox ID="txthorario" runat="server" Width="280px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        <strong>Fecha de Inicio</strong></td>
                    <td align="left" style="padding-left: 5px">
                        <asp:TextBox ID="txtfinicio" runat="server" Width="280px"></asp:TextBox><br />
                        <span style="font-size: 8pt; color: #ff0000">Ej: mm/dd/aaaa</span></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        <strong>Fecha Fin</strong></td>
                    <td align="left" style="padding-left: 5px">
                        <asp:TextBox ID="txtffin" runat="server" Width="280px"></asp:TextBox><br />
                        <span style="font-size: 8pt; color: #ff0000">Ej: mm/dd/aaaa</span></td>
                </tr>
                <tr>
                    <td align="left" style="padding-left: 5px">
                        <strong>Recinto</strong></td>
                    <td align="left" style="padding-left: 5px">
                        <asp:DropDownList ID="ddlRecintos" runat="server" DataSourceID="objectRecintos" DataTextField="recinto_nombre"
                            DataValueField="id_recinto" Width="259px">
                        </asp:DropDownList><asp:ObjectDataSource ID="objectRecintos" runat="server" DeleteMethod="Delete"
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
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="height: 25px" valign="top">
        </td>
    </tr>
    <tr>
        <td align="center" style="height: 25px" valign="top">
            <asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                OnClick="btnGuardar_Click" />
            &nbsp; &nbsp;&nbsp; 
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
                OnClick="ImageButton1_Click" />
            &nbsp; &nbsp;&nbsp; 
            <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/images/botones/btn_cancelar.jpg"
                OnClick="btnCancelar_Click" /></td>
    </tr>
    <tr>
        <td align="center" style="height: 25px" valign="top">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
    </tr>
    <tr>
        <td valign="top">
            <strong><span style="font-size: 10pt; font-family: Century Gothic">Secciones Activas<br />
            </span></strong>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="id_session" DataSourceID="objSeccionesActivas" Font-Names="Arial"
                Font-Size="12px" ForeColor="#333333" GridLines="None" AllowPaging="True">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="session_cod" HeaderText="Cod." SortExpression="session_cod" />
                    <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad" />
                    <asp:BoundField DataField="ciclo_ano" HeaderText="A&#241;o" SortExpression="ciclo_ano" />
                    <asp:TemplateField HeaderText="F. Inicio" SortExpression="ciclo_finicio">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ciclo_finicio") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ciclo_finicio", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="F. Fin" SortExpression="ciclo_ffin">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ciclo_ffin") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ciclo_ffin", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="materia" HeaderText="Materia" SortExpression="materia" />
                    <asp:BoundField DataField="profesor" HeaderText="Profesor" ReadOnly="True" SortExpression="profesor" />
                    <asp:BoundField DataField="siglas" HeaderText="Recinto" SortExpression="siglas" />
                </Columns>
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="objSeccionesActivas" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.Secciones_ActivasTableAdapter">
            </asp:ObjectDataSource>
        </td>
    </tr>
</table>
