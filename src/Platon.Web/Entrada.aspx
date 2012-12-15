<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Entrada.aspx.cs" Inherits="Entrada" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Entrada a TIC SCHOOL</title>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnAccesUfhe">
    <div align=center>
        <table style="width: 560px">
            <tr>
                <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                    border-bottom: black 1px solid; background-color: #006699;" align="left">
                    <img src="images/TIC_SCHOOL.gif" /></td>
            </tr>
            <tr>
                <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                    border-bottom: black 1px solid; height: 20px">
                </td>
            </tr>
            <tr>
                <td align="center" style="border-right: black 1px solid; border-top: black 1px solid;
                    border-left: black 1px solid; border-bottom: black 1px solid">
        <table style="font-size: 12px; font-family: Arial">
            <tr>
                <td colspan="2" align="center" style="border-bottom: black 1px solid">
                    <strong>Acceso a UNNATEC</strong></td>
            </tr>
            <tr>
                <td align="right">
                    Nombre de Usuario</td>
                <td align="left">
                    <asp:TextBox ID="txtnomusuar" runat="server" Font-Names="Arial" Font-Size="12px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right">
                    Clave</td>
                <td align="left">
                    <asp:TextBox ID="txtpasscla" runat="server" Font-Names="Arial" Font-Size="12px"
                        TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="height: 18px">
                    </td>
                <td align="left" style="height: 18px">
                    <asp:ImageButton ID="btnAccesUfhe" runat="server" ImageUrl="~/images/botones/btn_entrar.jpg"
                        OnClick="ImageButton1_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="8pt" NavigateUrl="~/Recordar.aspx">Olvidaste tu clave?</asp:HyperLink></td>
            </tr>
        </table>
                </td>
            </tr>
            <tr>
                <td align="center" style="border-right: black 1px solid; border-top: black 1px solid;
                    border-left: black 1px solid; border-bottom: black 1px solid">
                    <span style="font-size: 10pt; color: #ff0000; font-family: Calibri">TECNOLOGIA INTEGRAL
                        DEL CARIBE, S.A.</span></td>
            </tr>
        </table>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
