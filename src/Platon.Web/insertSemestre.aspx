<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="insertSemestre.aspx.cs" Inherits="insertSemestre"  %>

<%@ Register Src="controles/insertSemestre.ascx" TagName="insertSemestre" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:insertSemestre ID="InsertSemestre1" runat="server" />
    <a href="insertSemestre.aspx"></a>
</asp:Content>

