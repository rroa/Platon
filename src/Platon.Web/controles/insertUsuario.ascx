<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertUsuario.ascx.cs" Inherits="controles_insertUsuario" %>
<%@  Register TagPrefix="ew"   Namespace="eWorld.UI.Compatibility"  Assembly="eWorld.UI.Compatibility" %>

<span style="font-size: 24px; font-family: Arial">USUARIOS DEL SISTEMA
    <hr />
</span>
<br />

<table border="0" cellpadding="0" cellspacing="0" style="height: 100%">
    <tr>
        <td style="width: 340px" valign="top">
<table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid; border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid; font-family: Arial">
    <tr>
        <td colspan="2" style="padding-left: 5px; border-bottom: black 1px solid; height: 30px; background-color: whitesmoke">
            <strong>
            REGISTRO DE DATOS PERSONALES</strong></td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td style="padding-left: 5px">
            <strong>Nombre</strong></td>
        <td style="padding-left: 5px">
            <asp:TextBox ID="txtnombre" runat="server" Font-Names="Arial" Font-Size="12px" Width="200px" TabIndex="1"></asp:TextBox><span
                style="font-size: 24px; color: #ff0000"><strong>*</strong></span></td>
    </tr>
    <tr>
        <td style="padding-left: 5px">
            <strong>
            Apellido</strong></td>
        <td style="padding-left: 5px">
            <asp:TextBox ID="txtapellido" runat="server" Font-Names="Arial" Font-Size="12px" Width="200px" TabIndex="2"></asp:TextBox><strong><span
                style="font-size: 18pt; color: #ff0000">*</span></strong></td>
    </tr>
    <tr>
        <td style="padding-left: 5px">
            <strong>
            C&eacute;dula</strong></td>
        <td style="padding-left: 5px">
            <ew:MaskedTextBox ID="txtcedula" runat="server" Font-Names="Arial" Font-Size="12px"
                Mask="999-9999999-9" MaxLength="13" ValidationExpression="\d{3}-\d{7}-\d{1}"
                Width="200px" TabIndex="3"></ew:MaskedTextBox><strong><span style="font-size: 18pt;
                    color: #ff0000">*</span></strong></td>
    </tr>
    <tr>
        <td style="padding-left: 5px">
            Sexo</td>
        <td style="padding-left: 5px">
            <asp:RadioButtonList ID="rblsexo" runat="server" RepeatColumns="2" Font-Names="Arial" Font-Size="12px" TabIndex="4">
                <asp:ListItem>F</asp:ListItem>
                <asp:ListItem>M</asp:ListItem>
            </asp:RadioButtonList></td>
    </tr>
    <tr>
        <td style="padding-left: 5px">
            <strong>
            Tel&eacute;fono</strong></td>
        <td style="padding-left: 5px">
            <ew:MaskedTextBox ID="txttelefono" runat="server" Font-Names="Arial" Font-Size="12px"
                Mask="999-999-9999" MaxLength="12" ValidationExpression="\d{3}-\d{3}-\d{4}" Width="200px" TabIndex="5"></ew:MaskedTextBox><strong><span
                    style="font-size: 18pt; color: #ff0000">*</span></strong></td>
    </tr>
    <tr>
        <td style="padding-left: 5px">
            Direcci&oacute;n</td>
        <td style="padding-left: 5px">
            <asp:TextBox ID="txtdireccion" runat="server" TextMode="MultiLine" Font-Names="Arial" Font-Size="12px" Width="200px" TabIndex="6"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="padding-left: 5px">
            Lugar de Nacimiento</td>
        <td style="padding-left: 5px">
            <asp:TextBox ID="txtlugarnacimiento" runat="server" Font-Names="Arial" Font-Size="12px" Width="200px" TabIndex="7"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="padding-left: 5px">
            Fecha de Nacimiento</td>
        <td style="padding-left: 5px">
            d
            <asp:TextBox ID="fnac_dia" runat="server" Width="41px" Font-Names="Arial" Font-Size="12px" TabIndex="8"></asp:TextBox>
            m
            <asp:TextBox ID="fnac_mes" runat="server" Width="46px" Font-Names="Arial" Font-Size="12px" TabIndex="9"></asp:TextBox>
            a
            <asp:TextBox ID="fnac_ano" runat="server" Width="43px" Font-Names="Arial" Font-Size="12px" TabIndex="10"></asp:TextBox><strong><span
                style="font-size: 18pt; color: #ff0000">*</span></strong></td>
    </tr>
    <tr>
        <td style="padding-left: 5px">
            Estado Civil</td>
        <td style="padding-left: 5px">
            <asp:DropDownList ID="ddlestadocivil" runat="server" Font-Names="Arial" Font-Size="12px" Width="200px" TabIndex="11">
                <asp:ListItem>Soltero</asp:ListItem>
                <asp:ListItem>Casado</asp:ListItem>
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td style="padding-left: 5px">
            Rol</td>
        <td style="padding-left: 5px">
            <asp:DropDownList ID="ddlrol" runat="server" DataSourceID="objRol" DataTextField="descripcion" DataValueField="id_rol" Font-Names="Arial" Font-Size="12px" Width="200px" TabIndex="12">
            </asp:DropDownList><asp:ObjectDataSource ID="objRol" runat="server" DeleteMethod="Delete"
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                TypeName="dsUniversidadTableAdapters.RolTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id_rol" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="Original_id_rol" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
        </td>
    </tr>
