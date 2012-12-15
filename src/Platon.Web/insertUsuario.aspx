<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertUsuario.aspx.cs" Inherits="insertUsuario"  %>

<%@ Register Src="controles/insertUsuario.ascx" TagName="insertUsuario" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertUsuario ID="InsertUsuario1" runat="server" />
</asp:Content>

