<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ResumenDiario.aspx.cs" Inherits="ResumenDiario"  %>

<%@ Register Src="controles/resumendiario.ascx" TagName="resumendiario" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:resumendiario ID="Resumendiario1" runat="server" />
</asp:Content>

