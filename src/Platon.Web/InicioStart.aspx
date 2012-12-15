<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="InicioStart.aspx.cs" Inherits="InicioStart"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 13pt; font-family: Arial"><span style="font-size: 24px">
    SISTEMA DE ADMINISTRACION Y REGISTRO 
        <hr />
    </span>
    <br />
        <strong><span style="font-size: 12px">
    BIENVENIDO SR/SRA </span></strong></span>
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial"></asp:Label><br />
    <br />
    <span style="font-size: 12px; font-family: Arial"><strong>
    FECHA&nbsp; </strong></span>
    <asp:Label ID="lblfecha" runat="server" Font-Bold="True" Font-Names="Arial"></asp:Label><br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/cambiarclave.aspx">Cambiar mi clave de acceso</asp:HyperLink><br />
    <br />
    <span><strong><span style="font-family: Arial"><span style="font-size: 12px">Mensajes administrativos </span>
        <hr/>
    </span>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%; font-family: Arial;">
            <tr>
                <td align="left" valign="top">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="id_msg" DataSourceID="objMensajes">
            <ItemTemplate>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left" style="height: 25px" valign="top">
                            <asp:Label ID="tituloLabel" runat="server" Font-Names="Arial" ForeColor="Blue"
                                Text='<%# Eval("titulo") %>' Font-Size="12px"></asp:Label></td>
                        <td align="right" style="height: 25px" valign="top">
                            <asp:Label ID="fecha_postLabel" runat="server" Font-Names="Arial" Font-Size="10px"
                                Text='<%# Eval("fecha_post", "{0:d}") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2" style="height: 18px">
                            <asp:Label ID="mensajeLabel" runat="server" Font-Bold="False" Font-Names="Arial"
                                Text='<%# Eval("mensaje") %>' Width="302px" Font-Size="12px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2" style="height: 25px" valign="bottom">
                            <span style="font-size: 10px; color: #0000ff">Publicado por :</span><asp:Label ID="autorLabel"
                                runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="10px" ForeColor="#0000FF"
                                Text='<%# Eval("autor") %>'></asp:Label></td>
                    </tr>
                </table>
                <hr/>
            </ItemTemplate>
        </asp:DataList></td>
                <td align="center" valign="middle">
                    </td>
            </tr>
        </table>
        <br />
        <asp:ObjectDataSource ID="objMensajes" runat="server" DeleteMethod="Delete"
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetMensajeByActivo"
            TypeName="dsUniversidadTableAdapters.tblMensajeTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id_msg" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="fecha_post" Type="DateTime" />
                <asp:Parameter Name="titulo" Type="String" />
                <asp:Parameter Name="mensaje" Type="String" />
                <asp:Parameter Name="autor" Type="String" />
                <asp:Parameter Name="activo" Type="Boolean" />
                <asp:Parameter Name="Original_id_msg" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="fecha_post" Type="DateTime" />
                <asp:Parameter Name="titulo" Type="String" />
                <asp:Parameter Name="mensaje" Type="String" />
                <asp:Parameter Name="autor" Type="String" />
                <asp:Parameter Name="activo" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <span style="font-family: Arial"></span>
    </strong></span>
</asp:Content>

