<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="NotaLibro.aspx.cs" Inherits="NotaLibro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 12px; font-family: Arial"><span style="font-size: 24px">ASIGNACION
        DE CALIFICACIONES DESDE EL LIBRO
        <hr />
    </span>
        <br />
        1. Seleccione el recinto: </span>
    <asp:DropDownList ID="ddlrecinto" runat="server" AutoPostBack="True" DataSourceID="odsRecinto"
        DataTextField="recinto_nombre" DataValueField="id_recinto" OnSelectedIndexChanged="ddlrecinto_SelectedIndexChanged">
    </asp:DropDownList><asp:ObjectDataSource ID="odsRecinto" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dsUniversidadTableAdapters.RecintoTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id_recinto" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="recinto_nombre" Type="String" />
            <asp:Parameter Name="siglas" Type="String" />
            <asp:Parameter Name="rec_dir" Type="String" />
            <asp:Parameter Name="rec_tel" Type="String" />
            <asp:Parameter Name="Original_id_recinto" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="recinto_nombre" Type="String" />
            <asp:Parameter Name="siglas" Type="String" />
            <asp:Parameter Name="rec_dir" Type="String" />
            <asp:Parameter Name="rec_tel" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <span style="font-size: 12px; font-family: Arial">
    <br />
        2. Seleccione la carrera: </span>
    <asp:DropDownList ID="ddlcarrera" runat="server" DataSourceID="odsCarrera" DataTextField="carrera_nombre"
        DataValueField="id_carrera" AutoPostBack="True" OnSelectedIndexChanged="ddlcarrera_SelectedIndexChanged">
    </asp:DropDownList><asp:ObjectDataSource ID="odsCarrera" runat="server" DeleteMethod="Delete"
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
    <span style="font-size: 12px; font-family: Arial">
    <br />
        3. Seleccione la materia: &nbsp;</span><asp:DropDownList ID="ddlmateria" runat="server" AutoPostBack="True"
        DataSourceID="odsMateria" DataTextField="Materia" DataValueField="id_materia" OnSelectedIndexChanged="ddlmateria_SelectedIndexChanged">
    </asp:DropDownList><asp:ObjectDataSource ID="odsMateria" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByCarreraOrderMat" TypeName="dsUniversidadTableAdapters.view_PensumTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlcarrera" Name="carrera" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <span style="font-size: 12px; font-family: Arial">
    <br />
        4. Seleccione el ciclo: </span>
    <asp:DropDownList ID="ddlciclo" runat="server" AutoPostBack="True" DataSourceID="odsciclo"
        DataTextField="nombre" DataValueField="nombre" OnSelectedIndexChanged="ddlciclo_SelectedIndexChanged">
    </asp:DropDownList><asp:ObjectDataSource ID="odsciclo" runat="server" DeleteMethod="Delete"
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
    <span style="font-size: 12px; font-family: Arial">
    <br />
        5. Seleccione la sección correspondiente:<br />
    </span>
    <asp:GridView ID="gvSeccion" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="id_session" DataSourceID="odsSeccion" ForeColor="#333333" GridLines="None" Font-Names="Arial" Font-Size="12px" OnDataBinding="gvSeccion_DataBinding">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
            <asp:BoundField DataField="id_session" HeaderText="Cod." InsertVisible="False" ReadOnly="True"
                SortExpression="id_session" />
            <asp:BoundField DataField="session_cod" HeaderText="Seccion" SortExpression="session_cod" />
            <asp:BoundField DataField="session_ciclo" HeaderText="Ciclo" SortExpression="session_ciclo" />
            <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad" />
            <asp:BoundField DataField="id_recinto" HeaderText="Recinto" SortExpression="id_recinto" />
        </Columns>
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <span style="font-size: 12px; font-family: Arial"></span>
    <asp:ObjectDataSource ID="odsSeccion" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByNotaPensum"
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
            <asp:Parameter Name="Original_id_session" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlciclo" Name="ciclo" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="ddlmateria" Name="materia" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:ControlParameter ControlID="ddlrecinto" Name="recinto" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="session_cod" Type="String" />
            <asp:Parameter Name="session_ciclo" Type="String" />
            <asp:Parameter Name="session_materia" Type="Int32" />
            <asp:Parameter Name="session_profesor" Type="Int32" />
            <asp:Parameter Name="capacidad" Type="Int32" />
            <asp:Parameter Name="activo" Type="Int32" />
            <asp:Parameter Name="id_recinto" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <span style="font-size: 12px; font-family: Arial">
    <br />
    </span>
    <asp:Button ID="btnCrearSeccion" runat="server" Text="Crear Seccion" OnClick="btnCrearSeccion_Click" /><br />
    <asp:Panel ID="pCrearSeccion" runat="server" Visible="False">
        <table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; font-family: Arial">
            <tr>
                <td>CICLO
                </td>
                <td><asp:DropDownList ID="ddlPciclo" runat="server" AutoPostBack="True" DataSourceID="odsciclo"
        DataTextField="nombre" DataValueField="id_ciclo">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
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
                </td>
            </tr>
            <tr>
                <td>MATERIA
                </td>
                <td>
                    <asp:DropDownList ID="ddlPmateria" runat="server" DataSourceID="odsPmateria" DataTextField="mat_cod"
                        DataValueField="id_materia">
                    </asp:DropDownList><asp:ObjectDataSource ID="odsPmateria" runat="server" DeleteMethod="Delete"
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                        TypeName="dsUniversidadTableAdapters.MateriaTableAdapter" UpdateMethod="Update">
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
                </td>
            </tr>
            <tr>
                <td>CODIGO
                </td>
                <td>
                    <asp:TextBox ID="txtPcodigo" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>RECINTO
                </td>
                <td><asp:DropDownList ID="ddlPrecinto" runat="server" AutoPostBack="True" DataSourceID="odsRecinto"
        DataTextField="recinto_nombre" DataValueField="id_recinto">
                </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dsUniversidadTableAdapters.RecintoTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id_recinto" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="recinto_nombre" Type="String" />
                        <asp:Parameter Name="siglas" Type="String" />
                        <asp:Parameter Name="rec_dir" Type="String" />
                        <asp:Parameter Name="rec_tel" Type="String" />
                        <asp:Parameter Name="Original_id_recinto" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="recinto_nombre" Type="String" />
                        <asp:Parameter Name="siglas" Type="String" />
                        <asp:Parameter Name="rec_dir" Type="String" />
                        <asp:Parameter Name="rec_tel" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnPguardar" runat="server" OnClick="btnPguardar_Click" Text="Guardar" />&nbsp;<asp:Button
                        ID="btnPcancelar" runat="server" OnClick="btnPcancelar_Click" Text="Cancelar" /></td>
            </tr>
        </table>
    </asp:Panel>
    <span style="font-size: 12px; font-family: Arial">
    <br />
    </span>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; font-size: 12px; font-family: Arial;">
        <tr>
            <td style="width: 232px">
                <strong>
                MATRICULA</strong></td>
            <td>
                <strong>
                NOMBRE</strong></td>
            <td style="width: 232px">
                NOTA</td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 232px">
                <asp:Panel ID="pMatricula" runat="server" DefaultButton="btnVerificar" Width="100%">
                    <asp:TextBox ID="txtmatricula" runat="server" Width="150px"></asp:TextBox>
                    <asp:Button ID="btnVerificar" runat="server" OnClick="btnVerificar_Click" Text="Verificar"
                        Width="70px" /></asp:Panel>
                &nbsp;&nbsp;</td>
            <td>
                <asp:Label ID="lblidstudent" runat="server"></asp:Label>
                - &nbsp;<asp:Label ID="lblNombre" runat="server"></asp:Label></td>
            <td style="width: 232px">
                <asp:Panel ID="pNota" runat="server" DefaultButton="btnGuardar" Width="100%">
                    <asp:TextBox ID="lblnota" runat="server" Width="150px"></asp:TextBox>
                    <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar"
                        Width="70px" /></asp:Panel>
                &nbsp;
            </td>
            <td align="center">
                <asp:Button ID="btnNuevo" runat="server" OnClick="btnNuevo_Click" Text="NUEVO" /></td>
        </tr>
    </table>
    <span style="font-size: 12px; font-family: Arial"></span>
    <asp:Label ID="lblmsg" runat="server" Width="553px"></asp:Label><br />
    <asp:Button ID="btnConsulta" runat="server" Text="CONSULTA MATRICULA" /><br />
    <span style="font-size: 12px; font-family: Arial"><strong>NOMENCLATURA DE NOTAS</strong><br />
        A = 90 - 100<br />
        B = 80 - 89<br />
        C = 70 - 79<br />
        D= 60&nbsp; - 69<br />
        F = 0 &nbsp; - 59<br />
        VAL = VALIDADA<br />
        CONV = CONVALIDADA<br />
        R =&nbsp; RETIRADA<br />
        I = INCOMPLETA<br />
        E = EXONERADA</span>
</asp:Content>

