<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="eliminarinscripcion.aspx.cs" Inherits="eliminarinscripcion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Arial"><span style="font-size: 13px"><span style="color: #ff0000">
        <span style="font-size: 24px">ELIMINAR INSCRIPCION</span>
        <hr />
    </span>MATRICULA DEL ESTUDIANTE: </span></span>
    <asp:TextBox ID="txtmatricula" runat="server"></asp:TextBox><span style="font-size: 13px;
        font-family: Arial"> </span>
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
    <span style="font-size: 13px; font-family: Arial"></span>
    <asp:ObjectDataSource ID="odsEstudiante" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByMatricula" TypeName="dsUniversidadTableAdapters.Vista_Dt_EstudianteTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtmatricula" DefaultValue="" Name="matricula" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="lblidestudiante" runat="server"></asp:Label><br />
    <br />
    <span style="font-size: 13px; font-family: Arial">Inscripciones Activas<br />
    </span>
    <asp:GridView ID="gvInscripcion" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="id_inscripcion" DataSourceID="odsInscripcion" Font-Names="Arial"
        Font-Size="13px" ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <Columns>
            <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
            <asp:BoundField DataField="id_inscripcion" HeaderText="Cod." InsertVisible="False"
                ReadOnly="True" SortExpression="id_inscripcion" />
            <asp:BoundField DataField="ciclo" HeaderText="Ciclo" SortExpression="ciclo" />
            <asp:BoundField DataField="fecha_inscripcion" HeaderText="Fecha Inscripcion" SortExpression="fecha_inscripcion" />
            <asp:BoundField DataField="id_usuario" HeaderText="Id. Usr." SortExpression="id_usuario" />
            <asp:CheckBoxField DataField="activo" HeaderText="Activa" SortExpression="activo" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="odsInscripcion" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByEstudianteActivo"
        TypeName="dsUniversidadTableAdapters.Inscripcion_EstudianteTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_inscripcion" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_estudiante" Type="Int32" />
            <asp:Parameter Name="ciclo" Type="String" />
            <asp:Parameter Name="fecha_inscripcion" Type="DateTime" />
            <asp:Parameter Name="id_usuario" Type="Int32" />
            <asp:Parameter Name="activo" Type="Boolean" />
            <asp:Parameter Name="Original_id_inscripcion" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="lblidestudiante" DefaultValue="" Name="estudiante"
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="id_estudiante" Type="Int32" />
            <asp:Parameter Name="ciclo" Type="String" />
            <asp:Parameter Name="fecha_inscripcion" Type="DateTime" />
            <asp:Parameter Name="id_usuario" Type="Int32" />
            <asp:Parameter Name="activo" Type="Boolean" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <span style="font-size: 13px; font-family: Arial">Asignaturas:<br />
    </span>
    <asp:GridView ID="gvAsignaturas" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="id_session_stud" DataSourceID="odsMaterias" Font-Names="Arial"
        Font-Size="13px" ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="id_session_stud" HeaderText="Cod." InsertVisible="False"
                ReadOnly="True" SortExpression="id_session_stud" />
            <asp:TemplateField HeaderText="F. Inscripcion" SortExpression="f_inscripcion">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("f_inscripcion") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("f_inscripcion", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
            <asp:BoundField DataField="session_cod" HeaderText="Secci&#243;n" SortExpression="session_cod" />
            <asp:BoundField DataField="mat_cod" HeaderText="Mat. Cod." SortExpression="mat_cod" />
            <asp:BoundField DataField="materia_desc" HeaderText="Asignatura" SortExpression="materia_desc" />
            <asp:CheckBoxField DataField="esta" HeaderText="Esta" SortExpression="esta" />
            <asp:CheckBoxField DataField="retirada" HeaderText="Retirada" SortExpression="retirada" />
            <asp:CheckBoxField DataField="debaja" HeaderText="Baja" SortExpression="debaja" />
            <asp:CheckBoxField DataField="sesion_cerrada" HeaderText="Cerrada" SortExpression="sesion_cerrada" />
            <asp:TemplateField HeaderText="F. retiro" SortExpression="fecha_retiro">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fecha_retiro") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("fecha_retiro", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id_usuario_retiro" HeaderText="Usr. retiro" SortExpression="id_usuario_retiro" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="odsMaterias" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByInscripcion" TypeName="dsUniversidadTableAdapters.viewSession_StudentTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvInscripcion" Name="inscripcion" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <span style="font-size: 13px; font-family: Arial">Balance:<br />
    </span>
    <asp:GridView ID="gvBalance" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="id_balance" DataSourceID="odsBalance" Font-Names="Arial" Font-Size="13px"
        ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="id_balance" HeaderText="Cod." ReadOnly="True" SortExpression="id_balance" />
            <asp:BoundField DataField="ciclo" HeaderText="ciclo" SortExpression="ciclo" />
            <asp:BoundField DataField="concepto" HeaderText="Concepto" SortExpression="concepto" />
            <asp:TemplateField HeaderText="Fecha" SortExpression="fecha">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="tipo" HeaderText="Tipo" SortExpression="tipo" />
            <asp:BoundField DataField="inscripcion" HeaderText="Inscripcion" SortExpression="inscripcion" />
            <asp:BoundField DataField="cant_creditos" HeaderText="Cant. Cr." SortExpression="cant_creditos" />
            <asp:BoundField DataField="total_por_Creditos" HeaderText="Monto Cr." SortExpression="total_por_Creditos" />
            <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
            <asp:BoundField DataField="Balance" HeaderText="Balance" ReadOnly="True" SortExpression="Balance" />
            <asp:BoundField DataField="usuario" HeaderText="Usr." SortExpression="usuario" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="odsBalance" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByInscripcion" TypeName="dsUniversidadTableAdapters.viewCajaBalanceEstudianteTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvInscripcion" Name="inscripcion" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:Button ID="btnInscripcion" runat="server" OnClick="btnInscripcion_Click" Text="ELIMINAR INSCRIPCION" />
</asp:Content>

