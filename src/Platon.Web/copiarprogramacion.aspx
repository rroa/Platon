<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="copiarprogramacion.aspx.cs" Inherits="copiarprogramacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-family: Arial">
    <span style="font-size: 24px;">PROGRAMACION DE CLASES
        <hr />
    </span><span style="font-size: 13px">Ciclo: </span></span>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odsCiclo"
        DataTextField="nombre" DataValueField="nombre">
    </asp:DropDownList><asp:ObjectDataSource ID="odsCiclo" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCicloByActivo"
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
    <span style="font-size: 13px; font-family: Arial">
        <br />
        <strong>Nota</strong>: La sección solamente se eliminará si no tiene estudiantes
        inscritos. De lo contrario deberá desactivar la sección.<br />
    <br />
    </span>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="id_session" DataSourceID="odsSeccionesActivas" Font-Names="Arial"
        Font-Size="12px" ForeColor="#333333" GridLines="None" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <Columns>
            <asp:CommandField ButtonType="Button" CancelText="Cancelar" EditText="Editar" ShowEditButton="True"
                UpdateText="Actualizar" SelectText="Eliminar" ShowSelectButton="True" />
            <asp:BoundField DataField="id_session" HeaderText="Id." InsertVisible="False" ReadOnly="True"
                SortExpression="id_session" />
            <asp:BoundField DataField="session_cod" HeaderText="Secci&#243;n" SortExpression="session_cod" />
            <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
            <asp:TemplateField HeaderText="Materia" SortExpression="session_materia">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="odsMateriaEdit"
                        DataTextField="materia_desc" DataValueField="id_materia" SelectedValue='<%# Bind("session_materia") %>'>
                    </asp:DropDownList><asp:ObjectDataSource ID="odsMateriaEdit" runat="server" DeleteMethod="Delete"
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                        TypeName="dsUniversidadTableAdapters.MateriaTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id_materia" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="mat_cod" Type="String" />
                            <asp:Parameter Name="materia_desc" Type="String" />
                            <asp:Parameter Name="mat_credit" Type="Int32" />
                            <asp:Parameter Name="mat_ht" Type="Int32" />
                            <asp:Parameter Name="mat_hp" Type="Int32" />
                            <asp:Parameter Name="Original_id_materia" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="mat_cod" Type="String" />
                            <asp:Parameter Name="materia_desc" Type="String" />
                            <asp:Parameter Name="mat_credit" Type="Int32" />
                            <asp:Parameter Name="mat_ht" Type="Int32" />
                            <asp:Parameter Name="mat_hp" Type="Int32" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    &nbsp;
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="odsMaterias" DataTextField="materia_desc"
                        DataValueField="id_materia" SelectedValue='<%# Bind("session_materia") %>'>
                    </asp:DropDownList><asp:ObjectDataSource ID="odsMaterias" runat="server" DeleteMethod="Delete"
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                        TypeName="dsUniversidadTableAdapters.MateriaTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id_materia" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="mat_cod" Type="String" />
                            <asp:Parameter Name="materia_desc" Type="String" />
                            <asp:Parameter Name="mat_credit" Type="Int32" />
                            <asp:Parameter Name="mat_ht" Type="Int32" />
                            <asp:Parameter Name="mat_hp" Type="Int32" />
                            <asp:Parameter Name="Original_id_materia" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="mat_cod" Type="String" />
                            <asp:Parameter Name="materia_desc" Type="String" />
                            <asp:Parameter Name="mat_credit" Type="Int32" />
                            <asp:Parameter Name="mat_ht" Type="Int32" />
                            <asp:Parameter Name="mat_hp" Type="Int32" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Profesor" SortExpression="session_profesor">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="odsProfesorEdit"
                        DataTextField="profesor" DataValueField="id_profesor" SelectedValue='<%# Bind("session_profesor") %>'>
                    </asp:DropDownList><asp:ObjectDataSource ID="odsProfesorEdit" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.ProfesorFullNameTableAdapter">
                    </asp:ObjectDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="odsProfesores"
                        DataTextField="profesor" DataValueField="id_profesor" SelectedValue='<%# Bind("session_profesor") %>'>
                    </asp:DropDownList><asp:ObjectDataSource ID="odsProfesores" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="dsUniversidadTableAdapters.ProfesorFullNameTableAdapter">
                    </asp:ObjectDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad" />
            <asp:BoundField DataField="activo" HeaderText="Activa" SortExpression="activo" />
            <asp:BoundField DataField="id_recinto" HeaderText="Recinto" SortExpression="id_recinto" />
            <asp:BoundField DataField="horario" HeaderText="Horario" SortExpression="horario" />
            <asp:TemplateField HeaderText="Fecha Inicio" SortExpression="f_inicio">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("f_inicio") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("f_inicio", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fecha Fin" SortExpression="f_fin">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("f_fin") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("f_fin", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <span style="font-size: 13px; font-family: Arial"></span>
    <asp:ObjectDataSource ID="odsSeccionesActivas" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByCicloActivo"
        TypeName="dsUniversidadTableAdapters.SessionTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_session" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="session_cod" Type="String" />
            <asp:Parameter Name="session_ciclo" Type="String" />
            <asp:Parameter Name="session_materia" Type="Int32" />
            <asp:Parameter Name="session_profesor" Type="Int32" />
            <asp:Parameter Name="capacidad" Type="Int32" />
            <asp:Parameter Name="activo" Type="Int32" />
            <asp:Parameter Name="id_recinto" Type="Int32" />
            <asp:Parameter Name="horario" Type="String" />
            <asp:Parameter Name="f_inicio" Type="DateTime" />
            <asp:Parameter Name="f_fin" Type="DateTime" />
            <asp:Parameter Name="Original_id_session" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="ciclo" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="session_cod" Type="String" />
            <asp:Parameter Name="session_ciclo" Type="String" />
            <asp:Parameter Name="session_materia" Type="Int32" />
            <asp:Parameter Name="session_profesor" Type="Int32" />
            <asp:Parameter Name="capacidad" Type="Int32" />
            <asp:Parameter Name="activo" Type="Int32" />
            <asp:Parameter Name="id_recinto" Type="Int32" />
            <asp:Parameter Name="horario" Type="String" />
            <asp:Parameter Name="f_inicio" Type="DateTime" />
            <asp:Parameter Name="f_fin" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <span style="font-size: 13px; font-family: Arial">
    <br />
    </span>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="PASAR PROGRAMACION AL CICLO: "
        Width="235px" /><asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="odsCiclo2"
            DataTextField="nombre" DataValueField="nombre">
        </asp:DropDownList><br />
    <asp:ObjectDataSource ID="odsCiclo2" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
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
    <br />
    <asp:Label ID="lblmsg" runat="server" Font-Bold="True"></asp:Label>
</asp:Content>

