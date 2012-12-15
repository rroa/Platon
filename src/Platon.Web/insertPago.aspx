<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertPago.aspx.cs" Inherits="insertPago"  %>

<%@ Register Src="controles/insertPago.ascx" TagName="insertPago" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertPago ID="InsertPago1" runat="server" />
</asp:Content>

