<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertCostoCredito.aspx.cs" Inherits="insertCostoCredito"  %>

<%@ Register Src="controles/insertCosto_Credito.ascx" TagName="insertCosto_Credito"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertCosto_Credito ID="InsertCosto_Credito1" runat="server" />
</asp:Content>

