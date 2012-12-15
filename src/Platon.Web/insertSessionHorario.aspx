<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertSessionHorario.aspx.cs" Inherits="insertSessionHorario"  %>

<%@ Register Src="controles/insertSessionHorario.ascx" TagName="insertSessionHorario"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertSessionHorario ID="InsertSessionHorario1" runat="server" />
</asp:Content>

