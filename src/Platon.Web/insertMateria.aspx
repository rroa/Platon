<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertMateria.aspx.cs" Inherits="insertMateria"  %>

<%@ Register Src="controles/insertMateria.ascx" TagName="insertMateria" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertMateria ID="InsertMateria1" runat="server" />
</asp:Content>

