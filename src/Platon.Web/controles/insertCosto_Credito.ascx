<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertCosto_Credito.ascx.cs" Inherits="controles_insertCosto_Credito" %>
<span style="font-size: 24px; font-family: Arial">COSTO DE CREDITOS
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; font-family: Arial; border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;">
    <tr>
        <td style="height: 25px; padding-left: 5px; ; width: 93px;">
        </td>
        <td style="height: 25px; padding-left: 5px; ; width: 518px;">
            </td>
        <td style="; height: 25px; padding-left: 5px; width: 30px;">
        </td>
        <td style="height: 25px; padding-left: 5px; background-color: whitesmoke; border-left: black 1px solid; border-bottom: black 1px solid; width: 385px;">
            <strong>
            Costos de Credito activos</strong></td>
    </tr>
    <tr>
        <td style="height: 25px; padding-left: 5px; ; width: 93px;">
            <strong>Recinto</strong></td>
        <td style="height: 25px; padding-left: 5px; ; border-right: black 1px solid; width: 518px;">
            <asp:DropDownList ID="ddlRecinto" runat="server" DataSourceID="ObjectRecinto" DataTextField="recinto_nombre"
                DataValueField="id_recinto" Width="270px" Font-Names="Arial" Font-Size="12px" AutoPostBack="True" OnSelectedIndexChanged="ddlRecinto_SelectedIndexChanged" OnDataBound="ddlRecinto_DataBound">
            </asp:DropDownList><asp:ObjectDataSource ID="ObjectRecinto" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                TypeName="dsUniversidadTableAdapters.RecintoTableAdapter">
            </asp:ObjectDataSource>
        </td>
        <td style="; height: 25px; padding-left: 5px; width: 30px;">
        </td>
        <td rowspan="6" style="padding-left: 5px; ; height: 25px; border-left: black 1px solid; width: 385px;">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%; font-size: 12px; font-family: Arial;">
                <tr>
                    <td style="width: 146px; height: 20px">
                    </td>
                    <td style="height: 20px; width: 159px;">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 176px">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            DataKeyNames="id_costo_crdt" DataSourceID="ObjectDataSource1" Font-Names="Arial"
                            Font-Size="12px" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/botones/btn_borrarcosto.jpg"
                                    SelectText="Borra Costo" ShowSelectButton="True" />
                                <asp:BoundField DataField="recinto_nombre" HeaderText="Recinto" SortExpression="recinto_nombre" />
                                <asp:BoundField DataField="siglas" HeaderText="Siglas" SortExpression="siglas" />
                                <asp:TemplateField HeaderText="Costo" SortExpression="costo_credito">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("costo_credito") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("costo_credito", "{0:C}") %>'></asp:Label>
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
                            SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.view_CostoCreditoTableAdapter">
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="padding-left: 5px; width: 93px; height: 25px">
            <strong>Carrera</strong></td>
        <td style="border-right: black 1px solid; padding-left: 5px; width: 518px; height: 25px; border-left: black 1px dotted;">
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
        <td style="padding-left: 5px; width: 30px; height: 25px">
        </td>
    </tr>
    <tr>
        <td style="padding-left: 5px; ; height: 25px; width: 93px;">
            </td>
        <td style="padding-left: 5px; ; height: 25px; border-right: black 1px solid; width: 518px;">
            <asp:Label ID="Label2" runat="server" ForeColor="Blue" Text="El Costo de cr&eacute;ditos en este recinto es: RD$ "
                Visible="False" Font-Names="Arial" Font-Size="12px"></asp:Label>
            <asp:Label ID="lblCostoCredito" runat="server" ForeColor="Blue" Font-Names="Arial" Font-Size="12px"></asp:Label><br />
        </td>
        <td style="; padding-left: 5px; height: 25px; width: 30px;">
        </td>
    </tr>
    <tr>
        <td style="padding-left: 5px; ; height: 25px; width: 93px;">
            <strong>Nuevo Costo</strong></td>
        <td style="padding-left: 5px; ; height: 25px; border-right: black 1px solid; width: 518px;">
            &nbsp;
            <asp:TextBox ID="txtcosto" runat="server" Font-Names="Arial" Font-Size="12px"></asp:TextBox></td>
        <td style="; padding-left: 5px; height: 25px; width: 30px;">
        </td>
    </tr>
    <tr>
        <td style="padding-left: 5px; ; height: 25px; width: 93px;">
        </td>
        <td style="padding-left: 5px; ; height: 25px; border-right: black 1px solid; width: 518px;">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
        <td style="; padding-left: 5px; height: 25px; width: 30px;">
        </td>
    </tr>
    <tr>
        <td style="padding-left: 5px; ; height: 25px; width: 93px;">
        </td>
        <td style="padding-left: 5px; ; height: 25px; border-right: black 1px solid; width: 518px;">
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                OnClick="ImageButton2_Click" /></td>
        <td style="; padding-left: 5px; height: 25px; width: 30px;">
        </td>
    </tr>
</table>
