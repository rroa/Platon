<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="CxCestudiante.aspx.cs" Inherits="CxCestudiante"  %>

<%@ Register Src="controles/cxcestudiante.ascx" TagName="cxcestudiante" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:cxcestudiante ID="Cxcestudiante1" runat="server" />
</asp:Content>

