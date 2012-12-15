<%@ Page Language="C#" MasterPageFile="~/mpDirectiva.master" AutoEventWireup="true" CodeFile="Insert_StudentManual.aspx.cs" Inherits="Insert_StudentManual" %>

<%@ Register Src="controles/insertSession_StudentManual.ascx" TagName="insertSession_StudentManual"
    TagPrefix="uc2" %>

<%@ Register Src="controles/insertSession_StudentManual.ascx" TagName="insertSession_StudentManual"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc2:insertSession_StudentManual ID="InsertSession_StudentManual1" runat="server" />
</asp:Content>

