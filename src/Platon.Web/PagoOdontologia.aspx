<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="PagoOdontologia.aspx.cs" Inherits="PagoOdontologia"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 20px; font-family: Arial">PAGO DE SERVICIOS DE ODONTOLOGIA&nbsp;</span>
        <hr />
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td valign="top">
                    <table border="0" cellpadding="0" style="font-family: Verdana">
                        <tr>
                            <td>
                                <strong><span style="font-size: 13pt">1.</span></strong> Matricula del estudiante</td>
                            <td>
            <asp:TextBox ID="txtMatricula" runat="server"></asp:TextBox></td>
                            <td>
            <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click"  /></td>
                        </tr>
                        <tr>
                            <td colspan="3">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4"
                DataSourceID="ObjectDataSource2" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="matricula" HeaderText="Matr&#237;cula" SortExpression="matricula" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="cedula" HeaderText="Cedula" SortExpression="cedula" />
                </Fields>
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:DetailsView>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtMatricula" DefaultValue="{0}" Name="matricula" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong><span style="font-size: 13pt">2.</span></strong>
            Nombre del paciente</td>
                            <td colspan="2">
            <asp:TextBox ID="txtpaciente" runat="server" Width="256px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <strong><span style="font-size: 13pt">3.</span></strong> Seleccione los servicios
                                realizados</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_serv_odon"
                        DataSourceID="ObjectDataSource1" Font-Names="Arial" Font-Size="12px" CellPadding="4" ForeColor="#333333" GridLines="None" Width="455px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
                            <asp:BoundField DataField="servicio" HeaderText="Servicio" SortExpression="servicio" />
                            <asp:TemplateField HeaderText="Costo" SortExpression="costo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("costo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("costo", "{0:C}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                TypeName="dsUniversidadTableAdapters.Servicios_OdontologiaTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_serv_odon" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="servicio" Type="String" />
                    <asp:Parameter Name="costo" Type="Decimal" />
                    <asp:Parameter Name="Original_id_serv_odon" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="servicio" Type="String" />
                    <asp:Parameter Name="costo" Type="Decimal" />
                </InsertParameters>
            </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="right" colspan="2">
                    <asp:Button ID="Button2" runat="server" Text="Pagar Servicios" OnClick="Button2_Click" Font-Bold="True" Height="36px" Width="161px" />
                                <asp:Button ID="Button3" runat="server" Text="Nuevo" OnClick="Button3_Click" Font-Bold="True" Height="36px" Width="80px" /></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <asp:Label ID="lblmsg" runat="server" Font-Bold="True"></asp:Label></td>
                <td valign="top" align="center">
                    <br />
                    <asp:DataList ID="datalistOdontologia" runat="server" Font-Names="Arial" Font-Size="12px" Width="294px" OnDeleteCommand="datalistOdontologia_DeleteCommand"
                        >
                        <ItemTemplate>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left" style="width: 136px" valign="top">
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("servicio") %>'></asp:Label></td>
                                    <td align="left" style="width: 128px" valign="top">
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("costo") %>'></asp:Label></td>
                                    <td>
                                        <asp:LinkButton ID="delete" runat="server" CommandName="Delete" Font-Bold="True" Font-Size="15px" ForeColor="Red" Text="  X"></asp:LinkButton></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <HeaderTemplate>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left" style="width: 136px; height: 16px; background-color: #990000" valign="top">
                                        <strong><span style="color: #ffffff">Servicio</span></strong></td>
                                    <td align="left" style="width: 128px; height: 16px; background-color: #990000" valign="top">
                                        <strong><span style="color: #ffffff">Costo</span></strong></td>
                                    <td style="height: 16px; background-color: #990000">
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                    </asp:DataList><br />
                    <table style="width: 240px">
                        <tr>
                            <td colspan="2">
                                Monto a pagar:</td>
                            <td style="width: 100px">
                                <asp:Label ID="lblMonto" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <span style="font-size: 12px">
            <br />
        </span>
</asp:Content>

