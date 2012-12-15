<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertestudiante.aspx.cs" Inherits="insertestudiante"  %>

<%@ Register Src="controles/insertEstudiante.ascx" TagName="insertEstudiante" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertEstudiante ID="InsertEstudiante1" runat="server" />
</asp:Content>

