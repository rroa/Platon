<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertPensum.aspx.cs" Inherits="insertPensum"  %>

<%@ Register Src="controles/insertPensum.ascx" TagName="insertPensum" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertPensum ID="InsertPensum1" runat="server" />
</asp:Content>

