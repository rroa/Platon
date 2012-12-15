<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="AcuerdoPago.aspx.cs" Inherits="AcuerdoPago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 20px; font-family: Arial">ACUERDO DE PAGO
        <hr />
        <span style="font-size: 12px">Escriba la matricula del estudiante para verificar si
            posee acuerdo de pago<br />
            <asp:TextBox ID="txtmatricula" runat="server"></asp:TextBox>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg" OnClick="ImageButton1_Click" />
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg" OnClick="ImageButton2_Click" /><br />
            <br />
            <strong>ACUERDOS DE PAGO</strong><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="id_acuerdo" DataSourceID="ObjectDataSource1" ForeColor="#333333"
                GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <Columns>
                    <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                    <asp:BoundField DataField="id_acuerdo" HeaderText="Cod.Acuerdo" ReadOnly="True" SortExpression="id_acuerdo" />
                    <asp:TemplateField HeaderText="Monto" SortExpression="monto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("monto") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("monto", "{0:C}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha" SortExpression="fecha">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("fecha", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="activo" HeaderText="activo" SortExpression="activo" />
                    <asp:TemplateField HeaderText="Pagos" SortExpression="Pagos">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Pagos") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Pagos", "{0:C}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="BalancePendiente" HeaderText="Balance Pendiente" ReadOnly="True"
                        SortExpression="BalancePendiente" />
                </Columns>
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByMatricula"
                TypeName="dsUniversidadTableAdapters.viewAcuerdoPagoTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtmatricula" Name="matricula" PropertyName="Text"
                        Type="String" DefaultValue="{0}" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <hr />
            <br />
            <strong><span style="font-size: 16px">REALIZAR PAGO</span></strong><br />
            Para realizar un pago, seleccione el acuerdo de pago en la cuadrilla de arriba y
            escriba la cantidad a abonar<br />
            <asp:TextBox ID="txtmontopago" runat="server"></asp:TextBox><span style="font-size: 9px;
                color: #ff0000"><strong>(solo n&uacute;meros)&nbsp;
                    <asp:Button ID="Button1" runat="server" Font-Bold="True" OnClick="Button1_Click"
                        Text="Abonar / Pagar" /></strong></span><br />
            <strong>
                <br />
                PAGOS REALIZADOS</strong>&nbsp;<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="id_acuerdo_pagos" DataSourceID="ObjectDataSource2"
                    ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:CommandField SelectText="Imprimir Recibo" ShowSelectButton="True" />
                        <asp:BoundField DataField="id_acuerdo_pagos" HeaderText="Cod. Pago" InsertVisible="False"
                            ReadOnly="True" SortExpression="id_acuerdo_pagos" />
                        <asp:BoundField DataField="id_acuerdo" HeaderText="Cod. Acuerdo" SortExpression="id_acuerdo" />
                        <asp:TemplateField HeaderText="Monto Pago" SortExpression="pagos">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("pagos") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("pagos", "{0:C}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha" SortExpression="fecha">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete"
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByAcuerdo"
                TypeName="dsUniversidadTableAdapters.PagosAAcuerdosTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_acuerdo_pagos" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_acuerdo" Type="Int32" />
                    <asp:Parameter Name="pagos" Type="Decimal" />
                    <asp:Parameter Name="fecha" Type="DateTime" />
                    <asp:Parameter Name="activo" Type="Boolean" />
                    <asp:Parameter Name="Original_id_acuerdo_pagos" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="acuerdo" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_acuerdo" Type="Int32" />
                    <asp:Parameter Name="pagos" Type="Decimal" />
                    <asp:Parameter Name="fecha" Type="DateTime" />
                    <asp:Parameter Name="activo" Type="Boolean" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <br />
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True"></asp:Label></span></span>
</asp:Content>

