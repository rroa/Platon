<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertProfesores.ascx.cs" Inherits="controles_insertProfesoresl" %>
<%@  Register TagPrefix="ew"   Namespace="eWorld.UI.Compatibility"  Assembly="eWorld.UI.Compatibility" %>
<span style="font-size: 24px; font-family: Arial">PROFESORES
    <hr />
</span>
<br />
<table border="0" cellpadding="0" cellspacing="0" style="font-size: 12px; font-family: Arial; border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;">
    <tr>
        <td colspan="2" style="height: 30px; background-color: whitesmoke; border-bottom: black 1px solid;">
            <strong>DATOS PERSONALES DE PROFESOR</strong></td>
        <td colspan="1" style="width: 123px; border-bottom: black 1px solid; height: 30px;
            background-color: whitesmoke">
        </td>
        <td colspan="1" style="width: 193px; border-bottom: black 1px solid; height: 30px;
            background-color: whitesmoke">
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
        </td>
        <td style="width: 123px">
        </td>
        <td style="width: 193px">
        </td>
    </tr>
    <tr>
        <td style="padding-left: 5px; height: 19px">
            <strong>Nombre</strong></td>
        <td style="padding-left: 5px; height: 19px">
            <asp:TextBox ID="txtnombre" runat="server" Font-Names="Arial" Font-Size="12px" Width="200px" TabIndex="1"></asp:TextBox><span
                style="font-size: 24px; color: #ff0000">*</span></td>
        <td style="padding-left: 5px; width: 123px; height: 19px">
            <strong>Nombre de Usuario</strong></td>
        <td style="padding-left: 5px; width: 193px; height: 19px">
            <asp:TextBox ID="txtusername" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="padding-left: 5px; height: 19px">
            <strong>Apellido</strong></td>
        <td style="padding-left: 5px; height: 19px">
            <asp:TextBox ID="txtapellido" runat="server" Font-Names="Arial" Font-Size="12px" Width="200px" TabIndex="2"></asp:TextBox><span
                style="font-size: 18pt; color: #ff0000">*</span></td>
        <td style="padding-left: 5px; width: 123px; height: 19px">
            <strong>Clave</strong></td>
        <td style="padding-left: 5px; width: 193px; height: 19px">
            <asp:TextBox ID="txtpasswd" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="padding-left: 5px; height: 19px">
            <strong>C&eacute;dula</strong></td>
        <td style="padding-left: 5px; height: 19px">
            <span
                style="font-size: 18pt; color: #ff0000">
                <ew:MaskedTextBox ID="txtcedula" runat="server" Font-Names="Arial" Font-Size="12px"
                    Mask="999-9999999-9" MaxLength="13" TabIndex="3" ValidationExpression="\d{3}-\d{7}-\d{1}"
                    Width="200px"></ew:MaskedTextBox>*</span></td>
        <td style="padding-left: 5px; width: 123px; height: 19px">
        </td>
        <td style="padding-left: 5px; width: 193px; height: 19px">
        </td>
    </tr>
    <tr>
        <td style="padding-left: 5px">
            Sexo</td>
        <td style="padding-left: 5px">
            <asp:RadioButtonList ID="rblSexo" runat="server" Font-Names="Arial" Font-Size="13px"
                RepeatColumns="2">
                <asp:ListItem>Femenino</asp:ListItem>
                <asp:ListItem>Masculino</asp:ListItem>
            </asp:RadioButtonList></td>
        <td style="padding-left: 5px; width: 123px">
        </td>
        <td style="padding-left: 5px; width: 193px">
        </td>
    </tr>
    <tr>
        <td style="padding-left: 5px; height: 19px">
            Estado Civil</td>
        <td style="padding-left: 5px; height: 19px">
            <asp:DropDownList ID="ddlestadocivil" runat="server">
                <asp:ListItem>Soltero</asp:ListItem>
                <asp:ListItem>Casado</asp:ListItem>
            </asp:DropDownList></td>
        <td style="padding-left: 5px; width: 123px; height: 19px">
        </td>
        <td style="padding-left: 5px; width: 193px; height: 19px">
        </td>
    </tr>
    <tr>
        <td style="padding-left: 5px; height: 19px">
            Fecha de Nacimiento</td>
        <td style="padding-left: 5px; height: 19px">
            d<asp:TextBox ID="fnac_dia" runat="server" Font-Names="Arial" Font-Size="12px"
                Width="50px" TabIndex="4">01</asp:TextBox>
            m<asp:TextBox ID="fnac_mes" runat="server" Font-Names="Arial" Font-Size="12px"
                Width="50px" TabIndex="5">01</asp:TextBox>
            a<asp:TextBox ID="fnac_ano" runat="server" Font-Names="Arial" Font-Size="12px"
                Width="50px" TabIndex="6">1900</asp:TextBox><span style="font-size: 18pt; color: #ff0000">*<br />
                    <span style="font-size: 8pt">Ej: 23/02/1956</span></span></td>
        <td style="padding-left: 5px; width: 123px; height: 19px">
            Escuela Principal</td>
        <td style="padding-left: 5px; width: 193px; height: 19px">
            <asp:TextBox ID="txtescuela" runat="server" Width="197px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="padding-left: 5px; height: 19px">
            Fecha de Ingreso</td>
        <td style="padding-left: 5px; height: 19px">
            <asp:TextBox ID="txtfechaIngreso" runat="server"></asp:TextBox><br />
            <span style="color: #ff0000">Ej: mm/dd/aaaa</span></td>
        <td style="padding-left: 5px; width: 123px; height: 19px">
            Profesion</td>
        <td style="padding-left: 5px; width: 193px; height: 19px">
            <asp:TextBox ID="txtprofesion" runat="server" Width="197px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="padding-left: 5px; height: 19px">
            Tel&eacute;fono</td>
        <td style="padding-left: 5px; height: 19px">
            <span
                style="font-size: 18pt; color: #ff0000">
                <ew:MaskedTextBox ID="txtelefono" runat="server" Font-Names="Arial" Font-Size="12px"
                    Mask="999-999-9999" MaxLength="12" TabIndex="8" ValidationExpression="\d{3}-\d{3}-\d{4}"
                    Width="200px"></ew:MaskedTextBox>*</span></td>
        <td style="padding-left: 5px; width: 123px; height: 19px">
            Especialidad</td>
        <td style="padding-left: 5px; width: 193px; height: 19px">
            <asp:TextBox ID="txtespecialidad" runat="server" Width="197px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="padding-left: 5px; height: 19px">
            Célular</td>
        <td style="padding-left: 5px; height: 19px">
            <ew:MaskedTextBox ID="txtcelular" runat="server" Font-Names="Arial" Font-Size="12px"
                Mask="999-999-9999" MaxLength="12" TabIndex="8" ValidationExpression="\d{3}-\d{3}-\d{4}"
                Width="200px"></ew:MaskedTextBox></td>
        <td style="padding-left: 5px; width: 123px; height: 19px">
        </td>
        <td style="padding-left: 5px; width: 193px; height: 19px">
        </td>
    </tr>
    <tr>
        <td style="padding-left: 5px; height: 19px">
            Correo</td>
        <td style="padding-left: 5px; height: 19px">
            <asp:TextBox ID="txtcorreo" runat="server" Width="200px"></asp:TextBox></td>
        <td style="padding-left: 5px; width: 123px; height: 19px">
        </td>
        <td style="padding-left: 5px; width: 193px; height: 19px">
        </td>
    </tr>
    <tr>
        <td style="padding-left: 5px; height: 19px">
            Direcci&oacute;n</td>
        <td style="padding-left: 5px; height: 19px">
            <asp:TextBox ID="txtdireccion" runat="server" Font-Names="Arial" Font-Size="12px" Width="200px" TextMode="MultiLine" TabIndex="9"></asp:TextBox></td>
        <td style="padding-left: 5px; width: 123px; height: 19px">
        </td>
        <td style="padding-left: 5px; width: 193px; height: 19px">
        </td>
    </tr>
    <tr>
        <td style="padding-left: 5px; height: 19px">
        </td>
        <td style="padding-left: 5px; height: 19px">
        </td>
        <td style="padding-left: 5px; width: 123px; height: 19px">
        </td>
        <td style="padding-left: 5px; width: 193px; height: 19px">
        </td>
    </tr>
    <tr>
        <td align="left" colspan="4" style="height: 33px">
            <strong>Nota:<br />
            </strong>Los campos marcados con asterisco (<span style="font-size: 18pt; color: #ff0000">*</span>)
            deben ser completados obligatoriamente</td>
    </tr>
    <tr>
        <td align="center" colspan="4" style="height: 33px">
            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="15px"></asp:Label></td>
    </tr>
    <tr>
        <td style="height: 19px" align="right" colspan="2">
            &nbsp;<asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/images/botones/btn_guardar.jpg"
                OnClick="btnGuardar_Click" TabIndex="10" />&nbsp;
            <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/images/botones/btn_cancelar.jpg"
                OnClick="btnCancelar_Click" TabIndex="11" />&nbsp;
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_nuevo.jpg"
                OnClick="ImageButton1_Click" /></td>
        <td align="right" colspan="1" style="width: 123px; height: 19px">
        </td>
        <td align="right" colspan="1" style="width: 193px; height: 19px">
        </td>
    </tr>
</table>
