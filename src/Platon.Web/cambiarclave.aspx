<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="cambiarclave.aspx.cs" Inherits="cambiarclave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span style="font-size: 20px"><span style="font-family: Arial">CAMBIAR MI CLAVE DE ACCESO</span>
        <hr />
    </span>
    <table border="0" cellpadding="0" cellspacing="0" style="font-size: 9pt; font-family: Arial">
        <tr>
            <td>
                Clave anterior&nbsp;</td>
            <td>
                <asp:TextBox ID="txtclaveant" runat="server" TextMode="Password"></asp:TextBox><br />
            </td>
        </tr>
        <tr>
            <td>
                Nueva clave</td>
            <td>
                <asp:TextBox ID="txtnuevaclave" runat="server" TextMode="Password"></asp:TextBox><br />
            </td>
        </tr>
        <tr>
            <td style="height: 24px">
                Repetir nueva clave</td>
            <td style="height: 24px">
                <asp:TextBox ID="txtnuevaclave2" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtnuevaclave"
                    ControlToValidate="txtnuevaclave2" ErrorMessage="Las claves deben ser iguales"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td style="height: 25px">
            </td>
            <td style="height: 25px">
                <span style="color: #ffffff">.</span></td>
        </tr>
        <tr>
            <td>
                Pregunta secreta</td>
            <td>
                <asp:TextBox ID="txtpregunta" runat="server" TextMode="MultiLine"></asp:TextBox><br />
            </td>
        </tr>
        <tr>
            <td>
                Respuesta secreta</td>
            <td>
                <asp:TextBox ID="txtrespuesta" runat="server" TextMode="MultiLine"></asp:TextBox><br />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 20px">
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True"></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 19px">
            </td>
            <td style="height: 19px">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/botones/btn_actualizar.jpg"
                    OnClick="ImageButton1_Click" />&nbsp;
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/arrow1_w.gif"
                    OnClick="ImageButton2_Click" /></td>
        </tr>
    </table>
</asp:Content>

