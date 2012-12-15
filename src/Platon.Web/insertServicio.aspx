<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertServicio.aspx.cs" Inherits="insertServicio"  %>

<%@ Register Src="controles/insertServicios.ascx" TagName="insertServicios" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertServicios ID="InsertServicios1" runat="server" />
</asp:Content>

