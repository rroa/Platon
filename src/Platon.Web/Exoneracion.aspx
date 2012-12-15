<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="Exoneracion.aspx.cs" Inherits="Convalidaciones"%>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Arial">
    <span style="font-size: 24px;">EXONERACION DE MATERIAS
        <hr />
    </span><span style="font-size: 13px">Buscar estudiante<br />
    </span></span>
    <table style="font-size: 13px; font-family: Arial">
        <tr>
            <td valign="middle" style="height: 25px">
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
    <asp:Label ID="lblidcarrera" runat="server" Visible="False"></asp:Label><asp:ObjectDataSource ID="objBuscar_Matri" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Estudiantes_ForSearchTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtbuscar" DefaultValue="{0}" Name="matricula" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <span style="font-size: 13px; font-family: Arial"></span>
    <asp:Label ID="lblEstudianteNo" runat="server" Font-Bold="True" Font-Names="Arial"
        Font-Size="14px" ForeColor="Red" Text="EL ESTUDIANTE NO HA SIDO ENCONTRADO" Visible="False"></asp:Label><br />
    <hr style="font-size: 13px; font-family: Arial" />
    <br />
    <table border="0" cellpadding="0" cellspacing="0" style="font-size: 13px; width: 100%;
        font-family: Arial">
        <tr>
            <td style="height: 16px">
                Materia a Convalidar</td>
            <td style="height: 16px">
                Nota</td>
            <td colspan="2" style="height: 16px">
                Descripcion</td>
            <td style="height: 16px">
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ddlmateria" runat="server" AutoPostBack="True" DataSourceID="odsMateria" DataTextField="Materia" DataValueField="id_materia" OnSelectedIndexChanged="ddlmateria_SelectedIndexChanged">
                </asp:DropDownList><asp:ObjectDataSource ID="odsMateria" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByExoneracion" TypeName="dsUniversidadTableAdapters.MateriasdePensumTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblidcarrera" Name="carrera" PropertyName="Text"
                            Type="Int32" />
                        <asp:SessionParameter DefaultValue="" Name="estudiante" SessionField="id_estudiante"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td>
                <asp:TextBox ID="txtNota" runat="server" Width="37px"></asp:TextBox></td>
            <td colspan="2">
                <asp:TextBox ID="txtDescr" runat="server" Width="335px" Height="54px" TextMode="MultiLine"></asp:TextBox></td>
            <td>
                <asp:Button ID="btnConvalidar" runat="server" Text="Exonerar" OnClick="btnConvalidar_Click" /></td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:Label ID="lblmsg" runat="server"></asp:Label></td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="idExoneracion" DataSourceID="odsConv" Font-Names="Arial" Font-Size="13px"
        ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="id_materia" HeaderText="id_materia" SortExpression="id_materia" />
            <asp:BoundField DataField="nota" HeaderText="Nota" SortExpression="nota" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" SortExpression="descripcion" />
            <asp:TemplateField HeaderText="Fecha" SortExpression="fecha_exoneracion">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha_exoneracion") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha_exoneracion", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField DeleteText="Eliminar" ShowDeleteButton="True" />
        </Columns>
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="odsConv" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.ExoneracionTableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_idExoneracion" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_estudiante" Type="Int32" />
            <asp:Parameter Name="fecha_exoneracion" Type="DateTime" />
            <asp:Parameter Name="id_materia" Type="Int32" />
            <asp:Parameter Name="nota" Type="Int32" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="idusuario" Type="Int32" />
            <asp:Parameter Name="Original_idExoneracion" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="id_estudiante" Type="Int32" />
            <asp:Parameter Name="fecha_exoneracion" Type="DateTime" />
            <asp:Parameter Name="id_materia" Type="Int32" />
            <asp:Parameter Name="nota" Type="Int32" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="idusuario" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtbuscar" DefaultValue="{0}" Name="matricula" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

