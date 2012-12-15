<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertPensum.ascx.cs" Inherits="controles_insertPensum" %>
<span style="font-size: 24px; font-family: Arial">MANTENIMIENTO DE PENSUM
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0" style="padding-left: 5px; font-size: 12px; font-family: Arial">
    <tr>
        <td colspan="5" style="border-bottom: black 1px solid; background-color: whitesmoke">
            <strong><span style="font-size: 10pt">1. Seleccione la carrera
                universitaria</span></strong>&nbsp;<asp:DropDownList ID="ddlcarrera" runat="server" DataSourceID="ObjectCarrera" DataTextField="carrera_nombre"
                DataValueField="id_carrera" Width="531px" Font-Names="Arial" Font-Size="13px" AutoPostBack="True" OnSelectedIndexChanged="ddlcarrera_SelectedIndexChanged">
            </asp:DropDownList><asp:ObjectDataSource ID="ObjectCarrera" runat="server" DeleteMethod="Delete"
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                TypeName="dsUniversidadTableAdapters.CarreraTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_carrera" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="carrera_nombre" Type="String" />
                    <asp:Parameter Name="carrera_cant_credito" Type="Int32" />
                    <asp:Parameter Name="Original_id_carrera" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="carrera_nombre" Type="String" />
                    <asp:Parameter Name="carrera_cant_credito" Type="Int32" />
                </InsertParameters>
            </asp:ObjectDataSource>
            .</td>
    </tr>
    <tr>
        <td align="center" colspan="5" style="border-bottom: black 1px solid">
            <strong><span style="font-size: 10pt">Pensum de la carrera</span></strong><br />
            <asp:GridView ID="gvNoPensum" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="no_pensum" DataSourceID="objNoPensum" Font-Names="Arial" Font-Size="12px"
                ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                    <asp:BoundField DataField="no_pensum" HeaderText="N&#250;mero de pensum" SortExpression="no_pensum" />
                </Columns>
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
                <EmptyDataRowStyle BorderColor="Transparent" ForeColor="Red" />
            </asp:GridView>
            <br />
            &nbsp;<asp:CheckBox ID="chkNuevo" runat="server" Text="Nuevo pensum" />
            <asp:ObjectDataSource ID="objNoPensum" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetPensumByIdPensum"
                TypeName="dsUniversidadTableAdapters.PensumTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_pensum" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_carrera" Type="Int32" />
                    <asp:Parameter Name="id_materia" Type="Int32" />
                    <asp:Parameter Name="prereq" Type="Int32" />
                    <asp:Parameter Name="semestre" Type="Int32" />
                    <asp:Parameter Name="no_pensum" Type="Int32" />
                    <asp:Parameter Name="Original_id_pensum" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlcarrera" Name="id_carrera" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_carrera" Type="Int32" />
                    <asp:Parameter Name="id_materia" Type="Int32" />
                    <asp:Parameter Name="prereq" Type="Int32" />
                    <asp:Parameter Name="semestre" Type="Int32" />
                    <asp:Parameter Name="no_pensum" Type="Int32" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="3" style="border-bottom: black 1px solid; height: 59px;
            background-color: whitesmoke" valign="middle">
            <strong><span style="font-size: 10pt">2. Seleccione el semestre de la carrera en el
                que va a agregar materias</span></strong>&nbsp;</td>
        <td style="border-bottom: black 1px solid; height: 59px; background-color: whitesmoke" align="left" valign="middle">
            <asp:DropDownList ID="ddlsemestre" runat="server" DataSourceID="ObjectSemestre" DataTextField="descripcion"
                DataValueField="id_sem" Width="155px" Font-Names="Arial" Font-Size="12px">
            </asp:DropDownList><asp:ObjectDataSource ID="ObjectSemestre" runat="server" DeleteMethod="Delete"
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                TypeName="dsUniversidadTableAdapters.SemestreTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_sem" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="Original_id_sem" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </td>
        <td style="border-bottom: black 1px solid; height: 59px; background-color: whitesmoke" align="left" valign="middle">
            .</td>
    </tr>
    <tr>
        <td align="left" colspan="2" style="height: 20px; background-color: whitesmoke; text-align: left">
            <strong><span style="font-size: 10pt">3. Seleccione la materia a ser agregada en el
                pensum</span></strong></td>
        <td style="width: 30px; height: 20px; background-color: whitesmoke;">
        </td>
        <td align="left" colspan="2" style="height: 20px; background-color: whitesmoke">
            <span style="font-size: 10pt"><strong>4. Seleccione el prerequisito de la materia seleccionada
                en el paso anterior</strong></span></td>
    </tr>
    <tr>
        <td style="height: 15px">
        </td>
        <td style="height: 15px; width: 210px;">
        </td>
        <td style="width: 30px; height: 15px">
        </td>
        <td style="height: 15px">
        </td>
        <td style="height: 15px">
        </td>
    </tr>
    <tr>
        <td style="height: 44px" align="left" valign="top">
            <asp:TextBox ID="txtBuscar" runat="server"></asp:TextBox></td>
        <td style="height: 44px" align="left" valign="top">
            <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                OnClick="btnBuscar_Click1" />&nbsp;<asp:ImageButton ID="btnVer" runat="server" ImageUrl="~/images/botones/btn_vertodo.jpg"
                    OnClick="btnVer_Click1" />
        </td>
        <td style="width: 30px; height: 44px">
        </td>
        <td style="height: 44px" align="left" valign="top">
            <asp:TextBox ID="txtBuscarPre" runat="server" Width="155px"></asp:TextBox></td>
        <td style="height: 44px" align="left" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                <tr>
                    <td align="left" valign="top">
            <asp:ImageButton ID="btnBuscarPre" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                OnClick="btnBuscarPre_Click1" Width="100px" /></td>
                    <td align="left" valign="top">
            <asp:ImageButton ID="btnVerPre" runat="server"
                    ImageUrl="~/images/botones/btn_vertodo.jpg" OnClick="btnVerPre_Click1" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2" valign="top">
            <asp:GridView ID="gvMateria" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="id_materia" CellPadding="4" Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None" Width="355px" DataSourceID="objBuscar">
                <Columns>
                    <asp:CommandField SelectText="&gt;&gt;" ShowSelectButton="True" />
                    <asp:BoundField DataField="mat_cod" HeaderText="Codigo" SortExpression="mat_cod" />
                    <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
                    <asp:BoundField DataField="mat_credit" HeaderText="Creditos" SortExpression="mat_credit" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectMateria" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.MateriaTableAdapter"
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_materia" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="mat_cod" Type="String" />
                    <asp:Parameter Name="materia_desc" Type="String" />
                    <asp:Parameter Name="mat_credit" Type="Int32" />
                    <asp:Parameter Name="Original_id_materia" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="mat_cod" Type="String" />
                    <asp:Parameter Name="materia_desc" Type="String" />
                    <asp:Parameter Name="mat_credit" Type="Int32" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="objBuscar" runat="server" DeleteMethod="Delete"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByCod_Mat"
                TypeName="dsUniversidadTableAdapters.MateriaTableAdapter">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_materia" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtBuscar" Name="mat_cod" PropertyName="Text" Type="String" DefaultValue="{0}" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="objBuscarPre" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByCod_Mat"
                TypeName="dsUniversidadTableAdapters.MateriaTableAdapter">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_materia" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtBuscarPre" Name="mat_cod" PropertyName="Text"
                        Type="String" DefaultValue="{0}" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
        </td>
        <td colspan="1" style="width: 30px">
        </td>
        <td colspan="2" valign="top">
            <asp:GridView ID="gvPrereq" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="id_materia" CellPadding="4" Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None" DataSourceID="objBuscarPre" Width="357px">
                <Columns>
                    <asp:CommandField SelectText="&gt;&gt;" ShowSelectButton="True" />
                    <asp:BoundField DataField="mat_cod" HeaderText="Codigo" SortExpression="mat_cod" />
                    <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
                    <asp:BoundField DataField="mat_credit" HeaderText="Credito" SortExpression="mat_credit" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td style="height: 24px">
            </td>
        <td style="height: 24px">
            &nbsp;
        </td>
        <td style="width: 30px; height: 24px">
        </td>
        <td style="height: 24px">
        </td>
        <td style="height: 24px" valign="bottom" align="left">
            <asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                OnClick="btnGuardar_Click1" /></td>
    </tr>
    <tr>
        <td align="center" colspan="5" style="height: 25px" valign="bottom">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="2" style="height: 29px">
        </td>
        <td colspan="1" style="width: 30px; height: 29px">
        </td>
        <td colspan="1" style="height: 29px">
        </td>
        <td colspan="1">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="5" valign="top">
            <span style="font-size: 10pt"><strong>
            PENSUM DE LA CARRERA</strong></span><br />
            <br />
                        <asp:GridView ID="gvPensum" runat="server" AutoGenerateColumns="False" DataKeyNames="id_pensum"
                            DataSourceID="ObjPensumCarrera" CellPadding="4" Font-Names="Arial" Font-Size="12px" ForeColor="#333333" GridLines="None">
                            <Columns>
                                <asp:BoundField DataField="id_pensum" HeaderText="Cod." InsertVisible="False" ReadOnly="True"
                                    SortExpression="id_pensum" />
                                <asp:BoundField DataField="Carrera" HeaderText="Carrera" SortExpression="Carrera" />
                                <asp:BoundField DataField="descripcion" HeaderText="Semestre" SortExpression="descripcion" />
                                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                <asp:BoundField DataField="Prerequisito" HeaderText="Prerequisito" SortExpression="Prerequisito" />
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ObjPensumCarrera" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByCarrera"
                            TypeName="dsUniversidadTableAdapters.view_PensumTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlcarrera" Name="id_carrera" PropertyName="SelectedValue"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/imprimirPensum.aspx">Imprimir Pensum</asp:HyperLink>
        </td>
    </tr>
</table>
