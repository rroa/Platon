<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="NotaPensum.aspx.cs" Inherits="NotaPensum" %>
<%@  Register TagPrefix="ew"   Namespace="eWorld.UI.Compatibility"  Assembly="eWorld.UI.Compatibility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Arial"><span style="font-size: 18pt">NOTAS POR PENSUM
        <hr />
    </span><span style="font-size: 10pt; color: #ff0000"><strong>NO UTILIZAR ESTE MODULO
        PARA PONER NOTAS A LAS MATERIAS QUE EL ESTUDIANTE ESTA CURSANDO ACTUALMENTE NI A
        LAS MATERIAS ACTIVAS DEL ESTUDIANTE<br />
    </strong></span></span>
    <br />
    MATRICULA DEL ESTUDIANTE:&nbsp;<ew:maskedtextbox id="txtmatricula" runat="server" font-names="Arial"
        font-size="12px" mask="99-9999" maxlength="7" validationexpression="\d{2}-\d{4}"
        width="150px"></ew:maskedtextbox>
    <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" /><br />
    <asp:DetailsView ID="dvEstudiante" runat="server" AutoGenerateRows="False" CellPadding="4"
        DataSourceID="odsEstudiante" Font-Names="Arial" Font-Size="10px" ForeColor="#333333"
        GridLines="None">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="cod_stu" HeaderText="Cod." InsertVisible="False" SortExpression="cod_stu" />
            <asp:BoundField DataField="matricula" HeaderText="Matricula" SortExpression="matricula" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
            <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
            <asp:BoundField DataField="id_carrera" HeaderText="Cod. Carrera" SortExpression="id_carrera" />
            <asp:BoundField DataField="carrera_nombre" HeaderText="Carrera" SortExpression="carrera_nombre" />
            <asp:BoundField DataField="id_recinto" HeaderText="Recinto" SortExpression="id_recinto" />
        </Fields>
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
    <asp:ObjectDataSource ID="odsEstudiante" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtmatricula" DefaultValue="" Name="matricula" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="lblidestudiante" runat="server"></asp:Label>
    &nbsp;
    <asp:Label ID="lblidcarrera" runat="server"></asp:Label>&nbsp;
    <asp:Label ID="lblrecinto" runat="server"></asp:Label><br />
    <br />
    <asp:GridView ID="gvPensum" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="id_pensum" DataSourceID="odsPensum" Font-Names="Arial" Font-Size="12px"
        ForeColor="#333333" GridLines="None" OnRowCommand="gvPensum_RowCommand">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="id_materia" HeaderText="Id. materia" SortExpression="id_materia" />
            <asp:BoundField DataField="descripcion" HeaderText="Cuatrimestre" SortExpression="descripcion" />
            <asp:TemplateField HeaderText="Cod. Materia" SortExpression="Materia">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Materia") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Materia") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="materia_desc" HeaderText="Materia" SortExpression="materia_desc" />
            <asp:TemplateField HeaderText="CICLO">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlCiclo" runat="server" DataSourceID="odsCiclo" DataTextField="nombre"
                        DataValueField="nombre" SelectedValue='<%# Bind("session_ciclo") %>'>
                    </asp:DropDownList><asp:ObjectDataSource ID="odsCiclo" runat="server" DeleteMethod="Delete"
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
                    &nbsp;
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NOTA">
                <ItemTemplate>
                    <asp:TextBox ID="txtnota" runat="server" Width="36px" Text='<%# Bind("nota_num") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField ButtonType="Button" Text="GUARDAR" CommandName="guardar" />
        </Columns>
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="odsPensum" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.PensumNotaSPTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtmatricula" Name="matricula" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="lblidmateria" runat="server"></asp:Label>&nbsp;
    <asp:Label ID="lblciclo" runat="server"></asp:Label>
    <asp:Label ID="lblnota" runat="server"></asp:Label>&nbsp;
    <asp:Label ID="lblmatcod" runat="server"></asp:Label><br />
    <asp:Label ID="lblidsession" runat="server"></asp:Label>
    &nbsp;<asp:Label ID="lblnotalit" runat="server"></asp:Label>
    &nbsp;
    <asp:Label ID="lblnotanum" runat="server"></asp:Label><br />
    <br />
    <span style="font-size: 9pt"><span style="font-family: Arial"><strong>NOMENCLATURA DE
        NOTAS<br />
    </strong>A = 90 - 100<br />
        B = 80 - 89<br />
        C = 70 - 79<br />
        D= 60&nbsp; - 69<br />
        F = 0 &nbsp; - 59<br />
        VAL = VALIDADA<br />
        CONV = CONVALIDADA<br />
        R =&nbsp; RETIRADA<br />
        I = INCOMPLETA<br />
        E = EXONERADA<br />
        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/print.jpg" OnClick="ImageButton1_Click" />Imprimir</span></span>
</asp:Content>

