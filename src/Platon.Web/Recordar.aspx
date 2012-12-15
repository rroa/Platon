<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Recordar.aspx.cs" Inherits="Recordar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>TIC-SCHOOL</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center">
        <table border="0" cellpadding="0" cellspacing="0" style="font-size: 13px; font-family: Arial; border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;">
            <tr>
                <td align="left" colspan="3" style="border-right: black 1px solid; border-top: black 1px solid;
                    border-left: black 1px solid; border-bottom: black 1px solid; background-color: #006699;">
                    <img src="images/TIC_SCHOOL.gif" /></td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 18px">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 16px">
                    <strong>
                    Recordatorio de Contrase&ntilde;a</strong></td>
            </tr>
            <tr>
                <td style="width: 239px; height: 20px;">
                </td>
                <td style="height: 20px">
                </td>
                <td style="height: 20px">
                </td>
            </tr>
            <tr>
                <td style="background-color: whitesmoke">
                    <strong>Escriba su &nbsp;nombre de usuario :</strong>
                </td>
                <td style="background-color: whitesmoke">
        <asp:TextBox ID="txtusername" runat="server"></asp:TextBox></td>
                <td style="background-color: whitesmoke">
                    <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/botones/btn_buscar.jpg"
                        OnClick="btnBuscar_Click1" /></td>
            </tr>
            <tr>
                <td style="height: 20px; width: 239px;">
                </td>
                <td style="height: 20px;">
                </td>
                <td style="height: 20px">
                </td>
            </tr>
            <tr>
                <td style="width: 239px; background-color: gainsboro">
                    <strong>Pregunta Secreta :</strong></td>
                <td colspan="2" style="width: 239px; background-color: gainsboro">
        <asp:Label ID="lblPregunta" runat="server" Font-Bold="True"></asp:Label></td>
            </tr>
            <tr>
                <td style="height: 19px; width: 239px;">
                </td>
                <td style="height: 19px;">
                </td>
                <td style="height: 19px">
                </td>
            </tr>
            <tr>
                <td style="background-color: lightgrey">
                    <strong>
        Respuesta Secreta:</strong></td>
                <td style="background-color: lightgrey">
        <asp:TextBox ID="txtrespuesta" runat="server"></asp:TextBox></td>
                <td style="background-color: lightgrey">
                    <asp:ImageButton ID="btnVerClave" runat="server" ImageUrl="~/images/botones/btn_verclave.jpg"
                        OnClick="btnVerClave_Click1" /></td>
            </tr>
            <tr>
                <td style="height: 20px; width: 239px;">
                </td>
                <td style="height: 20px">
                </td>
                <td style="height: 20px">
                </td>
            </tr>
            <tr>
                <td style="width: 239px; background-color: darkgray">
                    <strong>Su clave es :</strong></td>
                <td colspan="2" style="width: 239px; background-color: darkgray">
        <asp:Label ID="lblclave" runat="server" Font-Bold="True"></asp:Label></td>
            </tr>
        </table>
        <br />
        <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
            ForeColor="Red"></asp:Label><br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Entrada.aspx" Font-Bold="True" Font-Names="Arial" Font-Size="9pt">Regresar al LogIn</asp:HyperLink></div>
    </form>
</body>
</html>
