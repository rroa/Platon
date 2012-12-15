<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertarPeriodo.aspx.cs" Inherits="insertarPeriodo"  %>

<%@ Register Src="controles/insertPeriodo.ascx" TagName="insertPeriodo" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertPeriodo ID="InsertPeriodo1" runat="server" />
</asp:Content>

