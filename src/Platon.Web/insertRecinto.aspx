<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertRecinto.aspx.cs" Inherits="insertRecinto"  %>

<%@ Register Src="controles/insertRecinto.ascx" TagName="insertRecinto" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertRecinto ID="InsertRecinto1" runat="server" />
</asp:Content>

