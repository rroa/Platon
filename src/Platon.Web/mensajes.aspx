<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="mensajes.aspx.cs" Inherits="mensajes"  %>

<%@ Register Src="controles/mensajes.ascx" TagName="mensajes" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:mensajes ID="Mensajes1" runat="server" />
</asp:Content>

