<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertHorario.aspx.cs" Inherits="insertHorario"  %>

<%@ Register Src="controles/insertHorario.ascx" TagName="insertHorario" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertHorario ID="InsertHorario1" runat="server" />
</asp:Content>

