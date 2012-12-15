<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertCostoInscripcion.ascx.cs" Inherits="controles_insertCostoInscripcion" %>
<span style="font-size: 24px; font-family: Arial">COSTO DE INSCRIPCION
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0" style="padding-left: 5px; font-size: 12px; font-family: Arial; border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;">
    <tr>
        <td style="height: 25px">
        </td>
        <td style="height: 25px; width: 477px;">
        </td>
        <td style="width: 28px; height: 25px">
        </td>
        <td style="background-color: whitesmoke; border-left: black 1px solid; border-bottom: black 1px solid; width: 400px;">
            <strong>
            Costos de Inscripciones activos</strong></td>
    </tr>
    <tr>
        <td style="height: 19px">
            <strong>Recinto &nbsp; &nbsp; </strong></td>
        <td style="border-right: black 1px solid; width: 477px;">
            <asp:DropDownList ID="ddlRecinto" runat="server" DataSourceID="ObjectRecinto" DataTextField="recinto_nombre"
                DataValueField="id_recinto" Width="270px" Font-Names="Arial" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddlRecinto_SelectedIndexChanged" OnDataBound="ddlRecinto_DataBound">
            </asp:DropDownList><asp:ObjectDataSource ID="ObjectRecinto" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                TypeName="dsUniversidadTableAdapters.RecintoTableAdapter">
            </asp:ObjectDataSource>
        </td>
        <td style="width: 28px; height: 19px">
        </td>
        <td rowspan="7" style="border-left: black 1px solid; width: 400px;">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%; font-size: 12px; font-family: Arial;">
                <tr>
                    <td style="width: 146px; height: 20px">
                    </td>
                    <td style="height: 20px; width: 187px;">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 176px">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            DataKeyNames="int_recinto_inscrip" DataSourceID="ObjectDataSource1" Font-Names="Arial"
                            Font-Size="12px" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/botones/btn_borrarcosto.jpg"
                                    SelectText="Borrar Costo" ShowSelectButton="True" />
                                <asp:BoundField DataField="recinto_nombre" HeaderText="Recinto" SortExpression="recinto_nombre" />
                                <asp:BoundField DataField="siglas" HeaderText="Siglas" SortExpression="siglas" />
                                <asp:TemplateField HeaderText="Costo Inscripcion" SortExpression="costo_inscripcion">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("costo_inscripcion") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("costo_inscripcion", "{0:C}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.view_CostoInscripcionTableAdapter">
                        </asp:ObjectDataSource>
                        &nbsp;<br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="height: 19px">
            <strong>Carrera</strong></td>
        <td style="border-right: black 1px solid; width: 477px">
            <asp:DropDownList ID="ddlCarrera" runat="server" DataSourceID="ObjectCarrera" DataTextField="carrera_nombre"
                DataValueField="id_carrera" Width="270px">
            </asp:DropDownList><asp:ObjectDataSource ID="ObjectCarrera" runat="server" DeleteMethod="Delete"
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                TypeName="dsUniversidadTableAdapters.CarreraTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_carrera" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="carrera_nombre" Type="String" />
                    <asp:Parameter Name="carrera_cant_credito" Type="Int32" />
                    <asp:Parameter Name="carrera_siglas" Type="String" />
                    <asp:Parameter Name="carrera_titulo" Type="String" />
                    <asp:Parameter Name="Original_id_carrera" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="carrera_nombre" Type="String" />
                    <asp:Parameter Name="carrera_cant_credito" Type="Int32" />
                    <asp:Parameter Name="carrera_siglas" Type="String" />
                    <asp:Parameter Name="carrera_titulo" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </td>
        <td style="width: 28px; height: 19px">
        </td>
    </tr>
    <tr>
        <td style="height: 19px">
        </td>
        <td style="border-right: black 1px solid; width: 477px">
            <asp:Label ID="Label2" runat="server" ForeColor="Blue" Text="El Costo de inscripci&oacute;n en este recinto es: RD$ "
                Visible="False" Font-Names="Arial" Font-Size="12px"></asp:Label><asp:Label ID="lblCostoCredito" runat="server" ForeColor="Blue" Font-Names="Arial" Font-Size="12px"></asp:Label><br />
        </td>
        <td style="width: 28px; height: 19px">
        </td>
    </tr>
    <tr>
        <td>
            <strong>Costo</strong></td>
        <td style="border-right: black 1px solid; width: 477px;">
            <asp:TextBox ID="txtcosto" runat="server" Font-Names="Arial" Font-Size="12px"></asp:TextBox></td>
        <td style="width: 28px">
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td style="border-right: black 1px solid; width: 477px;">
        </td>
        <td style="width: 28px">
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td style="border-right: black 1px solid; width: 477px;">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
        <td style="width: 28px">
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td style="border-right: black 1px solid; width: 477px;">
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                OnClick="ImageButton2_Click" /></td>
        <td style="width: 28px">
        </td>
    </tr>
</table>
