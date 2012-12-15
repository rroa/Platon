<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertCiclo.aspx.cs" Inherits="insertCiclo"  %>

<%@ Register Src="controles/insertCiclo.ascx" TagName="insertCiclo" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertCiclo ID="InsertCiclo1" runat="server" />
</asp:Content>

