<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="mantUsuario.aspx.cs" Inherits="mantUsuario"  %>

<%@ Register Src="controles/mantUsusario.ascx" TagName="mantUsusario" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:mantUsusario ID="MantUsusario1" runat="server" />
</asp:Content>

