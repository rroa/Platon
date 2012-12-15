<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ModificacionCalificaciones.aspx.cs" Inherits="ModificacionCalificaciones" Title="UNIREMHOS" %>

<%@ Register Src="controles/modificacionCalificaciones.ascx" TagName="modificacionCalificaciones"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:modificacionCalificaciones ID="ModificacionCalificaciones1" runat="server" />
</asp:Content>

