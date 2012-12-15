<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="ExtraCredito.aspx.cs" Inherits="reportes_ExtraCredito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 18pt; font-family: Arial">EXTRACREDITO
        <hr />
    </span><span style="font-size: 13px; font-family: Arial">Buscar estudiante<br />
    </span>
    <table style="font-size: 13px; font-family: Arial">
        <tr>
            <td style="height: 25px" valign="middle">
                Matrícula</td>
            <td style="height: 25px">
                <asp:TextBox ID="txtbuscar" runat="server" Font-Names="Arial" Font-Size="12px"></asp:TextBox></td>
            <td style="height: 25px">
                <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                    OnClick="btnBuscar_Click1" /></td>
        </tr>
    </table>
    <asp:DetailsView ID="dvBuscar" runat="server" AutoGenerateRows="False" CellPadding="4"
        DataKeyNames="cod_stu" DataSourceID="objBuscar_Matri" Font-Names="Arial" Font-Size="13px"
        ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="matricula" HeaderText="Matr&#237;cula" SortExpression="matricula" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
            <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
            <asp:BoundField DataField="cod_stu" HeaderText="C&#243;digo" InsertVisible="False"
                ReadOnly="True" SortExpression="cod_stu" />
            <asp:BoundField DataField="id_recinto" HeaderText="Recinto Id." SortExpression="id_recinto" />
        </Fields>
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
        <EmptyDataRowStyle ForeColor="Red" />
    </asp:DetailsView>
    <span style="font-size: 13px; font-family: Arial"></span>
    <asp:Label ID="lblidcarrera" runat="server" Visible="False"></asp:Label><asp:ObjectDataSource
        ID="objBuscar_Matri" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Estudiantes_ForSearchTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtbuscar" DefaultValue="{0}" Name="matricula" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <span style="font-size: 13px; font-family: Arial"></span>
    <asp:Label ID="lblEstudianteNo" runat="server" Font-Bold="True" Font-Names="Arial"
        Font-Size="14px" ForeColor="Red" Text="EL ESTUDIANTE NO HA SIDO ENCONTRADO" Visible="False"></asp:Label><br />
    <br />
    <table>
        <tr>
            <td style="width: 49px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Ciclo"></asp:Label></td>
            <td style="width: 100px">
                <asp:DropDownList
        ID="ddlCiclo" runat="server" DataSourceID="ODCiclo" DataTextField="nombre" DataValueField="id_ciclo"
        Width="125px">
    </asp:DropDownList></td>
            <td style="width: 86px">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Descripcion"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtDescripcion" runat="server" Height="61px" TextMode="MultiLine"
                    Width="245px"></asp:TextBox></td>
            <td style="width: 100px">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insertar ExtraCredito"
        Width="149px" /></td>
        </tr>
    </table>
    &nbsp; &nbsp; &nbsp;&nbsp;
    <br />
    <br />
    <asp:GridView ID="gvextracredito" runat="server" AutoGenerateColumns="False" BackColor="White"
        BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="idExtraCredito"
        DataSourceID="ODExtraCredito">
        <RowStyle BackColor="White" ForeColor="#330099" />
        <Columns>
            <asp:BoundField DataField="idExtraCredito" HeaderText="Cod ExtraCredito" InsertVisible="False"
                ReadOnly="True" SortExpression="idExtraCredito" />
            <asp:TemplateField HeaderText="Ciclo" SortExpression="Ciclo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Ciclo") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    &nbsp;<asp:DropDownList ID="ddlCiclo" runat="server" DataSourceID="ODCiclo" DataTextField="nombre"
                        DataValueField="id_ciclo" Enabled="False" SelectedValue='<%# Bind("Ciclo") %>'>
                    </asp:DropDownList><asp:ObjectDataSource ID="ODCiclo" runat="server" DeleteMethod="Delete"
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
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
                            <asp:Parameter Name="recargo_2" Type="DateTime" />
                            <asp:Parameter Name="recargo_3" Type="DateTime" />
                            <asp:Parameter Name="recargo_4" Type="DateTime" />
                            <asp:Parameter Name="fecha_bajasanadidas" Type="DateTime" />
                            <asp:Parameter Name="fecha_retiro" Type="DateTime" />
                            <asp:Parameter Name="fecha_inscripcion" Type="DateTime" />
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
                            <asp:Parameter Name="recargo_2" Type="DateTime" />
                            <asp:Parameter Name="recargo_3" Type="DateTime" />
                            <asp:Parameter Name="recargo_4" Type="DateTime" />
                            <asp:Parameter Name="fecha_bajasanadidas" Type="DateTime" />
                            <asp:Parameter Name="fecha_retiro" Type="DateTime" />
                            <asp:Parameter Name="fecha_inscripcion" Type="DateTime" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField DeleteText="Borrar" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
    </asp:GridView>
    <br />
    &nbsp;<asp:Label ID="lblMsg" runat="server" Font-Bold="True"></asp:Label><br />
    <br />
    <asp:ObjectDataSource ID="ODExtraCredito" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByCodStudent" TypeName="dsUniversidadTableAdapters.ExtraCreditoTableAdapter"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_idExtraCredito" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Cod_Stu" Type="Int32" />
            <asp:Parameter Name="Ciclo" Type="String" />
            <asp:Parameter Name="Original_idExtraCredito" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Cod_Stu" Type="Int32" />
            <asp:Parameter Name="Ciclo" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="CodStudent" SessionField="id_estudiante" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ODCiclo" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetCicloByActivo"
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
            <asp:Parameter Name="recargo_2" Type="DateTime" />
            <asp:Parameter Name="recargo_3" Type="DateTime" />
            <asp:Parameter Name="recargo_4" Type="DateTime" />
            <asp:Parameter Name="fecha_bajasanadidas" Type="DateTime" />
            <asp:Parameter Name="fecha_retiro" Type="DateTime" />
            <asp:Parameter Name="fecha_inscripcion" Type="DateTime" />
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
            <asp:Parameter Name="recargo_2" Type="DateTime" />
            <asp:Parameter Name="recargo_3" Type="DateTime" />
            <asp:Parameter Name="recargo_4" Type="DateTime" />
            <asp:Parameter Name="fecha_bajasanadidas" Type="DateTime" />
            <asp:Parameter Name="fecha_retiro" Type="DateTime" />
            <asp:Parameter Name="fecha_inscripcion" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

