<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="InsertSession.aspx.cs" Inherits="InsertSession"  %>

<%@ Register Src="controles/insertSession.ascx" TagName="insertSession" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertSession ID="InsertSession1" runat="server" />
</asp:Content>

