<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertCarrera.aspx.cs" Inherits="insertCarrera"  %>

<%@ Register Src="controles/insertCarrera.ascx" TagName="insertCarrera" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertCarrera ID="InsertCarrera1" runat="server" />
</asp:Content>