</table>
        </td>
        <td style="width: 30px" valign="top">
        </td>
        <td style="width: 331px" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="border-right: black 1px solid;
                border-top: black 1px solid; font-size: 12px; border-left: black 1px solid; border-bottom: black 1px solid;
                font-family: Arial">
                <tr>
                    <td colspan="2" style="border-right: black 1px solid; border-top: black 1px solid;
                        padding-left: 5px; border-left: black 1px solid; border-bottom: black 1px solid;
                        height: 30px; background-color: whitesmoke">
                        <strong>DATOS DEL SISTEMA</strong></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>Nombre de Usuario</strong></td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtusername" runat="server" Font-Names="Arial" Font-Size="12px" Width="200px" TabIndex="13"></asp:TextBox><strong><span
                            style="font-size: 18pt; color: #ff0000">*</span></strong></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>Clave</strong></td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtclave" runat="server" Font-Names="Arial" Font-Size="12px" Width="200px" TabIndex="14" TextMode="Password"></asp:TextBox><strong><span
                            style="font-size: 18pt; color: #ff0000">*</span></strong></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        <strong>Confirmar Clave</strong></td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtclaveconf" runat="server" Font-Names="Arial" Font-Size="12px"
                            TabIndex="14" TextMode="Password" Width="200px"></asp:TextBox><br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtclave"
                            ControlToValidate="txtclaveconf" ErrorMessage="Las claves deben ser iguales"></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        Pregunta Secreta</td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtpregunta" runat="server" Font-Names="Arial" Font-Size="12px" TextMode="MultiLine"
                            Width="200px" TabIndex="15"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="padding-left: 5px">
                        Respuesta</td>
                    <td style="padding-left: 5px">
                        <asp:TextBox ID="txtrespuesta" runat="server" Font-Names="Arial" Font-Size="12px" TextMode="MultiLine"
                            Width="200px" TabIndex="16"></asp:TextBox></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="width: 340px; height: 25px" valign="top">
        </td>
        <td style="width: 30px; height: 25px" valign="top">
        </td>
        <td style="width: 331px; height: 25px" valign="top">
        </td>
    </tr>
    <tr>
        <td align="left" colspan="3" style="height: 31px" valign="top">
            <span style="font-size: 12px; font-family: Arial"><strong>Nota:<br />
            </strong>Los campos marcados con asterisco (<span style="font-size: 24px; color: #ff0000">*</span>)
                deben ser completados obligatoriamente.</span></td>
    </tr>
    <tr>
        <td align="center" colspan="3" style="height: 31px" valign="top">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" colspan="3" style="border-right: black 1px solid; border-top: black 1px solid;
            border-left: black 1px solid; border-bottom: black 1px solid; height: 40px" valign="middle">
            &nbsp;<asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                OnClick="btnGuardar_Click" />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
                OnClick="ImageButton1_Click" />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/images/botones/btn_cancelar.jpg"
                OnClick="btnCancelar_Click" /></td>
    </tr>
</table>
